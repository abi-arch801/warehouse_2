// lib/presentation/admin/pages/po/po_form_page.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/admin/po/po_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/model/response/supplier_response_model.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/po/po_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/supplier/supplier_bloc.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Model lokal untuk item baris PO (sebelum dikirim ke backend)
// ─────────────────────────────────────────────────────────────────────────────
class _PoItemRow {
  int? productId;
  String productName;
  String unit;
  double conversionValue;
  int qty;
  double unitPrice;
  double discountPercent;
  String notes;

  _PoItemRow({
    this.productId,
    this.productName = '',
    this.unit = 'pcs',
    this.conversionValue = 1.0,
    this.qty = 1,
    this.unitPrice = 0,
    this.discountPercent = 0,
    this.notes = '',
  });

  double get subtotal {
    final after = unitPrice * (1 - discountPercent / 100);
    return after * qty;
  }

  Map<String, dynamic> toMap() => {
        'product_id': productId,
        'unit': unit,
        'conversion_value': conversionValue,
        'quantity_ordered': qty,
        'unit_price': unitPrice,
        'discount_percent': discountPercent,
        'notes': notes.isEmpty ? null : notes,
      };
}

// ─────────────────────────────────────────────────────────────────────────────
// Dummy supplier & warehouse (ganti dengan datasource nyata jika sudah ada)
// ─────────────────────────────────────────────────────────────────────────────
class _SupplierOption {
  final int id;
  final String name;
  const _SupplierOption(this.id, this.name);
}

class _WarehouseOption {
  final int id;
  final String name;
  const _WarehouseOption(this.id, this.name);
}

// ─────────────────────────────────────────────────────────────────────────────
// Entry point — dibungkus BlocProvider.value agar pakai PoBloc yang sama
// dari PoListPage. Cara pakai:
//   Navigator.push(context, MaterialPageRoute(
//     builder: (_) => BlocProvider.value(
//       value: context.read<PoBloc>(),
//       child: const PoFormPage(),
//     )));
// ─────────────────────────────────────────────────────────────────────────────
class PoFormPage extends StatefulWidget {
  const PoFormPage({super.key});

  @override
  State<PoFormPage> createState() => _PoFormPageState();
}

class _PoFormPageState extends State<PoFormPage> {
  // ── Controllers & State ───────────────────────────────────────────────────
  final _formKey = GlobalKey<FormState>();

  // Header
  int? _supplierId;
  int? _warehouseId;
  DateTime _orderDate = DateTime.now();
  DateTime? _expectedDate;
  String _paymentTerm = 'cod';
  double _taxPercent = 11.0;
  double _discountAmount = 0;
  final _notesCtrl = TextEditingController();
  final _discountCtrl = TextEditingController(text: '0');

  // Items
  final List<_PoItemRow> _items = [_PoItemRow()];

  static const _paymentTerms = {
    'cod': 'COD (Tunai)',
    'net_7': 'Net 7 hari',
    'net_14': 'Net 14 hari',
    'net_30': 'Net 30 hari',
    'net_60': 'Net 60 hari',
  };

  // ── Kalkulasi ─────────────────────────────────────────────────────────────
  double get _subtotal => _items.fold(0, (s, r) => s + r.subtotal);
  double get _taxAmount => _subtotal * (_taxPercent / 100);
  double get _totalAmount => _subtotal + _taxAmount - _discountAmount;

  String _fmt(double v) {
    final s = v.toInt().toString();
    final r = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) r.write('.');
      r.write(s[i]);
    }
    return 'Rp $r';
  }

  // ── Date pickers ──────────────────────────────────────────────────────────
  Future<void> _pickOrderDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _orderDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (d != null) setState(() => _orderDate = d);
  }

  Future<void> _pickExpectedDate() async {
    final d = await showDatePicker(
      context: context,
      initialDate: _expectedDate ?? _orderDate,
      firstDate: _orderDate,
      lastDate: DateTime(2030),
    );
    if (d != null) setState(() => _expectedDate = d);
  }

  String _fmtDate(DateTime d) => '${d.day.toString().padLeft(2, '0')}/'
      '${d.month.toString().padLeft(2, '0')}/${d.year}';

  // ── Submit ────────────────────────────────────────────────────────────────
  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_supplierId == null) {
      _showError('Pilih supplier terlebih dahulu.');
      return;
    }
    if (_warehouseId == null) {
      _showError('Pilih gudang terlebih dahulu.');
      return;
    }
    if (_items.any((r) => r.productId == null)) {
      _showError('Semua baris item harus memilih produk.');
      return;
    }
    if (_items.isEmpty) {
      _showError('Tambahkan minimal 1 item.');
      return;
    }

    final body = <String, dynamic>{
      'supplier_id': _supplierId,
      'warehouse_id': _warehouseId,
      'order_date':
          '${_orderDate.year}-${_orderDate.month.toString().padLeft(2, '0')}-${_orderDate.day.toString().padLeft(2, '0')}',
      if (_expectedDate != null)
        'expected_date':
            '${_expectedDate!.year}-${_expectedDate!.month.toString().padLeft(2, '0')}-${_expectedDate!.day.toString().padLeft(2, '0')}',
      'payment_term': _paymentTerm,
      'tax_percent': _taxPercent,
      'discount_amount': _discountAmount,
      'notes': _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
      'items': _items.map((r) => r.toMap()).toList(),
    };

    context.read<PoBloc>().add(PoEvent.store(body));
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: AppColors.danger,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ));
  }

  @override
  void dispose() {
    _notesCtrl.dispose();
    _discountCtrl.dispose();
    super.dispose();
  }

  // ── Build ─────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return BlocListener<PoBloc, PoState>(
      listener: (ctx, state) {
        state.whenOrNull(
          actionSuccess: (msg, _) {
            HapticFeedback.lightImpact();
            ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
              content: Text(msg),
              backgroundColor: AppColors.success,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ));
            Navigator.pop(ctx, true);
          },
          error: (msg) => _showError(msg),
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.bg,
        appBar: AppBar(
          title: const Text('Buat Purchase Order'),
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.text,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(height: 1, color: AppColors.border),
          ),
          actions: [
            BlocBuilder<PoBloc, PoState>(
              builder: (_, state) {
                final loading = state.maybeWhen(
                    actionLoading: () => true, orElse: () => false);
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: TextButton(
                    onPressed: loading ? null : _submit,
                    child: loading
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Simpan',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700)),
                  ),
                );
              },
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
            children: [
              _sectionHeader('Informasi PO'),
              _card(children: [
                // ── Supplier (data asli) ───────────────────────────────────
                BlocBuilder<SupplierBloc, SupplierState>(
                  builder: (context, state) {
                    final suppliers = state.maybeWhen(
                      loaded: (list) => list,
                      orElse: () => <SupplierModel>[],
                    );
                    return _dropdownField<int>(
                      label: 'Supplier *',
                      value: _supplierId,
                      icon: Icons.business_outlined,
                      items: suppliers
                          .map((s) => DropdownMenuItem(
                              value: s.id, child: Text(s.name)))
                          .toList(),
                      onChanged: (v) => setState(() => _supplierId = v),
                    );
                  },
                ),
                const SizedBox(height: 12),

                // ── Gudang (data asli) ──────────────────────────────────────
                BlocBuilder<AdminWarehouseBloc, AdminWarehouseState>(
                  builder: (context, state) {
                    final warehouses = state.maybeWhen(
                      listLoaded: (result) => result.data,
                      orElse: () => [],
                    );
                    return _dropdownField<int>(
                      label: 'Gudang *',
                      value: _warehouseId,
                      icon: Icons.warehouse_outlined,
                      items: warehouses
                          .map<DropdownMenuItem<int>>((w) => DropdownMenuItem(
                              value: w.id, child: Text(w.name)))
                          .toList(),
                      onChanged: (v) => setState(() => _warehouseId = v),
                    );
                  },
                ),
                const SizedBox(height: 12),
                Row(children: [
                  Expanded(
                      child: _dateTile(
                    label: 'Tanggal PO *',
                    value: _fmtDate(_orderDate),
                    onTap: _pickOrderDate,
                  )),
                  const SizedBox(width: 12),
                  Expanded(
                      child: _dateTile(
                    label: 'Exp. Tiba',
                    value: _expectedDate != null
                        ? _fmtDate(_expectedDate!)
                        : 'Pilih',
                    onTap: _pickExpectedDate,
                    muted: _expectedDate == null,
                  )),
                ]),
                const SizedBox(height: 12),
                _dropdownField<String>(
                  label: 'Termin Pembayaran',
                  value: _paymentTerm,
                  icon: Icons.payment_outlined,
                  items: _paymentTerms.entries
                      .map((e) =>
                          DropdownMenuItem(value: e.key, child: Text(e.value)))
                      .toList(),
                  onChanged: (v) => setState(() => _paymentTerm = v!),
                ),
              ]),

              const SizedBox(height: 16),
              _sectionHeader('Item Produk'),

              // ── Item rows (produk dari AdminProductBloc) ──────────────────
              BlocBuilder<AdminProductBloc, AdminProductState>(
                builder: (context, productState) {
                  final products = productState.maybeWhen(
                    loaded: (items, total, hasMore) => items
                        .map((e) => Map<String, dynamic>.from(e as Map))
                        .toList(),
                    orElse: () => <Map<String, dynamic>>[],
                  );

                  return Column(
                    children: _items.asMap().entries.map((entry) {
                      final i = entry.key;
                      final row = entry.value;
                      return _ItemRowCard(
                        key: ValueKey(i),
                        index: i,
                        row: row,
                        products: products,
                        canDelete: _items.length > 1,
                        onChanged: () => setState(() {}),
                        onDelete: () => setState(() => _items.removeAt(i)),
                      );
                    }).toList(),
                  );
                },
              ),

              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => setState(() => _items.add(_PoItemRow())),
                icon: const Icon(Icons.add_rounded, size: 18),
                label: const Text('Tambah Item'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),

              const SizedBox(height: 16),
              _sectionHeader('Biaya & Pajak'),
              _card(children: [
                Row(children: [
                  const Expanded(
                    child: Text('PPN (%)',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    width: 80,
                    child: TextFormField(
                      initialValue: _taxPercent.toString(),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      textAlign: TextAlign.right,
                      decoration: _inDecor(null),
                      onChanged: (v) =>
                          setState(() => _taxPercent = double.tryParse(v) ?? 0),
                    ),
                  ),
                ]),
                const SizedBox(height: 12),
                Row(children: [
                  const Expanded(
                    child: Text('Diskon Global (Rp)',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      controller: _discountCtrl,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      textAlign: TextAlign.right,
                      decoration: _inDecor(null),
                      onChanged: (v) => setState(
                          () => _discountAmount = double.tryParse(v) ?? 0),
                    ),
                  ),
                ]),
                const Divider(height: 24),
                _summaryRow('Subtotal', _fmt(_subtotal),
                    style: const TextStyle(color: AppColors.textMuted)),
                const SizedBox(height: 6),
                _summaryRow('PPN (${_taxPercent.toStringAsFixed(0)}%)',
                    _fmt(_taxAmount),
                    style: const TextStyle(color: AppColors.textMuted)),
                const SizedBox(height: 6),
                if (_discountAmount > 0) ...[
                  _summaryRow('Diskon', '- ${_fmt(_discountAmount)}',
                      style: const TextStyle(color: AppColors.danger)),
                  const SizedBox(height: 6),
                ],
                _summaryRow('Total', _fmt(_totalAmount),
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: AppColors.primary)),
              ]),

              const SizedBox(height: 16),
              _sectionHeader('Catatan'),
              _card(children: [
                TextFormField(
                  controller: _notesCtrl,
                  maxLines: 3,
                  decoration: _inDecor('Catatan tambahan (opsional)'),
                ),
              ]),

              const SizedBox(height: 24),
              BlocBuilder<PoBloc, PoState>(
                builder: (_, state) {
                  final loading = state.maybeWhen(
                      actionLoading: () => true, orElse: () => false);
                  return ElevatedButton(
                    onPressed: loading ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: Colors.white),
                          )
                        : const Text('Buat Purchase Order',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 15)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Helpers UI ────────────────────────────────────────────────────────────
  Widget _sectionHeader(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                color: AppColors.textMuted,
                letterSpacing: .4)),
      );

  Widget _card({required List<Widget> children}) => Container(
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, children: children),
      );

  Widget _dropdownField<T>({
    required String label,
    required T? value,
    required IconData icon,
    required List<DropdownMenuItem<T>> items,
    required void Function(T?) onChanged,
  }) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label,
            style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: AppColors.textMuted)),
        const SizedBox(height: 4),
        DropdownButtonFormField<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, size: 18, color: AppColors.primary),
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.border),
            ),
          ),
          hint: Text('Pilih $label',
              style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
        ),
      ]);

  Widget _dateTile({
    required String label,
    required String value,
    required VoidCallback onTap,
    bool muted = false,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(10),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label,
                style:
                    const TextStyle(fontSize: 10, color: AppColors.textMuted)),
            const SizedBox(height: 2),
            Row(children: [
              const Icon(Icons.calendar_today_outlined,
                  size: 14, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(value,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: muted ? AppColors.textMuted : AppColors.text)),
            ]),
          ]),
        ),
      );

  Widget _summaryRow(String label, String value, {TextStyle? style}) =>
      Row(children: [
        Expanded(child: Text(label, style: style)),
        Text(value, style: style),
      ]);

  InputDecoration _inDecor(String? hint) => InputDecoration(
        hintText: hint,
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// Widget kartu satu baris item
// ─────────────────────────────────────────────────────────────────────────────
class _ItemRowCard extends StatefulWidget {
  final int index;
  final _PoItemRow row;
  final List<Map<String, dynamic>> products;
  final bool canDelete;
  final VoidCallback onChanged;
  final VoidCallback onDelete;

  const _ItemRowCard({
    super.key,
    required this.index,
    required this.row,
    required this.products,
    required this.canDelete,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  State<_ItemRowCard> createState() => _ItemRowCardState();
}

class _ItemRowCardState extends State<_ItemRowCard> {
  late final TextEditingController _qtyCtrl;
  late final TextEditingController _priceCtrl;
  late final TextEditingController _discCtrl;
  late final TextEditingController _notesCtrl;
  late final TextEditingController _unitCtrl;

  @override
  void initState() {
    super.initState();
    _qtyCtrl = TextEditingController(text: widget.row.qty.toString());
    _priceCtrl =
        TextEditingController(text: widget.row.unitPrice.toInt().toString());
    _discCtrl =
        TextEditingController(text: widget.row.discountPercent.toString());
    _notesCtrl = TextEditingController(text: widget.row.notes);
    _unitCtrl = TextEditingController(text: widget.row.unit);
  }

  @override
  void dispose() {
    _qtyCtrl.dispose();
    _priceCtrl.dispose();
    _discCtrl.dispose();
    _notesCtrl.dispose();
    _unitCtrl.dispose();
    super.dispose();
  }

  void _notify() {
    widget.onChanged();
    setState(() {});
  }

  String _fmtSubtotal(double v) {
    final s = v.toInt().toString();
    final r = StringBuffer();
    for (int i = 0; i < s.length; i++) {
      if (i > 0 && (s.length - i) % 3 == 0) r.write('.');
      r.write(s[i]);
    }
    return 'Rp $r';
  }

  @override
  Widget build(BuildContext context) {
    final row = widget.row;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 6, 0),
          child: Row(children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: AppColors.primarySoft,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text('${widget.index + 1}',
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary)),
            ),
            const SizedBox(width: 8),
            const Text('Item Produk',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
            const Spacer(),
            if (widget.canDelete)
              IconButton(
                onPressed: widget.onDelete,
                icon: const Icon(Icons.delete_outline,
                    color: AppColors.danger, size: 20),
                tooltip: 'Hapus item',
                visualDensity: VisualDensity.compact,
              ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 14),
          child: Column(children: [
            // ── Pilih produk (data asli dari AdminProductBloc) ─────────────
            DropdownButtonFormField<int>(
              value: row.productId,
              decoration:
                  _dec('Produk *', prefixIcon: Icons.inventory_2_outlined),
              hint: const Text('Pilih Produk',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
              items: widget.products
                  .map((p) => DropdownMenuItem<int>(
                        value: p['id'] as int,
                        child: Text(p['name']?.toString() ?? '-'),
                      ))
                  .toList(),
              onChanged: (v) {
                final p = widget.products.firstWhere(
                  (x) => x['id'] == v,
                  orElse: () => {},
                );
                row.productId = v;
                row.productName = p['name']?.toString() ?? '';
                row.unit = (p['unit']?.toString().isNotEmpty ?? false)
                    ? p['unit'].toString()
                    : row.unit;
                _unitCtrl.text = row.unit;
                _notify();
              },
            ),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: _qtyCtrl,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: _dec('Qty *'),
                  onChanged: (v) {
                    row.qty = int.tryParse(v) ?? 1;
                    _notify();
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: TextFormField(
                  controller: _unitCtrl,
                  decoration: _dec('Satuan'),
                  onChanged: (v) {
                    row.unit = v;
                    _notify();
                  },
                ),
              ),
            ]),
            const SizedBox(height: 10),
            TextFormField(
              controller: _priceCtrl,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: _dec('Harga Satuan (Rp) *',
                  prefixIcon: Icons.attach_money_rounded),
              onChanged: (v) {
                row.unitPrice = double.tryParse(v) ?? 0;
                _notify();
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _discCtrl,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: _dec('Diskon per item (%)'),
              onChanged: (v) {
                row.discountPercent = double.tryParse(v) ?? 0;
                _notify();
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _notesCtrl,
              decoration: _dec('Catatan item (opsional)'),
              onChanged: (v) {
                row.notes = v;
                _notify();
              },
            ),
            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              const Text('Subtotal item: ',
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12.5)),
              Text(_fmtSubtotal(row.subtotal),
                  style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                      color: AppColors.primary)),
            ]),
          ]),
        ),
      ]),
    );
  }

  InputDecoration _dec(String label, {IconData? prefixIcon}) => InputDecoration(
        labelText: label,
        isDense: true,
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, size: 18, color: AppColors.primary)
            : null,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
      );
}
