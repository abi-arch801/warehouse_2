import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/model/response/stock_response_model.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/category/category_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/opname/opname_bloc.dart';

// ─────────────────────────────────────────────────────────────────────────
// Halaman buat opname baru
// Alur:
//   1. Pilih gudang
//   2. Pilih scope: Semua Produk | Per Kategori | Pilih Manual
//   3. (scope=category) → pilih kategori
//   4. (scope=manual)   → search & centang produk
//   5. Isi tanggal + catatan
//   6. Submit → worksheet dibuat di backend
// ─────────────────────────────────────────────────────────────────────────
class OpnameCreatePage extends StatefulWidget {
  const OpnameCreatePage({super.key});

  @override
  State<OpnameCreatePage> createState() => _OpnameCreatePageState();
}

class _OpnameCreatePageState extends State<OpnameCreatePage> {
  // ── form state ──────────────────────────────────────────────────────────
  int? _warehouseId;
  String _warehouseName = '';
  String _scope = 'all'; // all | category | manual
  int? _categoryId;
  String _categoryName = '';
  final _dateCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();
  final _searchCtrl = TextEditingController();

  // scope=manual: daftar produk yang sudah di-load & diseleksi
  List<ProductForOpnameModel> _products = [];
  bool _productsLoading = false;

  @override
  void initState() {
    super.initState();
    _dateCtrl.text = DateTime.now().toIso8601String().substring(0, 10);
  }

  @override
  void dispose() {
    _dateCtrl.dispose();
    _notesCtrl.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  // ── Load produk untuk scope manual ──────────────────────────────────────
  void _loadProducts({String? search}) {
    if (_warehouseId == null) return;
    context.read<OpnameBloc>().add(OpnameEvent.loadProductsForOpname(
          warehouseId: _warehouseId!,
          search: search,
        ));
    setState(() => _productsLoading = true);
  }

  // ── Validasi & submit ────────────────────────────────────────────────────
  void _submit() {
    if (_warehouseId == null) {
      _showSnack('Pilih gudang terlebih dahulu.', Colors.red);
      return;
    }
    if (_scope == 'category' && _categoryId == null) {
      _showSnack('Pilih kategori terlebih dahulu.', Colors.red);
      return;
    }
    if (_scope == 'manual') {
      final selected = _products.where((p) => p.isSelected).toList();
      if (selected.isEmpty) {
        _showSnack('Pilih minimal 1 produk.', Colors.red);
        return;
      }
    }

    final body = <String, dynamic>{
      'warehouse_id': _warehouseId,
      'opname_date': _dateCtrl.text.trim(),
      'scope': _scope,
    };

    if (_scope == 'category') {
      body['category_id'] = _categoryId;
    } else if (_scope == 'manual') {
      body['product_ids'] =
          _products.where((p) => p.isSelected).map((p) => p.productId).toList();
    }

    if (_notesCtrl.text.trim().isNotEmpty) {
      body['notes'] = _notesCtrl.text.trim();
    }

    context.read<OpnameBloc>().add(OpnameEvent.store(body));
  }

  void _showSnack(String msg, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: color),
    );
  }

  // ── Helpers UI ───────────────────────────────────────────────────────────
  String get _scopeLabel {
    switch (_scope) {
      case 'category':
        return 'Per Kategori';
      case 'manual':
        return 'Pilih Produk';
      default:
        return 'Semua Produk';
    }
  }

  int get _selectedCount => _products.where((p) => p.isSelected).length;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<OpnameBloc>()),
        BlocProvider(
          create: (_) =>
              AdminWarehouseBloc()..add(const AdminWarehouseEvent.load()),
        ),
        BlocProvider(
          create: (_) =>
              CategoryBloc()..add(const CategoryEvent.loadCategories()),
        ),
      ],
      child: BlocListener<OpnameBloc, OpnameState>(
        listener: (ctx, state) {
          state.maybeWhen(
            actionLoading: () {},
            actionSuccess: (msg, data) {
              Navigator.pop(ctx, true); // kembali ke list dan refresh
            },
            productsLoaded: (res) {
              setState(() {
                // Pertahankan status isSelected yang sudah di-set sebelumnya
                final prevSelected = {
                  for (final p in _products)
                    if (p.isSelected) p.productId
                };
                _products = res.data.map((p) {
                  p.isSelected = prevSelected.contains(p.productId);
                  return p;
                }).toList();
                _productsLoading = false;
              });
            },
            error: (msg) {
              setState(() => _productsLoading = false);
              _showSnack(msg, Colors.red);
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          backgroundColor: AppColors.bg,
          appBar: AppBar(
            title: const Text('Buat Stock Opname'),
            backgroundColor: Colors.white,
            foregroundColor: AppColors.text,
            elevation: 0,
          ),
          body: _buildBody(),
          bottomNavigationBar: _buildBottomBar(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('Informasi Dasar'),
          const SizedBox(height: 8),
          _buildWarehouseDropdown(),
          const SizedBox(height: 12),
          _buildDatePicker(),
          const SizedBox(height: 12),
          _buildNotesField(),
          const SizedBox(height: 20),

          _sectionTitle('Scope Opname'),
          const SizedBox(height: 8),
          _buildScopeSelector(),
          const SizedBox(height: 16),

          // Konten scope-specific
          if (_scope == 'category') ...[
            _sectionTitle('Pilih Kategori'),
            const SizedBox(height: 8),
            _buildCategoryDropdown(),
          ],
          if (_scope == 'manual') ...[
            _sectionTitle(
              'Pilih Produk',
              trailing: _selectedCount > 0
                  ? Text(
                      '$_selectedCount dipilih',
                      style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    )
                  : null,
            ),
            const SizedBox(height: 8),
            _buildProductSearch(),
            const SizedBox(height: 8),
            _buildProductList(),
          ],

          const SizedBox(height: 80), // ruang untuk bottom bar
        ],
      ),
    );
  }

  // ── Gudang dropdown ──────────────────────────────────────────────────────
  Widget _buildWarehouseDropdown() {
    return BlocBuilder<AdminWarehouseBloc, AdminWarehouseState>(
      builder: (context, state) {
        final warehouses = state.maybeWhen(
          listLoaded: (res) => res.data,
          orElse: () => [],
        );
        return DropdownButtonFormField<int>(
          value: _warehouseId,
          decoration: _decoration('Gudang', Icons.warehouse_outlined),
          hint: const Text('Pilih gudang'),
          items: warehouses
              .map<DropdownMenuItem<int>>(
                (w) => DropdownMenuItem<int>(
                  value: w.id,
                  child: Text(w.name),
                ),
              )
              .toList(),
          onChanged: (v) {
            setState(() {
              _warehouseId = v;
              _warehouseName = warehouses.firstWhere((w) => w.id == v).name;
              // Reset produk list saat gudang berubah
              _products = [];
            });
            if (_scope == 'manual' && v != null) {
              _loadProducts();
            }
          },
        );
      },
    );
  }

  // ── Date picker ──────────────────────────────────────────────────────────
  Widget _buildDatePicker() {
    return TextFormField(
      controller: _dateCtrl,
      readOnly: true,
      decoration: _decoration('Tanggal Opname', Icons.calendar_today_outlined),
      onTap: () async {
        final d = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030),
        );
        if (d != null) {
          _dateCtrl.text = d.toIso8601String().substring(0, 10);
        }
      },
    );
  }

  // ── Notes ────────────────────────────────────────────────────────────────
  Widget _buildNotesField() {
    return TextFormField(
      controller: _notesCtrl,
      maxLines: 2,
      decoration: _decoration('Catatan (opsional)', Icons.notes_outlined),
    );
  }

  // ── Scope selector (3 pilihan) ───────────────────────────────────────────
  Widget _buildScopeSelector() {
    return Row(
      children: [
        _scopeChip('all', 'Semua Produk', Icons.inventory_2_outlined),
        const SizedBox(width: 8),
        _scopeChip('category', 'Per Kategori', Icons.category_outlined),
        const SizedBox(width: 8),
        _scopeChip('manual', 'Pilih Manual', Icons.checklist_outlined),
      ],
    );
  }

  Widget _scopeChip(String value, String label, IconData icon) {
    final selected = _scope == value;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _scope = value;
            if (value == 'manual' &&
                _warehouseId != null &&
                _products.isEmpty) {
              _loadProducts();
            }
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? AppColors.primary : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? AppColors.primary : AppColors.border,
            ),
          ),
          child: Column(
            children: [
              Icon(icon,
                  size: 20,
                  color: selected ? Colors.white : AppColors.textMuted),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: selected ? Colors.white : AppColors.textMuted,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Category dropdown ────────────────────────────────────────────────────
  Widget _buildCategoryDropdown() {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        final categories = state.maybeWhen(
          loaded: (categories) => categories,
          orElse: () => [],
        );
        return DropdownButtonFormField<int>(
          value: _categoryId,
          decoration: _decoration('Kategori', Icons.category_outlined),
          hint: const Text('Pilih kategori'),
          items: categories
              .map<DropdownMenuItem<int>>(
                (w) => DropdownMenuItem<int>(
                  value: w.id,
                  child: Text(w.name),
                ),
              )
              .toList(),
          onChanged: (v) => setState(() {
            _categoryId = v;
            _categoryName = categories.firstWhere((c) => c.id == v).name;
          }),
        );
      },
    );
  }

  // ── Search produk (scope=manual) ─────────────────────────────────────────
  Widget _buildProductSearch() {
    return TextField(
      controller: _searchCtrl,
      decoration: InputDecoration(
        hintText: 'Cari nama / SKU produk...',
        prefixIcon: const Icon(Icons.search, size: 20),
        suffixIcon: _searchCtrl.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear, size: 18),
                onPressed: () {
                  _searchCtrl.clear();
                  _loadProducts();
                },
              )
            : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      ),
      onChanged: (v) => _loadProducts(search: v.isEmpty ? null : v),
    );
  }

  // ── Daftar produk untuk dipilih ──────────────────────────────────────────
  Widget _buildProductList() {
    if (_warehouseId == null) {
      return _emptyHint(
          Icons.warehouse_outlined, 'Pilih gudang terlebih dahulu');
    }
    if (_productsLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (_products.isEmpty) {
      return _emptyHint(
          Icons.inventory_2_outlined, 'Tidak ada produk di gudang ini');
    }

    return Column(
      children: _products.map((p) {
        return Card(
          margin: const EdgeInsets.only(bottom: 6),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          color:
              p.isSelected ? AppColors.primary.withOpacity(0.06) : Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => setState(() => p.isSelected = !p.isSelected),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Row(
                children: [
                  // Checkbox
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: p.isSelected ? AppColors.primary : Colors.white,
                      border: Border.all(
                        color:
                            p.isSelected ? AppColors.primary : AppColors.border,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: p.isSelected
                        ? const Icon(Icons.check, size: 14, color: Colors.white)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  // Info produk
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p.productName,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: p.isSelected
                                ? AppColors.primary
                                : AppColors.text,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          p.productSku,
                          style: const TextStyle(
                              fontSize: 11, color: AppColors.textMuted),
                        ),
                      ],
                    ),
                  ),
                  // Stok saat ini
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${p.currentStock}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.text,
                        ),
                      ),
                      Text(
                        p.productUnit,
                        style: const TextStyle(
                            fontSize: 10, color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ── Bottom bar ───────────────────────────────────────────────────────────
  Widget _buildBottomBar() {
    return BlocBuilder<OpnameBloc, OpnameState>(
      builder: (ctx, state) {
        final loading = state.maybeWhen(
          actionLoading: () => true,
          orElse: () => false,
        );

        // Ringkasan scope
        String scopeDesc = '';
        if (_warehouseId != null) {
          switch (_scope) {
            case 'category':
              scopeDesc = _categoryId != null
                  ? 'Kategori: $_categoryName'
                  : 'Belum pilih kategori';
              break;
            case 'manual':
              scopeDesc = '$_selectedCount produk dipilih';
              break;
            default:
              scopeDesc = 'Semua produk di $_warehouseName';
          }
        }

        return Container(
          padding: EdgeInsets.fromLTRB(
              16, 12, 16, 12 + MediaQuery.of(context).padding.bottom),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, -2))
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (scopeDesc.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline,
                          size: 14, color: AppColors.textMuted),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          scopeDesc,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textMuted),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: loading ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
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
                      : const Text(
                          'Buat Opname & Generate Worksheet',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ── Helpers ──────────────────────────────────────────────────────────────
  InputDecoration _decoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 20),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    );
  }

  Widget _sectionTitle(String title, {Widget? trailing}) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w700, fontSize: 14, color: AppColors.text),
        ),
        if (trailing != null) ...[
          const Spacer(),
          trailing,
        ],
      ],
    );
  }

  Widget _emptyHint(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28),
      alignment: Alignment.center,
      child: Column(
        children: [
          Icon(icon, size: 36, color: AppColors.textMuted.withOpacity(0.4)),
          const SizedBox(height: 8),
          Text(text,
              style: const TextStyle(fontSize: 13, color: AppColors.textMuted),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
