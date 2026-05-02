import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class WarehousesScreen extends StatefulWidget {
  const WarehousesScreen({super.key});

  @override
  State<WarehousesScreen> createState() => _WarehousesScreenState();
}

class _WarehousesScreenState extends State<WarehousesScreen> {
  void _add() {
    final code = TextEditingController(text: 'WH-${MockDB.instance.warehouses.length + 1}'.padLeft(6, '0'));
    final name = TextEditingController();
    final city = TextEditingController();
    final address = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        final mq = MediaQuery.of(ctx);
        return Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 16,
            bottom: 24 + mq.viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 18),
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const Text('Tambah Gudang',
                  style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
              const SizedBox(height: 14),
              TextField(
                controller: code,
                decoration: const InputDecoration(labelText: 'Kode Gudang'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Nama Gudang'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: city,
                decoration: const InputDecoration(labelText: 'Kota'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: address,
                decoration: const InputDecoration(labelText: 'Alamat'),
                maxLines: 2,
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  if (name.text.isEmpty) return;
                  setState(() {
                    MockDB.instance.warehouses.add(Warehouse(
                      id: 'w${DateTime.now().millisecondsSinceEpoch}',
                      code: code.text,
                      name: name.text,
                      city: city.text,
                      address: address.text,
                    ));
                  });
                  Navigator.pop(ctx);
                  HapticFeedback.lightImpact();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Gudang ditambahkan')),
                  );
                },
                child: const Text('Simpan Gudang'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final warehouses = MockDB.instance.warehouses;
    return Scaffold(
      appBar: AppBar(title: const Text('Gudang')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: _add,
        icon: const Icon(Icons.add_business_rounded),
        label: const Text('Gudang Baru'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 90),
        itemCount: warehouses.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, i) {
          final w = warehouses[i];
          final stocks = MockDB.instance.stocks
              .where((s) => s.warehouseId == w.id)
              .fold<int>(0, (s, x) => s + x.quantity);
          return TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 300 + i * 80),
            curve: Curves.easeOut,
            builder: (_, v, child) => Opacity(
              opacity: v,
              child: Transform.translate(
                offset: Offset(0, (1 - v) * 12),
                child: child,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primarySoft,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.warehouse_rounded,
                        color: AppColors.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(w.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700)),
                        const SizedBox(height: 2),
                        Text('${w.code} · ${w.city}',
                            style: const TextStyle(
                                color: AppColors.textMuted, fontSize: 12.5)),
                        const SizedBox(height: 4),
                        Text(w.address,
                            style: const TextStyle(fontSize: 11.5)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('$stocks',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.primary)),
                      const Text('unit',
                          style: TextStyle(
                              color: AppColors.textMuted, fontSize: 11)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
