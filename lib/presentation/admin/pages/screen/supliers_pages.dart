import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class SuppliersScreen extends StatefulWidget {
  const SuppliersScreen({super.key});

  @override
  State<SuppliersScreen> createState() => _SuppliersScreenState();
}

class _SuppliersScreenState extends State<SuppliersScreen> {
  String _search = '';

  void _add() {
    final name = TextEditingController();
    final contact = TextEditingController();
    final phone = TextEditingController();
    final cat = TextEditingController();
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
              const Text('Tambah Supplier',
                  style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
              const SizedBox(height: 14),
              TextField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Nama Perusahaan'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: contact,
                decoration: const InputDecoration(labelText: 'Nama Kontak'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Nomor Telepon'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: cat,
                decoration: const InputDecoration(labelText: 'Kategori Barang'),
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  if (name.text.isEmpty) return;
                  setState(() {
                    MockDB.instance.suppliers.add(Supplier(
                      id: 's${DateTime.now().millisecondsSinceEpoch}',
                      name: name.text,
                      contact: contact.text,
                      phone: phone.text,
                      category: cat.text,
                    ));
                  });
                  Navigator.pop(ctx);
                  HapticFeedback.lightImpact();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Supplier ditambahkan')),
                  );
                },
                child: const Text('Simpan Supplier'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final suppliers = MockDB.instance.suppliers
        .where((s) =>
            s.name.toLowerCase().contains(_search.toLowerCase()) ||
            s.category.toLowerCase().contains(_search.toLowerCase()))
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Supplier')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: _add,
        icon: const Icon(Icons.add_business_rounded),
        label: const Text('Supplier Baru'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Cari supplier...',
                prefixIcon: Icon(Icons.search_rounded),
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 90),
              itemCount: suppliers.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, i) {
                final s = suppliers[i];
                return Container(
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
                          color: AppColors.warningSoft,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.local_shipping_rounded,
                            color: AppColors.warning),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 2),
                            Text('${s.contact} · ${s.phone}',
                                style: const TextStyle(
                                    color: AppColors.textMuted, fontSize: 12)),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: AppColors.warningSoft,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(s.category,
                                  style: const TextStyle(
                                      color: AppColors.warning,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.call_rounded,
                            color: AppColors.primary),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Memanggil ${s.phone}...')),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
