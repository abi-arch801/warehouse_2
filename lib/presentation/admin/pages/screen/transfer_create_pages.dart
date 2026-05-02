import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class TransferCreateScreen extends StatefulWidget {
  final AppUser currentUser;
  const TransferCreateScreen({super.key, required this.currentUser});

  @override
  State<TransferCreateScreen> createState() => _TransferCreateScreenState();
}

class _TransferCreateScreenState extends State<TransferCreateScreen> {
  String? _from;
  String? _to;
  final List<_Draft> _items = [];

  bool get _canSubmit =>
      _from != null &&
      _to != null &&
      _from != _to &&
      _items.isNotEmpty &&
      _items.every((i) => i.productId != null && i.quantity > 0);

  void _submit() {
    final db = MockDB.instance;
    final code =
        'TRF/2026/${(db.transfers.length + 1).toString().padLeft(4, '0')}';
    db.transfers.add(StockTransfer(
      id: 't${DateTime.now().millisecondsSinceEpoch}',
      code: code,
      fromWarehouseId: _from!,
      toWarehouseId: _to!,
      items: _items
          .map((i) =>
              TransferItem(productId: i.productId!, quantity: i.quantity))
          .toList(),
      status: DocStatus.pending,
      createdAt: DateTime.now(),
    ));
    HapticFeedback.heavyImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Transfer $code diajukan'),
        backgroundColor: AppColors.success,
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Buat Transfer')),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: _canSubmit ? 1 : 0.5,
            child: ElevatedButton(
              onPressed: _canSubmit ? _submit : null,
              child: const Text('Ajukan Transfer'),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.infoSoft,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Asal',
                          style: TextStyle(
                              color: AppColors.info,
                              fontSize: 11,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text(
                          _from == null
                              ? '—'
                              : (db.warehouseById(_from!)?.name ?? '-'),
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 13)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_rounded,
                    color: AppColors.info),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text('Tujuan',
                          style: TextStyle(
                              color: AppColors.info,
                              fontSize: 11,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text(
                          _to == null
                              ? '—'
                              : (db.warehouseById(_to!)?.name ?? '-'),
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          _label('Gudang Asal'),
          DropdownButtonFormField<String>(
            initialValue: _from,
            items: db.warehouses
                .map((w) =>
                    DropdownMenuItem(value: w.id, child: Text(w.name)))
                .toList(),
            onChanged: (v) => setState(() => _from = v),
            decoration: const InputDecoration(hintText: 'Pilih asal'),
          ),
          _label('Gudang Tujuan'),
          DropdownButtonFormField<String>(
            initialValue: _to,
            items: db.warehouses
                .where((w) => w.id != _from)
                .map((w) =>
                    DropdownMenuItem(value: w.id, child: Text(w.name)))
                .toList(),
            onChanged: (v) => setState(() => _to = v),
            decoration: const InputDecoration(hintText: 'Pilih tujuan'),
          ),
          _label('Daftar Barang'),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            child: Column(
              children: _items.asMap().entries.map((e) {
                final idx = e.key;
                final item = e.value;
                final p = item.productId == null
                    ? null
                    : db.productById(item.productId!);
                final available = (p != null && _from != null)
                    ? (db.stockOf(p.id, _from!)?.quantity ?? 0)
                    : 0;
                final overStock = item.quantity > available;
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    border: Border.all(
                      color: overStock
                          ? AppColors.danger
                          : AppColors.border,
                    ),
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
                              color: AppColors.infoSoft,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text('Item ${idx + 1}',
                                style: const TextStyle(
                                    color: AppColors.info,
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
                          _qtyBtn(Icons.remove_rounded, () {
                            setState(() {
                              if (item.quantity > 0) item.quantity--;
                            });
                          }),
                          Expanded(
                            child: Center(
                              child: Column(
                                children: [
                                  Text('${item.quantity} ${p?.unit ?? ''}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
                                  if (p != null && _from != null)
                                    Text(
                                      'Stok asal: $available ${p.unit}',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: overStock
                                            ? AppColors.danger
                                            : AppColors.textMuted,
                                        fontWeight: overStock
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          _qtyBtn(Icons.add_rounded, () {
                            setState(() => item.quantity++);
                          }),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              HapticFeedback.lightImpact();
              setState(() => _items.add(_Draft()));
            },
            icon: const Icon(Icons.add),
            label: const Text('Tambah Item'),
          ),
        ],
      ),
    );
  }

  Widget _label(String s) => Padding(
        padding: const EdgeInsets.fromLTRB(2, 18, 0, 6),
        child:
            Text(s, style: const TextStyle(fontWeight: FontWeight.w600)),
      );

  Widget _qtyBtn(IconData icon, VoidCallback onTap) => Material(
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
            child: Icon(icon, color: AppColors.info),
          ),
        ),
      );
}

class _Draft {
  String? productId;
  int quantity = 0;
}
