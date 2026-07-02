import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/data/datasource/user/user_budget_request_datasource.dart';
import 'package:warehouse/data/model/request/budget_request_request_model.dart';
import 'package:warehouse/data/model/response/budget_request_response_model.dart';
import 'package:warehouse/presentation/bloc/user/user_budget_request/user_budget_request_bloc.dart';

class UserBudgetRequestFormPage extends StatelessWidget {
  /// Jika [existing] diisi → mode edit, sebaliknya mode buat baru
  final BudgetRequestModel? existing;
  const UserBudgetRequestFormPage({super.key, this.existing});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBudgetRequestBloc(UserBudgetRequestDatasource()),
      child: _FormView(existing: existing),
    );
  }
}

class _FormView extends StatefulWidget {
  final BudgetRequestModel? existing;
  const _FormView({this.existing});

  @override
  State<_FormView> createState() => _FormViewState();
}

class _FormViewState extends State<_FormView> {
  final _formKey = GlobalKey<FormState>();

  // Controllers header
  final _divisiCtrl = TextEditingController();
  final _kodeAkunCtrl = TextEditingController();
  final _namaAkunCtrl = TextEditingController();
  final _keteranganCtrl = TextEditingController();
  final _alasanLuarRabCtrl = TextEditingController();
  final _dampakCtrl = TextEditingController();

  String _jenis = 'rab'; // rab | luar_rab
  String _urgensi = 'normal'; // normal | mendesak
  String? _sumberDana; // realokasi | tambahan | lainnya
  DateTime _tanggalPengajuan = DateTime.now();

  // Dynamic item rows
  final List<_ItemRow> _rows = [];

  bool get _isEdit => widget.existing != null;

  @override
  void initState() {
    super.initState();
    if (_isEdit) {
      final e = widget.existing!;
      _divisiCtrl.text = e.divisi;
      _kodeAkunCtrl.text = e.kodeAkun ?? '';
      _namaAkunCtrl.text = e.namaAkun ?? '';
      _keteranganCtrl.text = e.keterangan ?? '';
      _alasanLuarRabCtrl.text = e.alasanLuarRab ?? '';
      _dampakCtrl.text = e.dampakJikaTidak ?? '';
      _jenis = e.jenis;
      _urgensi = e.urgensi;
      _sumberDana = e.sumberDana;
      if (e.tanggalPengajuan != null) {
        _tanggalPengajuan =
            DateTime.tryParse(e.tanggalPengajuan!) ?? DateTime.now();
      }
      for (final item in e.items) {
        _rows.add(_ItemRow(
          namaItem: item.namaItem,
          qty: item.qty,
          satuan: item.satuan ?? 'unit',
          estimasiBiaya: item.estimasiBiaya,
          keterangan: item.keterangan,
        ));
      }
    }
    if (_rows.isEmpty) _rows.add(_ItemRow());
  }

  @override
  void dispose() {
    _divisiCtrl.dispose();
    _kodeAkunCtrl.dispose();
    _namaAkunCtrl.dispose();
    _keteranganCtrl.dispose();
    _alasanLuarRabCtrl.dispose();
    _dampakCtrl.dispose();
    super.dispose();
  }

  double get _grandTotal =>
      _rows.fold(0.0, (sum, r) => sum + r.subtotal);

  void _addRow() => setState(() => _rows.add(_ItemRow()));

  void _removeRow(int index) {
    if (_rows.length == 1) return;
    setState(() => _rows.removeAt(index));
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_rows.any((r) => r.namaItem.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nama item tidak boleh kosong.')));
      return;
    }
    if (_rows.any((r) => r.estimasiBiaya <= 0)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Estimasi biaya setiap item wajib diisi.')));
      return;
    }
    if (_jenis == 'luar_rab' && _alasanLuarRabCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content:
              Text('Alasan Luar RAB wajib diisi untuk jenis Luar RAB.')));
      return;
    }

    final model = StoreBudgetRequestModel(
      divisi: _divisiCtrl.text.trim(),
      tanggalPengajuan: DateFormat('yyyy-MM-dd').format(_tanggalPengajuan),
      jenis: _jenis,
      kodeAkun: _kodeAkunCtrl.text.trim(),
      namaAkun: _namaAkunCtrl.text.trim(),
      keterangan: _keteranganCtrl.text.trim(),
      alasanLuarRab:
          _jenis == 'luar_rab' ? _alasanLuarRabCtrl.text.trim() : null,
      urgensi: _urgensi,
      dampakJikaTidak: _dampakCtrl.text.trim(),
      sumberDana: _sumberDana,
      items: _rows
          .map((r) => BudgetItemRequestModel(
                namaItem: r.namaItem,
                qty: r.qty,
                satuan: r.satuan,
                estimasiBiaya: r.estimasiBiaya,
                keterangan: r.keterangan,
              ))
          .toList(),
    );

    if (_isEdit) {
      context.read<UserBudgetRequestBloc>().add(
            UserBudgetRequestEvent.update(
                id: widget.existing!.id, request: model),
          );
    } else {
      context.read<UserBudgetRequestBloc>().add(
            UserBudgetRequestEvent.store(model),
          );
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _tanggalPengajuan,
      firstDate: DateTime.now().subtract(const Duration(days: 30)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => _tanggalPengajuan = picked);
  }

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat('#,##0', 'id_ID');

    return BlocListener<UserBudgetRequestBloc, UserBudgetRequestState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (msg) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(msg)));
            Navigator.pop(context, true);
          },
          error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg), backgroundColor: Colors.red)),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_isEdit ? 'Edit RAB' : 'Buat Pengajuan RAB'),
          backgroundColor: const Color(0xFF1565C0),
          foregroundColor: Colors.white,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Header ──────────────────────────────────
                _SectionTitle('Informasi Umum'),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _divisiCtrl,
                  decoration: _dec('Divisi / Departemen *'),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Wajib diisi' : null,
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: _pickDate,
                  child: AbsorbPointer(
                    child: TextFormField(
                      decoration: _dec(
                        'Tanggal Pengajuan *',
                        suffix: const Icon(Icons.calendar_today, size: 18),
                      ).copyWith(
                        hintText: DateFormat('dd MMM yyyy')
                            .format(_tanggalPengajuan),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _jenis,
                  decoration: _dec('Jenis Pengajuan *'),
                  items: const [
                    DropdownMenuItem(value: 'rab', child: Text('RAB')),
                    DropdownMenuItem(
                        value: 'luar_rab', child: Text('Luar RAB')),
                  ],
                  onChanged: (v) => setState(() => _jenis = v!),
                ),
                if (_jenis == 'luar_rab') ...[
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _alasanLuarRabCtrl,
                    decoration: _dec('Alasan Luar RAB *'),
                    maxLines: 2,
                    validator: (v) => _jenis == 'luar_rab' &&
                            (v == null || v.isEmpty)
                        ? 'Wajib diisi untuk Luar RAB'
                        : null,
                  ),
                ],
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _urgensi,
                  decoration: _dec('Tingkat Urgensi'),
                  items: const [
                    DropdownMenuItem(value: 'normal', child: Text('Normal')),
                    DropdownMenuItem(
                        value: 'mendesak', child: Text('Mendesak')),
                  ],
                  onChanged: (v) => setState(() => _urgensi = v!),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _kodeAkunCtrl,
                  decoration: _dec('Kode Akun (opsional)'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _namaAkunCtrl,
                  decoration: _dec('Nama Akun / Perihal (opsional)'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _keteranganCtrl,
                  decoration: _dec('Keterangan (opsional)'),
                  maxLines: 3,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: _sumberDana,
                  decoration: _dec('Sumber Dana (opsional)'),
                  items: const [
                    DropdownMenuItem(value: null, child: Text('Pilih...')),
                    DropdownMenuItem(
                        value: 'realokasi', child: Text('Realokasi')),
                    DropdownMenuItem(
                        value: 'tambahan', child: Text('Tambahan')),
                    DropdownMenuItem(value: 'lainnya', child: Text('Lainnya')),
                  ],
                  onChanged: (v) => setState(() => _sumberDana = v),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _dampakCtrl,
                  decoration: _dec('Dampak Jika Tidak Disetujui (opsional)'),
                  maxLines: 2,
                ),
                const SizedBox(height: 20),

                // ── Items ────────────────────────────────────
                Row(
                  children: [
                    _SectionTitle('Rincian Item RAB'),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: _addRow,
                      icon: const Icon(Icons.add, size: 16),
                      label: const Text('Tambah Item'),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                ...List.generate(
                  _rows.length,
                  (i) => _ItemRowWidget(
                    key: ValueKey(i),
                    row: _rows[i],
                    index: i + 1,
                    onChanged: () => setState(() {}),
                    onRemove: _rows.length > 1 ? () => _removeRow(i) : null,
                  ),
                ),

                // ── Total ─────────────────────────────────────
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1565C0).withOpacity(0.07),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color(0xFF1565C0).withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total Estimasi',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                        'Rp ${fmt.format(_grandTotal)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF1565C0)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // ── Action button ───────────────────────────
                BlocBuilder<UserBudgetRequestBloc, UserBudgetRequestState>(
                  builder: (context, state) {
                    final loading = state.maybeWhen(
                        loading: () => true, orElse: () => false);
                    return SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1565C0),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: loading ? null : _submit,
                        child: loading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.white, strokeWidth: 2))
                            : Text(_isEdit
                                ? 'Simpan Perubahan'
                                : 'Simpan sebagai Draft'),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                const Text(
                  'Setelah disimpan sebagai draft, kamu bisa mengirimkannya ke Admin dari halaman detail.',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _dec(String label, {Widget? suffix}) => InputDecoration(
        labelText: label,
        suffixIcon: suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      );
}

// ─────────────────────────────────────────────────────────────
//  Data class satu baris item (mutable)
// ─────────────────────────────────────────────────────────────
class _ItemRow {
  String namaItem;
  double qty;
  String satuan;
  double estimasiBiaya;
  String? keterangan;

  _ItemRow({
    this.namaItem = '',
    this.qty = 1,
    this.satuan = 'unit',
    this.estimasiBiaya = 0,
    this.keterangan,
  });

  double get subtotal => qty * estimasiBiaya;
}

// ─────────────────────────────────────────────────────────────
//  Widget satu baris item
// ─────────────────────────────────────────────────────────────
class _ItemRowWidget extends StatefulWidget {
  final _ItemRow row;
  final int index;
  final VoidCallback onChanged;
  final VoidCallback? onRemove;

  const _ItemRowWidget({
    super.key,
    required this.row,
    required this.index,
    required this.onChanged,
    this.onRemove,
  });

  @override
  State<_ItemRowWidget> createState() => _ItemRowWidgetState();
}

class _ItemRowWidgetState extends State<_ItemRowWidget> {
  late TextEditingController _namaCtrl;
  late TextEditingController _qtyCtrl;
  late TextEditingController _satuanCtrl;
  late TextEditingController _biayaCtrl;
  late TextEditingController _ketCtrl;

  @override
  void initState() {
    super.initState();
    final r = widget.row;
    _namaCtrl = TextEditingController(text: r.namaItem);
    _qtyCtrl = TextEditingController(
        text: r.qty == r.qty.roundToDouble()
            ? r.qty.toInt().toString()
            : r.qty.toString());
    _satuanCtrl = TextEditingController(text: r.satuan);
    _biayaCtrl = TextEditingController(
        text: r.estimasiBiaya > 0 ? r.estimasiBiaya.toStringAsFixed(0) : '');
    _ketCtrl = TextEditingController(text: r.keterangan ?? '');
  }

  @override
  void dispose() {
    _namaCtrl.dispose();
    _qtyCtrl.dispose();
    _satuanCtrl.dispose();
    _biayaCtrl.dispose();
    _ketCtrl.dispose();
    super.dispose();
  }

  void _update() {
    widget.row
      ..namaItem = _namaCtrl.text
      ..qty = double.tryParse(_qtyCtrl.text) ?? 1
      ..satuan = _satuanCtrl.text
      ..estimasiBiaya =
          double.tryParse(_biayaCtrl.text.replaceAll('.', '')) ?? 0
      ..keterangan = _ketCtrl.text.isEmpty ? null : _ketCtrl.text;
    widget.onChanged();
  }

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat('#,##0', 'id_ID');
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1565C0),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text('${widget.index}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 8),
                const Expanded(
                    child: Text('Item',
                        style: TextStyle(fontWeight: FontWeight.w600))),
                if (widget.onRemove != null)
                  IconButton(
                    icon: const Icon(Icons.delete_outline,
                        color: Colors.red, size: 20),
                    onPressed: widget.onRemove,
                    tooltip: 'Hapus item',
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _namaCtrl,
              onChanged: (_) => _update(),
              decoration: _dec('Nama Item *'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _qtyCtrl,
                    onChanged: (_) => _update(),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: _dec('Qty'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _satuanCtrl,
                    onChanged: (_) => _update(),
                    decoration: _dec('Satuan'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _biayaCtrl,
              onChanged: (_) => _update(),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: _dec('Estimasi Biaya (Rp) *'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _ketCtrl,
              onChanged: (_) => _update(),
              decoration: _dec('Keterangan (opsional)'),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Subtotal: Rp ${fmt.format(widget.row.subtotal)}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1565C0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _dec(String label) => InputDecoration(
        labelText: label,
        isDense: true,
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);
  @override
  Widget build(BuildContext context) => Text(text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15));
}


