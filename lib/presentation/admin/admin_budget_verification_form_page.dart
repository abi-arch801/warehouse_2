import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/datasource/admin/admin_budget_verification_datasource.dart';
import 'package:warehouse/data/model/request/budget_vverification_request_model.dart';
import 'package:warehouse/data/model/response/budget_verification_response_model.dart';
import 'package:warehouse/presentation/bloc/admin/admin_budget_verification/admin_budget_verification_bloc.dart';

class AdminBudgetVerificationFormPage extends StatefulWidget {
  final int? editId; // null = create baru
  final BudgetVerificationModel? existing;

  /// Diisi otomatis saat form dibuka dari tombol "Setujui" di RAB.
  /// Kalau tidak null, field ID Pengajuan RAB dikunci (read-only).
  final int? budgetRequestId;
  final String? nomorForm;

  const AdminBudgetVerificationFormPage({
    super.key,
    this.editId,
    this.existing,
    this.budgetRequestId,
    this.nomorForm,
  });

  @override
  State<AdminBudgetVerificationFormPage> createState() =>
      _AdminBudgetVerificationFormPageState();
}

class _AdminBudgetVerificationFormPageState
    extends State<AdminBudgetVerificationFormPage> {
  final _formKey = GlobalKey<FormState>();

  int? _selectedBudgetRequestId;

  bool _docForm = false;
  bool _docSurat = false;
  bool _docEstimasi = false;
  bool _docSpesifikasi = false;
  final _docLainnyaCtrl = TextEditingController();

  final _cekAnggaranCtrl = TextEditingController();
  final _analisaCashflowCtrl = TextEditingController();
  String _rekomendasi = 'setuju';
  final _nominalCtrl = TextEditingController();
  final _catatanCtrl = TextEditingController();

  bool get _isEdit => widget.editId != null;

  /// True kalau ID RAB sudah dipastikan dari luar (approval flow),
  /// jadi field-nya tidak boleh diketik ulang.
  bool get _isPrefilled => widget.budgetRequestId != null;

  @override
  void initState() {
    super.initState();
    if (widget.existing != null) {
      final e = widget.existing!;
      _selectedBudgetRequestId = e.budgetRequestId;
      _docForm = e.docFormLengkap;
      _docSurat = e.docSuratJustifikasi;
      _docEstimasi = e.docEstimasiVendor;
      _docSpesifikasi = e.docSpesifikasiTeknis;
      _docLainnyaCtrl.text = e.docLainnya ?? '';
      _cekAnggaranCtrl.text = e.cekAnggaran ?? '';
      _analisaCashflowCtrl.text = e.analisaCashflow ?? '';
      _rekomendasi = e.rekomendasi;
      _nominalCtrl.text = e.nominalRekomendasi?.toStringAsFixed(0) ?? '';
      _catatanCtrl.text = e.catatanFinance ?? '';
    } else if (widget.budgetRequestId != null) {
      _selectedBudgetRequestId = widget.budgetRequestId;
    }
  }

  @override
  void dispose() {
    _docLainnyaCtrl.dispose();
    _cekAnggaranCtrl.dispose();
    _analisaCashflowCtrl.dispose();
    _nominalCtrl.dispose();
    _catatanCtrl.dispose();
    super.dispose();
  }

  StoreBudgetVerificationModel _buildModel() => StoreBudgetVerificationModel(
        budgetRequestId: _selectedBudgetRequestId!,
        docFormLengkap: _docForm,
        docSuratJustifikasi: _docSurat,
        docEstimasiVendor: _docEstimasi,
        docSpesifikasiTeknis: _docSpesifikasi,
        docLainnya:
            _docLainnyaCtrl.text.trim().isEmpty ? null : _docLainnyaCtrl.text.trim(),
        cekAnggaran:
            _cekAnggaranCtrl.text.trim().isEmpty ? null : _cekAnggaranCtrl.text.trim(),
        analisaCashflow: _analisaCashflowCtrl.text.trim().isEmpty
            ? null
            : _analisaCashflowCtrl.text.trim(),
        rekomendasi: _rekomendasi,
        nominalRekomendasi: _nominalCtrl.text.trim().isEmpty
            ? null
            : double.tryParse(_nominalCtrl.text),
        catatanFinance:
            _catatanCtrl.text.trim().isEmpty ? null : _catatanCtrl.text.trim(),
      );

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedBudgetRequestId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Pilih pengajuan RAB terlebih dahulu'),
          backgroundColor: Colors.red));
      return;
    }
    if (_isEdit) {
      context.read<AdminBudgetVerificationBloc>().add(
            AdminBudgetVerificationEvent.update(
              id: widget.editId!,
              request: _buildModel(),
            ),
          );
    } else {
      context.read<AdminBudgetVerificationBloc>().add(
            AdminBudgetVerificationEvent.store(_buildModel()),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AdminBudgetVerificationBloc(AdminBudgetVerificationDatasource()),
      child: BlocConsumer<AdminBudgetVerificationBloc, AdminBudgetVerificationState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (msg) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(msg)));
              Navigator.pop(context, true);
            },
            error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg), backgroundColor: Colors.red)),
            orElse: () {},
          );
        },
        builder: (context, state) {
          final loading =
              state.maybeWhen(loading: () => true, orElse: () => false);
          return Scaffold(
            appBar: AppBar(
              title: Text(_isEdit
                  ? 'Edit Verifikasi'
                  : _isPrefilled
                      ? 'Verifikasi & Setujui RAB'
                      : 'Buat Verifikasi'),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Pilih RAB ──
                    _SectionHeader('Pengajuan Anggaran'),
                    if (_isPrefilled) ...[
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.description_outlined,
                                color: Colors.blue.shade400, size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Memverifikasi: ${widget.nomorForm ?? "RAB #${widget.budgetRequestId}"}',
                                style: TextStyle(
                                    fontSize: 12.5,
                                    color: Colors.blue.shade700,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      const Text(
                        'Masukkan ID pengajuan RAB yang akan diverifikasi.',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        initialValue: _selectedBudgetRequestId?.toString(),
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'ID Pengajuan RAB *',
                            border: OutlineInputBorder()),
                        onChanged: (v) =>
                            setState(() => _selectedBudgetRequestId = int.tryParse(v)),
                        validator: (v) => (v == null ||
                                v.isEmpty ||
                                int.tryParse(v) == null)
                            ? 'Wajib diisi dengan angka'
                            : null,
                      ),
                    ],
                    const SizedBox(height: 20),

                    // ── Checklist Dokumen ──
                    _SectionHeader('Kelengkapan Dokumen'),
                    _CheckItem(
                      label: 'Form pengajuan lengkap',
                      value: _docForm,
                      onChanged: (v) => setState(() => _docForm = v!),
                    ),
                    _CheckItem(
                      label: 'Surat justifikasi terlampir',
                      value: _docSurat,
                      onChanged: (v) => setState(() => _docSurat = v!),
                    ),
                    _CheckItem(
                      label: 'Estimasi vendor terlampir',
                      value: _docEstimasi,
                      onChanged: (v) => setState(() => _docEstimasi = v!),
                    ),
                    _CheckItem(
                      label: 'Spesifikasi teknis tersedia',
                      value: _docSpesifikasi,
                      onChanged: (v) => setState(() => _docSpesifikasi = v!),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _docLainnyaCtrl,
                      maxLines: 2,
                      decoration: const InputDecoration(
                          labelText: 'Dokumen Lainnya (opsional)',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),

                    // ── Analisa Finance ──
                    _SectionHeader('Analisa Finance'),
                    TextFormField(
                      controller: _cekAnggaranCtrl,
                      maxLines: 3,
                      decoration: const InputDecoration(
                          labelText: 'Cek Anggaran',
                          alignLabelWithHint: true,
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _analisaCashflowCtrl,
                      maxLines: 3,
                      decoration: const InputDecoration(
                          labelText: 'Analisa Cashflow',
                          alignLabelWithHint: true,
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 12),

                    const Text('Rekomendasi *',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 6),
                    SegmentedButton<String>(
                      segments: const [
                        ButtonSegment(
                            value: 'setuju',
                            label: Text('Setuju'),
                            icon: Icon(Icons.check_circle_outline,
                                color: Colors.green)),
                        ButtonSegment(
                            value: 'tunda',
                            label: Text('Tunda'),
                            icon: Icon(Icons.pause_circle_outline,
                                color: Colors.orange)),
                        ButtonSegment(
                            value: 'tolak',
                            label: Text('Tolak'),
                            icon: Icon(Icons.cancel_outlined, color: Colors.red)),
                      ],
                      selected: {_rekomendasi},
                      onSelectionChanged: (v) => setState(() => _rekomendasi = v.first),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _nominalCtrl,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText:
                              'Nominal Rekomendasi (kosongkan = sama dengan estimasi)',
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _catatanCtrl,
                      maxLines: 3,
                      decoration: const InputDecoration(
                          labelText: 'Catatan Finance (opsional)',
                          alignLabelWithHint: true,
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 24),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.info_outline, color: Colors.blue, size: 18),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Setelah disimpan, RAB akan diteruskan ke Super Admin untuk keputusan final approve/tolak, berdasarkan rekomendasi ini.',
                              style: TextStyle(fontSize: 12, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: loading ? null : () => _submit(context),
                        child: loading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2, color: Colors.white))
                            : Text(_isEdit
                                ? 'Simpan Perubahan'
                                : 'Simpan & Teruskan ke SA'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CheckItem extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _CheckItem(
      {required this.label, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: value,
      onChanged: onChanged,
      title: Text(label, style: const TextStyle(fontSize: 14)),
      dense: true,
      contentPadding: EdgeInsets.zero,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    );
  }
}