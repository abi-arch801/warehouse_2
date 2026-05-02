import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  String _search = '';

  void _addUser() {
    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    UserRole role = UserRole.admin;
    String? warehouseId;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return StatefulBuilder(builder: (ctx, setSt) {
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
                const Text('Tambah User',
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700)),
                const SizedBox(height: 14),
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Nama',
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email_rounded),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<UserRole>(
                  initialValue: role,
                  items: UserRole.values
                      .map((r) =>
                          DropdownMenuItem(value: r, child: Text(r.label)))
                      .toList(),
                  onChanged: (v) => setSt(() => role = v!),
                  decoration: const InputDecoration(labelText: 'Role'),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  initialValue: warehouseId,
                  items: MockDB.instance.warehouses
                      .map((w) =>
                          DropdownMenuItem(value: w.id, child: Text(w.name)))
                      .toList(),
                  onChanged: (v) => setSt(() => warehouseId = v),
                  decoration: const InputDecoration(
                      labelText: 'Gudang (opsional)'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (nameCtrl.text.isEmpty || emailCtrl.text.isEmpty) {
                      return;
                    }
                    setState(() {
                      MockDB.instance.users.add(AppUser(
                        id: 'u${DateTime.now().millisecondsSinceEpoch}',
                        name: nameCtrl.text.trim(),
                        email: emailCtrl.text.trim(),
                        role: role,
                        warehouseId: warehouseId,
                      ));
                    });
                    Navigator.pop(ctx);
                    HapticFeedback.lightImpact();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('User berhasil ditambahkan')),
                    );
                  },
                  child: const Text('Simpan User'),
                ),
              ],
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final users = MockDB.instance.users
        .where((u) =>
            u.name.toLowerCase().contains(_search.toLowerCase()) ||
            u.email.toLowerCase().contains(_search.toLowerCase()))
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('User')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: _addUser,
        icon: const Icon(Icons.person_add_rounded),
        label: const Text('User Baru'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Cari user...',
                prefixIcon: Icon(Icons.search_rounded),
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 90),
              itemCount: users.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, i) {
                final u = users[i];
                return Dismissible(
                  key: ValueKey(u.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: BoxDecoration(
                      color: AppColors.danger,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.delete_outline_rounded,
                        color: Colors.white),
                  ),
                  confirmDismiss: (_) async {
                    return await showDialog<bool>(
                          context: context,
                          builder: (_) => AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            title: const Text('Hapus user?'),
                            content: Text('Hapus ${u.name} dari sistem?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, false),
                                child: const Text('Batal'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.danger),
                                onPressed: () =>
                                    Navigator.pop(context, true),
                                child: const Text('Hapus'),
                              ),
                            ],
                          ),
                        ) ??
                        false;
                  },
                  onDismissed: (_) {
                    setState(() => MockDB.instance.users.remove(u));
                    HapticFeedback.lightImpact();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${u.name} dihapus')),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.primarySoft,
                          child: Text(
                            u.name.substring(0, 1),
                            style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(u.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 2),
                              Text(u.email,
                                  style: const TextStyle(
                                      color: AppColors.textMuted,
                                      fontSize: 12.5)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.primarySoft,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            u.role.label,
                            style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w700,
                                fontSize: 11),
                          ),
                        ),
                      ],
                    ),
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
