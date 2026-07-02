import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/model/response/supplier_response_model.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/admin/supplier/supplier_bloc.dart';

class SupplierListPage extends StatefulWidget {
  const SupplierListPage({super.key});
  @override
  State<SupplierListPage> createState() => _SupplierListPageState();
}

class _SupplierListPageState extends State<SupplierListPage> {
  final _searchCtrl = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  SnackBar _snack(String msg, Color c) => SnackBar(
      content: Text(msg),
      backgroundColor: c,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Supplier'),
        backgroundColor: AppColors.surface,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showSheet(context),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Supplier Baru'),
      ),
      body: BlocConsumer<SupplierBloc, SupplierState>(
        listener: (ctx, state) => state.maybeWhen(
          success: (msg) {
            ScaffoldMessenger.of(ctx)
                .showSnackBar(_snack(msg, AppColors.success));
          },
          error: (msg) => ScaffoldMessenger.of(ctx)
              .showSnackBar(_snack(msg, AppColors.danger)),
          orElse: () {},
        ),
        builder: (ctx, state) => Column(children: [
          // Search
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
            child: TextField(
              controller: _searchCtrl,
              decoration: InputDecoration(
                hintText: 'Cari supplier...',
                prefixIcon: const Icon(Icons.search_rounded),
                suffixIcon: _searchCtrl.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () {
                          _searchCtrl.clear();
                          setState(() => _searchQuery = '');
                        }),
              ),
              onChanged: (v) => setState(() => _searchQuery = v),
            ),
          ),

          // List
          Expanded(
            child: state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (suppliers) {
                final filtered = _searchQuery.isEmpty
                    ? suppliers
                    : suppliers
                        .where((s) => s.name
                            .toLowerCase()
                            .contains(_searchQuery.toLowerCase()))
                        .toList();

                if (filtered.isEmpty) return _empty();

                return RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () async => ctx
                      .read<SupplierBloc>()
                      .add(const SupplierEvent.loadSuppliers()),
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 100),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) => TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: Duration(milliseconds: 250 + i * 60),
                      curve: Curves.easeOut,
                      builder: (_, v, child) => Opacity(
                          opacity: v,
                          child: Transform.translate(
                              offset: Offset(0, (1 - v) * 12),
                              child: child)),
                      child: _SupplierTile(
                        supplier: filtered[i],
                        onEdit: () => _showSheet(ctx, existing: filtered[i]),
                        onDelete: () => _confirmDelete(ctx, filtered[i]),
                      ),
                    ),
                  ),
                );
              },
              error: (msg) => Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline,
                      size: 48, color: AppColors.danger),
                  const SizedBox(height: 12),
                  Text(msg, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () => ctx
                          .read<SupplierBloc>()
                          .add(const SupplierEvent.loadSuppliers()),
                      child: const Text('Coba Lagi')),
                ],
              )),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        ]),
      ),
    );
  }

  void _showSheet(BuildContext ctx, {SupplierModel? existing}) {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final codeCtrl = TextEditingController(text: existing?.code ?? '');
    final cpCtrl = TextEditingController(text: existing?.contactPerson ?? '');
    final phoneCtrl = TextEditingController(text: existing?.phone ?? '');
    final emailCtrl = TextEditingController(text: existing?.email ?? '');
    final addressCtrl = TextEditingController(text: existing?.address ?? '');
    final cityCtrl = TextEditingController(text: existing?.city ?? '');
    final npwpCtrl = TextEditingController(text: existing?.npwp ?? '');

    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetCtx) => BlocProvider.value(
        value: ctx.read<SupplierBloc>(),
        child: DraggableScrollableSheet(
          initialChildSize: .85,
          minChildSize: .5,
          maxChildSize: .95,
          expand: false,
          builder: (_, sc) => Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
            child: Column(children: [
              Container(
                  width: 36,
                  height: 4,
                  margin: const EdgeInsets.only(top: 12, bottom: 4),
                  decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(8))),
              Expanded(
                  child: ListView(
                controller: sc,
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                children: [
                  Text(existing == null ? 'Tambah Supplier' : 'Edit Supplier',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 14),
                  _field(nameCtrl, 'Nama Supplier *'),
                  const SizedBox(height: 10),
                  _field(codeCtrl, 'Kode Supplier *'),
                  const SizedBox(height: 10),
                  _field(cpCtrl, 'Nama Kontak'),
                  const SizedBox(height: 10),
                  _field(phoneCtrl, 'Telepon',
                      keyboardType: TextInputType.phone),
                  const SizedBox(height: 10),
                  _field(emailCtrl, 'Email',
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 10),
                  _field(addressCtrl, 'Alamat', maxLines: 2),
                  const SizedBox(height: 10),
                  _field(cityCtrl, 'Kota'),
                  const SizedBox(height: 10),
                  _field(npwpCtrl, 'NPWP (Opsional)'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (nameCtrl.text.trim().isEmpty ||
                          codeCtrl.text.trim().isEmpty) return;
                      Navigator.pop(sheetCtx);

                      final data = <String, dynamic>{
                        'name': nameCtrl.text.trim(),
                        'code': codeCtrl.text.trim(),
                        if (cpCtrl.text.trim().isNotEmpty)
                          'contact_person': cpCtrl.text.trim(),
                        if (phoneCtrl.text.trim().isNotEmpty)
                          'phone': phoneCtrl.text.trim(),
                        if (emailCtrl.text.trim().isNotEmpty)
                          'email': emailCtrl.text.trim(),
                        if (addressCtrl.text.trim().isNotEmpty)
                          'address': addressCtrl.text.trim(),
                        if (cityCtrl.text.trim().isNotEmpty)
                          'city': cityCtrl.text.trim(),
                        if (npwpCtrl.text.trim().isNotEmpty)
                          'npwp': npwpCtrl.text.trim(),
                      };

                      if (existing == null) {
                        ctx
                            .read<SupplierBloc>()
                            .add(SupplierEvent.createSupplier(data));
                      } else {
                        ctx.read<SupplierBloc>().add(SupplierEvent.updateSupplier(
                            supplierId: existing.id.toString(), data: data));
                      }
                    },
                    child: Text(existing == null
                        ? 'Simpan Supplier'
                        : 'Update Supplier'),
                  ),
                ],
              )),
            ]),
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext ctx, SupplierModel s) {
    showDialog(
      context: ctx,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Hapus Supplier?'),
        content: Text('Hapus "${s.name}" dari sistem?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogCtx);
              ctx.read<SupplierBloc>().add(SupplierEvent.deleteSupplier(s.id.toString()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  Widget _field(TextEditingController ctrl, String label,
          {TextInputType keyboardType = TextInputType.text, int maxLines = 1}) =>
      TextField(
          controller: ctrl,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(labelText: label));

  Widget _empty() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    color: AppColors.bg, shape: BoxShape.circle),
                child: const Icon(Icons.local_shipping_outlined,
                    color: AppColors.primary, size: 32)),
            const SizedBox(height: 14),
            const Text('Belum ada supplier terdaftar',
                style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
          ],
        ),
      );
}

// ── Supplier Tile ─────────────────────────────────────────────────────────
class _SupplierTile extends StatelessWidget {
  final SupplierModel supplier;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _SupplierTile(
      {required this.supplier, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey('supp_${supplier.id}'),
      direction: DismissDirection.endToStart,
      background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              color: AppColors.danger, borderRadius: BorderRadius.circular(14)),
          child:
              const Icon(Icons.delete_outline_rounded, color: Colors.white)),
      confirmDismiss: (_) async => await showDialog<bool>(
              context: context,
              builder: (dialogCtx) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    title: const Text('Hapus supplier?'),
                    content: Text('Hapus "${supplier.name}" dari sistem?'),
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.pop(dialogCtx, false),
                          child: const Text('Batal')),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.danger),
                          onPressed: () => Navigator.pop(dialogCtx, true),
                          child: const Text('Hapus')),
                    ],
                  )) ??
          false,
      onDismissed: (_) {
        HapticFeedback.lightImpact();
        context.read<SupplierBloc>().add(SupplierEvent.deleteSupplier(supplier.id.toString()));
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(14)),
        child: Row(children: [
          Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.info.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.local_shipping_rounded,
                  color: AppColors.info, size: 22)),
          const SizedBox(width: 12),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(supplier.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 14)),
              const SizedBox(height: 2),
              Text(
                  '${supplier.code}'
                  '${supplier.city != null ? ' · ${supplier.city}' : ''}',
                  style:
                      const TextStyle(color: AppColors.textMuted, fontSize: 12)),
              if (supplier.contactPerson != null) ...[
                const SizedBox(height: 2),
                Row(children: [
                  const Icon(Icons.person_outline,
                      size: 11, color: AppColors.textMuted),
                  const SizedBox(width: 4),
                  Text(supplier.contactPerson!,
                      style: const TextStyle(
                          color: AppColors.textMuted, fontSize: 11)),
                ]),
              ],
              if (supplier.phone != null) ...[
                const SizedBox(height: 1),
                Row(children: [
                  const Icon(Icons.phone_outlined,
                      size: 11, color: AppColors.textMuted),
                  const SizedBox(width: 4),
                  Text(supplier.phone!,
                      style: const TextStyle(
                          color: AppColors.textMuted, fontSize: 11)),
                ]),
              ],
            ],
          )),
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                    color: supplier.isActive
                        ? AppColors.successSoft
                        : AppColors.dangerSoft,
                    borderRadius: BorderRadius.circular(6)),
                child: Text(supplier.isActive ? 'Aktif' : 'Nonaktif',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: supplier.isActive
                            ? AppColors.success
                            : AppColors.danger))),
            const SizedBox(height: 8),
            GestureDetector(
                onTap: onEdit,
                child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: AppColors.primarySoft,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.edit_outlined,
                        color: AppColors.primary, size: 16))),
          ]),
        ]),
      ),
    );
  }
}



