import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class POCreateScreen extends StatefulWidget {
  final AppUser currentUser;
  const POCreateScreen({super.key, required this.currentUser});

  @override
  State<POCreateScreen> createState() => _POCreateScreenState();
}

class _POCreateScreenState extends State<POCreateScreen> {
  String? _supplierId;
  String? _warehouseId;
  final List<_DraftItem> _items = [];

  bool get _canSubmit =>
      _supplierId != null &&
      _warehouseId != null &&
      _items.isNotEmpty &&
      _items.every((i) => i.productId != null && i.quantity > 0);

  void _submit() {
    final db = MockDB.instance;
    final code =
        'PO/2026/${(db.purchaseOrders.length + 1).toString().padLeft(4, '0')}';
    db.purchaseOrders.add(
      PurchaseOrder(
        id: 'po${DateTime.now().millisecondsSinceEpoch}',
        code: code,
        supplierId: _supplierId!,
        warehouseId: _warehouseId!,
        items: _items
            .map((i) => POItem(productId: i.productId!, quantity: i.quantity))
            .toList(),
        status: DocStatus.pending,
        createdAt: DateTime.now(),
        createdBy: widget.currentUser.id,
      ),
    );
    HapticFeedback.heavyImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('PO $code berhasil diajukan'),
        backgroundColor: AppColors.success,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Buat Purchase Order')),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: _canSubmit ? 1 : 0.5,
            child: ElevatedButton(
              onPressed: _canSubmit ? _submit : null,
              child: const Text('Simpan & Ajukan'),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        children: [
          _label('Supplier'),
          DropdownButtonFormField<String>(
            initialValue: _supplierId,
            items: db.suppliers
                .map((s) => DropdownMenuItem(value: s.id, child: Text(s.name)))
                .toList(),
            onChanged: (v) => setState(() => _supplierId = v),
            decoration: const InputDecoration(hintText: 'Pilih supplier'),
          ),
          _label('Gudang Penerima'),
          DropdownButtonFormField<String>(
            initialValue: _warehouseId,
            items: db.warehouses
                .map((w) =>
                    DropdownMenuItem(value: w.id, child: Text(w.name)))
                .toList(),
            onChanged: (v) => setState(() => _warehouseId = v),
            decoration: const InputDecoration(hintText: 'Pilih gudang'),
          ),
          _label('Daftar Item'),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            child: Column(
              children: [
                ..._items.asMap().entries.map((e) {
                  final idx = e.key;
                  final item = e.value;
                  final p = item.productId == null
                      ? null
                      : db.productById(item.productId!);
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.primarySoft,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text('Item ${idx + 1}',
                                  style: const TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700)),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () =>
                                  setState(() => _items.removeAt(idx)),
                              icon: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: AppColors.danger,
                                  size: 20),
                            ),
                          ],
                        ),
                        DropdownButtonFormField<String>(
                          initialValue: item.productId,
                          items: db.products
                              .map((p) => DropdownMenuItem(
                                    value: p.id,
                                    child: Text('${p.name} (${p.unit})'),
                                  ))
                              .toList(),
                          onChanged: (v) =>
                              setState(() => item.productId = v),
                          decoration: const InputDecoration(
                              hintText: 'Pilih produk'),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            _qtyButton(Icons.remove_rounded, () {
                              setState(() {
                                if (item.quantity > 0) item.quantity--;
                              });
                            }),
                            Expanded(
                              child: Center(
                                child: Text('${item.quantity} ${p?.unit ?? ''}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                            _qtyButton(Icons.add_rounded, () {
                              setState(() => item.quantity++);
                            }),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              HapticFeedback.lightImpact();
              setState(() => _items.add(_DraftItem()));
            },
            icon: const Icon(Icons.add),
            label: const Text('Tambah Item'),
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

  Widget _qtyButton(IconData icon, VoidCallback onTap) => Material(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            HapticFeedback.selectionClick();
            onTap();
          },
          child: Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            child: Icon(icon, color: AppColors.primary),
          ),
        ),
      );
}

class _DraftItem {
  String? productId;
  int quantity = 0;
}
