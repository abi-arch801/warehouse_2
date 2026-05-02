import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class SubmissionCreateScreen extends StatefulWidget {
  final AppUser currentUser;
  const SubmissionCreateScreen({super.key, required this.currentUser});

  @override
  State<SubmissionCreateScreen> createState() =>
      _SubmissionCreateScreenState();
}

class _SubmissionCreateScreenState extends State<SubmissionCreateScreen> {
  final _name = TextEditingController();
  final _sku = TextEditingController();
  final _unit = TextEditingController(text: 'pcs');
  final _qty = TextEditingController();
  String? _categoryId;
  String? _warehouseId;
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    _sku.dispose();
    _unit.dispose();
    _qty.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Ajukan Produk Baru')),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: _canSubmit ? 1 : 0.5,
            child: ElevatedButton.icon(
              icon: _saving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2.4))
                  : const Icon(Icons.send_rounded),
              label: Text(_saving ? 'Mengirim...' : 'Kirim Pengajuan'),
              onPressed: _canSubmit && !_saving ? _submit : null,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        children: [
          _label('Nama Produk'),
          TextField(
            controller: _name,
            decoration: const InputDecoration(
              hintText: 'Mis. Mouse Wireless',
              prefixIcon: Icon(Icons.inventory_2_outlined),
            ),
            onChanged: (_) => setState(() {}),
          ),
          _label('SKU'),
          TextField(
            controller: _sku,
            decoration: const InputDecoration(
              hintText: 'SKU-00010',
              prefixIcon: Icon(Icons.qr_code_2_rounded),
            ),
            onChanged: (_) => setState(() {}),
          ),
          _label('Satuan'),
          TextField(
            controller: _unit,
            decoration: const InputDecoration(
              hintText: 'pcs, rim, botol...',
              prefixIcon: Icon(Icons.straighten_rounded),
            ),
            onChanged: (_) => setState(() {}),
          ),
          _label('Kategori'),
          DropdownButtonFormField<String>(
            initialValue: _categoryId,
            items: db.categories
                .map((c) =>
                    DropdownMenuItem(value: c.id, child: Text(c.name)))
                .toList(),
            onChanged: (v) {
              HapticFeedback.selectionClick();
              setState(() => _categoryId = v);
            },
            decoration: const InputDecoration(
              hintText: 'Pilih kategori',
              prefixIcon: Icon(Icons.category_outlined),
            ),
          ),
          _label('Gudang Stok Awal'),
          DropdownButtonFormField<String>(
            initialValue: _warehouseId,
            items: db.warehouses
                .map((w) =>
                    DropdownMenuItem(value: w.id, child: Text(w.name)))
                .toList(),
            onChanged: (v) {
              HapticFeedback.selectionClick();
              setState(() => _warehouseId = v);
            },
            decoration: const InputDecoration(
              hintText: 'Pilih gudang',
              prefixIcon: Icon(Icons.warehouse_outlined),
            ),
          ),
          _label('Jumlah Stok Awal'),
          TextField(
            controller: _qty,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'Mis. 10',
              prefixIcon: Icon(Icons.numbers_rounded),
            ),
            onChanged: (_) => setState(() {}),
          ),
          const SizedBox(height: 20),
          AnimatedContainer(
            duration: const Duration(milliseconds: 280),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: _canSubmit
                  ? AppColors.successSoft
                  : AppColors.warningSoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  _canSubmit
                      ? Icons.check_circle_rounded
                      : Icons.info_outline_rounded,
                  color: _canSubmit
                      ? AppColors.success
                      : AppColors.warning,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _canSubmit
                        ? 'Form lengkap, siap dikirim untuk approval.'
                        : 'Lengkapi semua field di atas.',
                    style: TextStyle(
                      color: _canSubmit
                          ? AppColors.success
                          : AppColors.warning,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _label(String s) => Padding(
        padding: const EdgeInsets.fromLTRB(2, 16, 0, 6),
        child:
            Text(s, style: const TextStyle(fontWeight: FontWeight.w600)),
      );

  bool get _canSubmit =>
      _name.text.trim().isNotEmpty &&
      _sku.text.trim().isNotEmpty &&
      _unit.text.trim().isNotEmpty &&
      _categoryId != null &&
      _warehouseId != null &&
      (int.tryParse(_qty.text) ?? 0) > 0;

  void _submit() async {
    setState(() => _saving = true);
    await Future.delayed(const Duration(milliseconds: 500));
    final db = MockDB.instance;
    final code =
        'PSB/2026/${(db.submissions.length + 1).toString().padLeft(4, '0')}';
    db.submissions.add(ProductSubmission(
      id: 'ps${DateTime.now().millisecondsSinceEpoch}',
      code: code,
      name: _name.text.trim(),
      sku: _sku.text.trim(),
      unit: _unit.text.trim(),
      categoryId: _categoryId!,
      warehouseId: _warehouseId!,
      initialStock: int.parse(_qty.text),
      submittedBy: widget.currentUser.id,
      status: DocStatus.pending,
      createdAt: DateTime.now(),
    ));
    HapticFeedback.heavyImpact();
    if (!mounted) return;
    setState(() => _saving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pengajuan $code menunggu approval'),
        backgroundColor: AppColors.success,
      ),
    );
    Navigator.pop(context);
  }
}
