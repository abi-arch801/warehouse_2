// lib/presentation/admin/pages/warehouses/admin_warehouses_page.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/model/response/admin/admin_warehouse_model.dart';
import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';

// ── Warna ────────────────────────────────────────────────────────────────────
class _C {
  static const primary     = Color(0xFF2563EB);
  static const primarySoft = Color(0xFFEFF6FF);
  static const surface     = Colors.white;
  static const border      = Color(0xFFE5E7EB);
  static const textMuted   = Color(0xFF6B7280);
}

// ── Entry point ──────────────────────────────────────────────────────────────
class AdminWarehousesPage extends StatelessWidget {
  const AdminWarehousesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminWarehouseBloc()
        ..add(const AdminWarehouseEvent.load()),
      child: const _AdminWarehousesView(),
    );
  }
}

// ── View ─────────────────────────────────────────────────────────────────────
class _AdminWarehousesView extends StatefulWidget {
  const _AdminWarehousesView();

  @override
  State<_AdminWarehousesView> createState() => _AdminWarehousesViewState();
}

class _AdminWarehousesViewState extends State<_AdminWarehousesView> {
  final _searchCtrl = TextEditingController();
  bool? _filterActive;

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  void _reload() {
    context.read<AdminWarehouseBloc>().add(AdminWarehouseEvent.load(
          search:   _searchCtrl.text.trim().isEmpty ? null : _searchCtrl.text.trim(),
          isActive: _filterActive,
        ));
  }

  // ── Bottom sheet: Tambah ──────────────────────────────────────────────────
  void _showAddSheet() {
    final codeCtrl      = TextEditingController();
    final nameCtrl      = TextEditingController();
    final locationCtrl  = TextEditingController();
    final picNameCtrl   = TextEditingController();
    final picPhoneCtrl  = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => BlocProvider.value(
        value: context.read<AdminWarehouseBloc>(),
        child: _WarehouseFormSheet(
          title:         'Tambah Gudang',
          codeCtrl:      codeCtrl,
          nameCtrl:      nameCtrl,
          locationCtrl:  locationCtrl,
          picNameCtrl:   picNameCtrl,
          picPhoneCtrl:  picPhoneCtrl,
          onSave: (isActive) {
            if (nameCtrl.text.trim().isEmpty) return;
            context.read<AdminWarehouseBloc>().add(
                  AdminWarehouseEvent.store(
                    AdminStoreWarehouseRequest(
                      code:     codeCtrl.text.trim(),
                      name:     nameCtrl.text.trim(),
                      location: locationCtrl.text.trim(),
                      picName:  picNameCtrl.text.trim().isEmpty ? null : picNameCtrl.text.trim(),
                      picPhone: picPhoneCtrl.text.trim().isEmpty ? null : picPhoneCtrl.text.trim(),
                      isActive: isActive,
                    ),
                  ),
                );
            Navigator.pop(ctx);
          },
        ),
      ),
    );
  }

  // ── Bottom sheet: Edit ────────────────────────────────────────────────────
  void _showEditSheet(AdminWarehouseModel w) {
    final codeCtrl      = TextEditingController(text: w.code);
    final nameCtrl      = TextEditingController(text: w.name);
    final locationCtrl  = TextEditingController(text: w.location);
    final picNameCtrl   = TextEditingController(text: w.picName ?? '');
    final picPhoneCtrl  = TextEditingController(text: w.picPhone ?? '');

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => BlocProvider.value(
        value: context.read<AdminWarehouseBloc>(),
        child: _WarehouseFormSheet(
          title:         'Edit Gudang',
          codeCtrl:      codeCtrl,
          nameCtrl:      nameCtrl,
          locationCtrl:  locationCtrl,
          picNameCtrl:   picNameCtrl,
          picPhoneCtrl:  picPhoneCtrl,
          initialIsActive: w.isActive,
          onSave: (isActive) {
            if (nameCtrl.text.trim().isEmpty) return;
            context.read<AdminWarehouseBloc>().add(
                  AdminWarehouseEvent.update(
                    id: w.id,
                    request: AdminUpdateWarehouseRequest(
                      code:     codeCtrl.text.trim(),
                      name:     nameCtrl.text.trim(),
                      location: locationCtrl.text.trim(),
                      picName:  picNameCtrl.text.trim().isEmpty ? null : picNameCtrl.text.trim(),
                      picPhone: picPhoneCtrl.text.trim().isEmpty ? null : picPhoneCtrl.text.trim(),
                      isActive: isActive,
                    ),
                  ),
                );
            Navigator.pop(ctx);
          },
        ),
      ),
    );
  }

  // ── Konfirmasi hapus ──────────────────────────────────────────────────────
  void _confirmDelete(AdminWarehouseModel w) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Hapus Gudang'),
        content: Text('Hapus gudang "${w.name}"? Tindakan ini tidak dapat dibatalkan.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              context.read<AdminWarehouseBloc>().add(AdminWarehouseEvent.delete(w.id));
            },
            child: const Text('Hapus', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text('Kelola Gudang'),
        backgroundColor: _C.surface,
        foregroundColor: Colors.black87,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: _C.border),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: _C.primary,
        foregroundColor: Colors.white,
        onPressed: _showAddSheet,
        icon: const Icon(Icons.add_business_rounded),
        label: const Text('Gudang Baru'),
      ),
      body: Column(
        children: [
          // ── Search + filter bar ─────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchCtrl,
                    decoration: InputDecoration(
                      hintText: 'Cari gudang...',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: _C.border),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: _C.border),
                      ),
                      filled: true,
                      fillColor: _C.surface,
                    ),
                    onSubmitted: (_) => _reload(),
                    textInputAction: TextInputAction.search,
                  ),
                ),
                const SizedBox(width: 8),
                PopupMenuButton<bool?>(
                  tooltip: 'Filter status',
                  icon: Icon(
                    Icons.filter_list_rounded,
                    color: _filterActive != null ? _C.primary : Colors.grey,
                  ),
                  onSelected: (val) {
                    setState(() => _filterActive = val);
                    _reload();
                  },
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: null,  child: Text('Semua')),
                    PopupMenuItem(value: true,  child: Text('Aktif')),
                    PopupMenuItem(value: false, child: Text('Non-aktif')),
                  ],
                ),
              ],
            ),
          ),

          // ── BLoC listener + content ─────────────────────────────────────
          Expanded(
            child: BlocConsumer<AdminWarehouseBloc, AdminWarehouseState>(
              listener: (context, state) {
                state.whenOrNull(
                  actionSuccess: (message, _) {
                    HapticFeedback.lightImpact();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.green.shade600,
                      ),
                    );
                    _reload();
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red.shade600,
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  listLoaded: (result) {
                    final list = result.data;
                    if (list.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.warehouse_outlined, size: 56, color: Colors.grey),
                            SizedBox(height: 12),
                            Text('Belum ada gudang',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () async => _reload(),
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                        itemCount: list.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (_, i) {
                          final w = list[i];
                          return TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0, end: 1),
                            duration: Duration(milliseconds: 280 + i * 60),
                            curve: Curves.easeOut,
                            builder: (_, v, child) => Opacity(
                              opacity: v,
                              child: Transform.translate(
                                offset: Offset(0, (1 - v) * 12),
                                child: child,
                              ),
                            ),
                            child: _WarehouseCard(
                              warehouse: w,
                              onEdit:   () => _showEditSheet(w),
                              onDelete: () => _confirmDelete(w),
                            ),
                          );
                        },
                      ),
                    );
                  },
                  actionSuccess: (_, __) =>
                      const Center(child: CircularProgressIndicator()),
                  error: (msg) => Center(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.error_outline, size: 48, color: Colors.red),
                          const SizedBox(height: 12),
                          Text(msg, textAlign: TextAlign.center),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: _reload,
                            icon: const Icon(Icons.refresh),
                            label: const Text('Coba Lagi'),
                          ),
                        ],
                      ),
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

// ── Card ─────────────────────────────────────────────────────────────────────
class _WarehouseCard extends StatelessWidget {
  final AdminWarehouseModel warehouse;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _WarehouseCard({
    required this.warehouse,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final w = warehouse;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _C.surface,
        border: Border.all(color: _C.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Icon ────────────────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _C.primarySoft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.warehouse_rounded, color: _C.primary),
          ),
          const SizedBox(width: 12),

          // ── Info ─────────────────────────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama + badge aktif
                Row(
                  children: [
                    Expanded(
                      child: Text(w.name,
                          style: const TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    _ActiveBadge(isActive: w.isActive),
                  ],
                ),
                const SizedBox(height: 3),
                // Kode · Lokasi
                Text(
                  '${w.code} · ${w.location}',
                  style: const TextStyle(color: _C.textMuted, fontSize: 12.5),
                ),
                // Stok
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.inventory_2_outlined,
                        size: 13, color: _C.textMuted),
                    const SizedBox(width: 4),
                    Text(
                      '${w.stocksCount} unit stok',
                      style: const TextStyle(
                          fontSize: 12, color: _C.textMuted),
                    ),
                  ],
                ),
                // PIC (jika ada)
                if (w.picName != null && w.picName!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.person_outline,
                          size: 13, color: _C.textMuted),
                      const SizedBox(width: 4),
                      Text(
                        w.picName!,
                        style: const TextStyle(
                            fontSize: 12, color: _C.textMuted),
                      ),
                      if (w.picPhone != null && w.picPhone!.isNotEmpty) ...[
                        const Text(' · ',
                            style: TextStyle(
                                fontSize: 12, color: _C.textMuted)),
                        Text(
                          w.picPhone!,
                          style: const TextStyle(
                              fontSize: 12, color: _C.textMuted),
                        ),
                      ],
                    ],
                  ),
                ],
              ],
            ),
          ),

          // ── Actions ───────────────────────────────────────────────────────
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: _C.textMuted, size: 20),
            onSelected: (val) {
              if (val == 'edit')   onEdit();
              if (val == 'delete') onDelete();
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: 'edit',
                child: Row(children: [
                  Icon(Icons.edit_outlined, size: 18),
                  SizedBox(width: 8),
                  Text('Edit'),
                ]),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Row(children: [
                  Icon(Icons.delete_outline, size: 18, color: Colors.red),
                  SizedBox(width: 8),
                  Text('Hapus', style: TextStyle(color: Colors.red)),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Badge aktif / non-aktif ───────────────────────────────────────────────────
class _ActiveBadge extends StatelessWidget {
  final bool isActive;
  const _ActiveBadge({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: isActive ? Colors.green.shade50 : Colors.red.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isActive ? 'Aktif' : 'Non-aktif',
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
          color: isActive ? Colors.green.shade700 : Colors.red.shade700,
        ),
      ),
    );
  }
}

// ── Form bottom sheet ────────────────────────────────────────────────────────
class _WarehouseFormSheet extends StatefulWidget {
  final String title;
  final TextEditingController codeCtrl;
  final TextEditingController nameCtrl;
  final TextEditingController locationCtrl;
  final TextEditingController picNameCtrl;
  final TextEditingController picPhoneCtrl;
  final bool initialIsActive;
  final void Function(bool isActive) onSave;

  const _WarehouseFormSheet({
    required this.title,
    required this.codeCtrl,
    required this.nameCtrl,
    required this.locationCtrl,
    required this.picNameCtrl,
    required this.picPhoneCtrl,
    this.initialIsActive = true,
    required this.onSave,
  });

  @override
  State<_WarehouseFormSheet> createState() => _WarehouseFormSheetState();
}

class _WarehouseFormSheetState extends State<_WarehouseFormSheet> {
  late bool _isActive;

  @override
  void initState() {
    super.initState();
    _isActive = widget.initialIsActive;
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 24, right: 24, top: 16,
        bottom: 24 + mq.viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 36, height: 4,
                margin: const EdgeInsets.only(bottom: 18),
                decoration: BoxDecoration(
                  color: _C.border,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Text(widget.title,
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
            const SizedBox(height: 16),

            // Kode Gudang
            TextField(
              controller: widget.codeCtrl,
              decoration: _inputDecor('Kode Gudang *'),
            ),
            const SizedBox(height: 10),

            // Nama Gudang
            TextField(
              controller: widget.nameCtrl,
              decoration: _inputDecor('Nama Gudang *'),
            ),
            const SizedBox(height: 10),

            // Lokasi
            TextField(
              controller: widget.locationCtrl,
              decoration: _inputDecor('Lokasi / Alamat *'),
              maxLines: 2,
            ),
            const SizedBox(height: 10),

            // PIC Name
            TextField(
              controller: widget.picNameCtrl,
              decoration: _inputDecor('Nama PIC (opsional)'),
            ),
            const SizedBox(height: 10),

            // PIC Phone
            TextField(
              controller: widget.picPhoneCtrl,
              decoration: _inputDecor('No. Telp PIC (opsional)'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),

            // Toggle Aktif
            Row(
              children: [
                const Expanded(
                  child: Text('Status Aktif',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                Switch.adaptive(
                  value: _isActive,
                  activeColor: _C.primary,
                  onChanged: (v) => setState(() => _isActive = v),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _C.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => widget.onSave(_isActive),
                child: Text(widget.title),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecor(String label) => InputDecoration(
        labelText: label,
        isDense: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: _C.border),
        ),
      );
}