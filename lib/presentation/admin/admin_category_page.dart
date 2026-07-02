import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/model/response/admin/category_response_model.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/admin/category/category_bloc.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final _searchCtrl = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(const CategoryEvent.loadCategories());
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  SnackBar _snack(String msg, Color c) => SnackBar(
        content: Text(msg),
        backgroundColor: c,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      );

  void _add() => _showSheet(context);

  void _edit(CategoryModel c) => _showSheet(context, existing: c);

  void _showSheet(BuildContext ctx, {CategoryModel? existing}) {
    final nameCtrl = TextEditingController(text: existing?.name ?? '');
    final descCtrl = TextEditingController(text: existing?.description ?? '');

    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetCtx) {
        final mq = MediaQuery.of(sheetCtx);
        return BlocProvider.value(
          value: ctx.read<CategoryBloc>(),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
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
                Text(
                  existing == null ? 'Tambah Kategori' : 'Edit Kategori',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: nameCtrl,
                  decoration:
                      const InputDecoration(labelText: 'Nama Kategori *'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: descCtrl,
                  maxLines: 2,
                  decoration: const InputDecoration(labelText: 'Deskripsi'),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    if (nameCtrl.text.trim().isEmpty) return;

                    final data = <String, dynamic>{
                      'name': nameCtrl.text.trim(),
                      if (descCtrl.text.trim().isNotEmpty)
                        'description': descCtrl.text.trim(),
                    };

                    if (existing == null) {
                      ctx
                          .read<CategoryBloc>()
                          .add(CategoryEvent.createCategory(data));
                    } else {
                      ctx.read<CategoryBloc>().add(CategoryEvent.updateCategory(
                          categoryId: existing.id.toString(), data: data));
                    }

                    Navigator.pop(sheetCtx);
                    HapticFeedback.lightImpact();
                  },
                  child: Text(
                      existing == null ? 'Simpan Kategori' : 'Update Kategori'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _confirmDelete(CategoryModel c) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Hapus Kategori?'),
        content: Text('Hapus "${c.name}" dari sistem?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogCtx);
              context
                  .read<CategoryBloc>()
                  .add(CategoryEvent.deleteCategory(c.id.toString()));
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Kategori'),
        backgroundColor: AppColors.surface,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: _add,
        icon: const Icon(Icons.add),
        label: const Text('Kategori Baru'),
      ),
      body: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (ctx, state) => state.maybeWhen(
          success: (msg) => ScaffoldMessenger.of(ctx)
              .showSnackBar(_snack(msg, AppColors.success)),
          error: (msg) => ScaffoldMessenger.of(ctx)
              .showSnackBar(_snack(msg, AppColors.danger)),
          orElse: () {},
        ),
        builder: (ctx, state) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
              child: TextField(
                controller: _searchCtrl,
                decoration: InputDecoration(
                  hintText: 'Cari kategori...',
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
            Expanded(
              child: state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (categories) {
                  final filtered = _searchQuery.isEmpty
                      ? categories
                      : categories
                          .where((c) => c.name
                              .toLowerCase()
                              .contains(_searchQuery.toLowerCase()))
                          .toList();

                  if (filtered.isEmpty) return _empty();

                  return RefreshIndicator(
                    color: AppColors.primary,
                    onRefresh: () async => ctx
                        .read<CategoryBloc>()
                        .add(const CategoryEvent.loadCategories()),
                    child: GridView.builder(
                      padding: const EdgeInsets.fromLTRB(20, 4, 20, 90),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.95,
                      ),
                      itemCount: filtered.length,
                      itemBuilder: (_, i) {
                        final c = filtered[i];
                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration: Duration(milliseconds: 250 + i * 80),
                          curve: Curves.easeOut,
                          builder: (_, v, child) => Opacity(
                            opacity: v,
                            child: Transform.scale(
                              scale: 0.85 + 0.15 * v,
                              child: child,
                            ),
                          ),
                          child: _CategoryCard(
                            category: c,
                            onEdit: () => _edit(c),
                            onDelete: () => _confirmDelete(c),
                          ),
                        );
                      },
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
                            .read<CategoryBloc>()
                            .add(const CategoryEvent.loadCategories()),
                        child: const Text('Coba Lagi'),
                      ),
                    ],
                  ),
                ),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _empty() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                  color: AppColors.bg, shape: BoxShape.circle),
              child: const Icon(Icons.category_outlined,
                  color: AppColors.info, size: 32),
            ),
            const SizedBox(height: 14),
            const Text('Belum ada kategori terdaftar',
                style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
          ],
        ),
      );
}

// ── Category Card ───────────────────────────────────────────────────────
class _CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _CategoryCard({
    required this.category,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onEdit,
      onLongPress: onDelete,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.infoSoft,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:
                      const Icon(Icons.category_rounded, color: AppColors.info),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onEdit,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.primarySoft,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.edit_outlined,
                        color: AppColors.primary, size: 16),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
            ),
            const SizedBox(height: 2),
            Text(
              category.description?.isNotEmpty == true
                  ? category.description!
                  : 'Tanpa deskripsi',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
