// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:warehouse/presentation/admin/app_theme.dart';
// import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';

// /// Safely parse harga dari backend — bisa String "10000.00" atau num 10000
// double? _toDouble(dynamic v) {
//   if (v == null) return null;
//   if (v is num) return v.toDouble();
//   if (v is String) return double.tryParse(v);
//   return null;
// }

// /// Safely parse int dari backend — bisa String atau int
// int _toInt(dynamic v, [int fallback = 0]) {
//   if (v == null) return fallback;
//   if (v is int) return v;
//   if (v is num) return v.toInt();
//   if (v is String) return int.tryParse(v) ?? fallback;
//   return fallback;
// }

// class AdminProductListPage extends StatefulWidget {
//   const AdminProductListPage({super.key});

//   @override
//   State<AdminProductListPage> createState() => _AdminProductListPageState();
// }

// class _AdminProductListPageState extends State<AdminProductListPage> {
//   String _search = '';
//   String? _selectedCategory; // null = semua kategori

//   final _rupiah = NumberFormat.currency(
//     locale: 'id_ID',
//     symbol: 'Rp ',
//     decimalDigits: 0,
//   );

//   @override
//   void initState() {
//     super.initState();
//     context.read<AdminProductBloc>().add(const AdminProductEvent.load());
//   }

//   // ── Ambil nama kategori — handle String atau nested Map ─────────────────
//   static String _categoryName(dynamic raw) {
//     if (raw == null) return '';
//     if (raw is String) return raw;
//     if (raw is Map) {
//       return (raw['name'] as String?)?.trim() ?? '';
//     }
//     return raw.toString();
//   }

//   // ── Ambil daftar kategori unik dari list produk ──────────────────────────
//   List<String> _categoriesFrom(List items) {
//     final cats = <String>{};
//     for (final item in items) {
//       final cat = _categoryName((item as Map<String, dynamic>)['category']);
//       if (cat.isNotEmpty) cats.add(cat);
//     }
//     return cats.toList()..sort();
//   }

//   // ── Filter produk berdasarkan search + kategori ──────────────────────────
//   List<Map<String, dynamic>> _filtered(List items) {
//     final q = _search.toLowerCase();
//     return items.whereType<Map<String, dynamic>>().where((p) {
//       final matchSearch = q.isEmpty ||
//           (p['name'] as String? ?? '').toLowerCase().contains(q) ||
//           (p['sku'] as String? ?? '').toLowerCase().contains(q);
//       final matchCat = _selectedCategory == null ||
//           _categoryName(p['category']) == _selectedCategory;
//       return matchSearch && matchCat;
//     }).toList();
//   }

//   // ── Edit price sheet (gaya onclick dengan quick-adjust) ──────────────────
//   void _showEditPriceSheet(BuildContext context, Map<String, dynamic> product) {
//     HapticFeedback.selectionClick();
//     final oldPurchase = _toDouble(product['purchase_price']) ?? 0;
//     final oldSelling = _toDouble(product['selling_price']) ?? 0;
//     final purchaseCtrl = TextEditingController(
//       text: oldPurchase > 0 ? oldPurchase.toInt().toString() : '',
//     );
//     final sellingCtrl = TextEditingController(
//       text: oldSelling > 0 ? oldSelling.toInt().toString() : '',
//     );
//     final reasonCtrl = TextEditingController();

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) => BlocProvider.value(
//         value: context.read<AdminProductBloc>(),
//         child: StatefulBuilder(builder: (ctx, setSt) {
//           final mq = MediaQuery.of(ctx);
//           final newPurchase = double.tryParse(purchaseCtrl.text) ?? 0;
//           final newSelling = double.tryParse(sellingCtrl.text) ?? 0;
//           final diff = newPurchase - oldPurchase;
//           final hasChange = (newPurchase != oldPurchase && newPurchase > 0) ||
//               (newSelling != oldSelling && newSelling > 0);
//           final pctChange = oldPurchase > 0 ? (diff / oldPurchase) * 100 : 0.0;

//           return Padding(
//             padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//               ),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Center(
//                       child: Container(
//                         width: 36,
//                         height: 4,
//                         margin: const EdgeInsets.only(bottom: 18),
//                         decoration: BoxDecoration(
//                           color: AppColors.border,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     ),
//                     // Header
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(10),
//                           decoration: BoxDecoration(
//                             color: AppColors.primarySoft,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: const Icon(Icons.payments_rounded,
//                               color: AppColors.primary),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text('Ubah Harga Produk',
//                                   style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w700)),
//                               const SizedBox(height: 2),
//                               Text(
//                                 '${product['name']} · ${product['sku'] ?? ''}',
//                                 style: const TextStyle(
//                                     fontSize: 12, color: AppColors.textMuted),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 18),
//                     // Harga saat ini
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: AppColors.bg,
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: AppColors.border),
//                       ),
//                       child: Row(
//                         children: [
//                           const Icon(Icons.history_rounded,
//                               size: 16, color: AppColors.textMuted),
//                           const SizedBox(width: 8),
//                           const Text('Harga saat ini',
//                               style: TextStyle(
//                                   fontSize: 12, color: AppColors.textMuted)),
//                           const Spacer(),
//                           Text(
//                             oldPurchase > 0
//                                 ? _rupiah.format(oldPurchase)
//                                 : 'Belum diset',
//                             style: const TextStyle(
//                                 fontWeight: FontWeight.w700, fontSize: 13),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 14),
//                     // Field harga beli
//                     TextField(
//                       controller: purchaseCtrl,
//                       autofocus: true,
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                       onChanged: (_) => setSt(() {}),
//                       decoration: const InputDecoration(
//                         labelText: 'Harga Beli (HPP)',
//                         prefixText: 'Rp ',
//                         helperText: 'Dasar perhitungan jurnal keuangan',
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     // Quick-adjust chips
//                     Wrap(
//                       spacing: 6,
//                       children: [
//                         _quickAdjust('-10%', () {
//                           final v =
//                               (newPurchase == 0 ? oldPurchase : newPurchase) *
//                                   0.9;
//                           purchaseCtrl.text = v.round().toString();
//                           setSt(() {});
//                         }),
//                         _quickAdjust('-5%', () {
//                           final v =
//                               (newPurchase == 0 ? oldPurchase : newPurchase) *
//                                   0.95;
//                           purchaseCtrl.text = v.round().toString();
//                           setSt(() {});
//                         }),
//                         _quickAdjust('+5%', () {
//                           final v =
//                               (newPurchase == 0 ? oldPurchase : newPurchase) *
//                                   1.05;
//                           purchaseCtrl.text = v.round().toString();
//                           setSt(() {});
//                         }),
//                         _quickAdjust('+10%', () {
//                           final v =
//                               (newPurchase == 0 ? oldPurchase : newPurchase) *
//                                   1.10;
//                           purchaseCtrl.text = v.round().toString();
//                           setSt(() {});
//                         }),
//                         _quickAdjust('Reset', () {
//                           purchaseCtrl.text = oldPurchase > 0
//                               ? oldPurchase.toStringAsFixed(0)
//                               : '';
//                           setSt(() {});
//                         }, danger: true),
//                       ],
//                     ),
//                     const SizedBox(height: 14),
//                     // Indikator perubahan harga
//                     AnimatedSwitcher(
//                       duration: const Duration(milliseconds: 220),
//                       child: hasChange && diff != 0
//                           ? Container(
//                               key: ValueKey('${diff}_$newPurchase'),
//                               padding: const EdgeInsets.all(12),
//                               decoration: BoxDecoration(
//                                 color: diff > 0
//                                     ? AppColors.warningSoft
//                                     : AppColors.successSoft,
//                                 borderRadius: BorderRadius.circular(12),
//                                 border: Border.all(
//                                   color: diff > 0
//                                       ? AppColors.warning.withValues(alpha: 0.4)
//                                       : AppColors.success
//                                           .withValues(alpha: 0.4),
//                                 ),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     diff > 0
//                                         ? Icons.trending_up_rounded
//                                         : Icons.trending_down_rounded,
//                                     color: diff > 0
//                                         ? AppColors.warning
//                                         : AppColors.success,
//                                   ),
//                                   const SizedBox(width: 10),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           diff > 0
//                                               ? 'Harga naik'
//                                               : 'Harga turun',
//                                           style: TextStyle(
//                                             fontWeight: FontWeight.w700,
//                                             fontSize: 12,
//                                             color: diff > 0
//                                                 ? AppColors.warning
//                                                 : AppColors.success,
//                                           ),
//                                         ),
//                                         Text(
//                                           '${diff > 0 ? '+' : ''}${_rupiah.format(diff)}'
//                                           '${oldPurchase > 0 ? '  (${pctChange.toStringAsFixed(1)}%)' : ''}',
//                                           style: const TextStyle(
//                                               fontSize: 12.5,
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           : const SizedBox.shrink(),
//                     ),
//                     const SizedBox(height: 10),
//                     // Field harga jual
//                     TextField(
//                       controller: sellingCtrl,
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                       onChanged: (_) => setSt(() {}),
//                       decoration: const InputDecoration(
//                         labelText: 'Harga Jual',
//                         prefixText: 'Rp ',
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // Alasan perubahan
//                     TextField(
//                       controller: reasonCtrl,
//                       maxLines: 2,
//                       decoration: const InputDecoration(
//                         labelText: 'Alasan perubahan (opsional)',
//                         hintText:
//                             'Contoh: kenaikan harga supplier, promo, koreksi...',
//                       ),
//                     ),
//                     const SizedBox(height: 18),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: OutlinedButton(
//                             onPressed: () => Navigator.pop(ctx),
//                             child: const Text('Batal'),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: ElevatedButton.icon(
//                             onPressed: hasChange
//                                 ? () {
//                                     final data = <String, dynamic>{
//                                       if (purchaseCtrl.text.trim().isNotEmpty)
//                                         'purchase_price': double.tryParse(
//                                             purchaseCtrl.text.trim()),
//                                       if (sellingCtrl.text.trim().isNotEmpty)
//                                         'selling_price': double.tryParse(
//                                             sellingCtrl.text.trim()),
//                                     };
//                                     Navigator.pop(ctx);
//                                     HapticFeedback.mediumImpact();
//                                     context
//                                         .read<AdminProductBloc>()
//                                         .add(AdminProductEvent.update(
//                                           productId: _toInt(product['id']),
//                                           data: data,
//                                         ));
//                                   }
//                                 : null,
//                             icon: const Icon(Icons.save_rounded, size: 18),
//                             label: const Text('Simpan Harga'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }

//   Widget _quickAdjust(String label, VoidCallback onTap, {bool danger = false}) {
//     return ActionChip(
//       label: Text(
//         label,
//         style: TextStyle(
//           fontSize: 11.5,
//           fontWeight: FontWeight.w700,
//           color: danger ? AppColors.danger : AppColors.primaryDark,
//         ),
//       ),
//       backgroundColor: danger ? AppColors.dangerSoft : AppColors.primarySoft,
//       side: BorderSide.none,
//       onPressed: () {
//         HapticFeedback.selectionClick();
//         onTap();
//       },
//     );
//   }

//   // ── Category filter chip ─────────────────────────────────────────────────
//   Widget _categoryChip({
//     required String label,
//     required int count,
//     required bool selected,
//     required VoidCallback onTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8),
//       child: ChoiceChip(
//         selected: selected,
//         onSelected: (_) {
//           HapticFeedback.selectionClick();
//           onTap();
//         },
//         showCheckmark: false,
//         labelPadding: const EdgeInsets.symmetric(horizontal: 4),
//         label: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 12.5,
//                 fontWeight: FontWeight.w700,
//                 color: selected ? Colors.white : AppColors.text,
//               ),
//             ),
//             const SizedBox(width: 6),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
//               decoration: BoxDecoration(
//                 color: selected
//                     ? Colors.white.withValues(alpha: 0.22)
//                     : AppColors.bg,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Text(
//                 '$count',
//                 style: TextStyle(
//                   fontSize: 11,
//                   fontWeight: FontWeight.w700,
//                   color: selected ? Colors.white : AppColors.textMuted,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         backgroundColor: AppColors.surface,
//         selectedColor: AppColors.primary,
//         side: BorderSide(
//           color: selected ? AppColors.primary : AppColors.border,
//         ),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       ),
//     );
//   }

//   void _showAddSheet(BuildContext context) {
//     HapticFeedback.lightImpact();
//     _showProductSheet(context, null);
//   }

//   void _showProductSheet(BuildContext context, Map<String, dynamic>? existing) {
//     final nameCtrl =
//         TextEditingController(text: existing?['name'] as String? ?? '');
//     final skuCtrl =
//         TextEditingController(text: existing?['sku'] as String? ?? '');
//     final descCtrl =
//         TextEditingController(text: existing?['description'] as String? ?? '');
//     final unitCtrl =
//         TextEditingController(text: existing?['unit'] as String? ?? '');
//     final minStockCtrl =
//         TextEditingController(text: '${existing?['min_stock'] ?? 0}');
//     final purchasePriceCtrl = TextEditingController(
//         text: existing != null && _toDouble(existing['purchase_price']) != null
//             ? '${_toDouble(existing['purchase_price'])!.toInt()}'
//             : '');
//     final sellingPriceCtrl = TextEditingController(
//         text: existing != null && _toDouble(existing['selling_price']) != null
//             ? '${_toDouble(existing['selling_price'])!.toInt()}'
//             : '');

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) => BlocProvider.value(
//         value: context.read<AdminProductBloc>(),
//         child: _ProductSheet(
//           existing: existing,
//           nameCtrl: nameCtrl,
//           skuCtrl: skuCtrl,
//           descCtrl: descCtrl,
//           unitCtrl: unitCtrl,
//           minStockCtrl: minStockCtrl,
//           purchasePriceCtrl: purchasePriceCtrl,
//           sellingPriceCtrl: sellingPriceCtrl,
//         ),
//       ),
//     );
//   }

//   void _confirmDelete(BuildContext context, Map<String, dynamic> product) {
//     showDialog(
//       context: context,
//       builder: (dialogCtx) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Text('Hapus Produk?'),
//         content: Text('Hapus "${product['name']}" dari sistem?'),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(dialogCtx),
//               child: const Text('Batal')),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(dialogCtx);
//               context
//                   .read<AdminProductBloc>()
//                   .add(AdminProductEvent.delete(_toInt(product['id'])));
//             },
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.danger,
//                 foregroundColor: Colors.white),
//             child: const Text('Hapus'),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bg,
//       appBar: AppBar(
//         title: const Text('Produk'),
//         backgroundColor: AppColors.surface,
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () => _showAddSheet(context),
//         backgroundColor: AppColors.primary,
//         foregroundColor: Colors.white,
//         icon: const Icon(Icons.add_rounded),
//         label: const Text('Produk Baru'),
//       ),
//       body: BlocConsumer<AdminProductBloc, AdminProductState>(
//         listener: (context, state) {
//           state.maybeWhen(
//             actionSuccess: (msg) {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 content: Text(msg),
//                 backgroundColor: AppColors.success,
//                 behavior: SnackBarBehavior.floating,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//               ));
//               context
//                   .read<AdminProductBloc>()
//                   .add(const AdminProductEvent.load());
//             },
//             error: (msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content: Text(msg),
//               backgroundColor: AppColors.danger,
//               behavior: SnackBarBehavior.floating,
//             )),
//             orElse: () {},
//           );
//         },
//         builder: (context, state) {
//           return state.when(
//             initial: () => const SizedBox.shrink(),
//             loading: () => const Center(child: CircularProgressIndicator()),
//             loaded: (items, totalItems, hasMore) {
//               final allProducts =
//                   items.whereType<Map<String, dynamic>>().toList();
//               final categories = _categoriesFrom(allProducts);
//               final filtered = _filtered(allProducts);

//               return Column(
//                 children: [
//                   // ── Search bar ───────────────────────────────────
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Cari produk atau SKU...',
//                         prefixIcon: const Icon(Icons.search_rounded),
//                         suffixIcon: _search.isEmpty
//                             ? null
//                             : IconButton(
//                                 icon: const Icon(Icons.close_rounded),
//                                 onPressed: () => setState(() => _search = ''),
//                               ),
//                       ),
//                       onChanged: (v) => setState(() => _search = v),
//                     ),
//                   ),
//                   // ── Category filter chips ────────────────────────
//                   SizedBox(
//                     height: 44,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
//                       children: [
//                         _categoryChip(
//                           label: 'Semua',
//                           count: allProducts.length,
//                           selected: _selectedCategory == null,
//                           onTap: () => setState(() => _selectedCategory = null),
//                         ),
//                         ...categories.map((cat) {
//                           final count = allProducts
//                               .where((p) => _categoryName(p['category']) == cat)
//                               .length;
//                           return _categoryChip(
//                             label: cat,
//                             count: count,
//                             selected: _selectedCategory == cat,
//                             onTap: () =>
//                                 setState(() => _selectedCategory = cat),
//                           );
//                         }),
//                       ],
//                     ),
//                   ),
//                   // ── Filter active indicator ──────────────────────
//                   if (_selectedCategory != null || _search.isNotEmpty)
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
//                       child: Row(
//                         children: [
//                           const Icon(Icons.filter_list_rounded,
//                               size: 14, color: AppColors.textMuted),
//                           const SizedBox(width: 6),
//                           Expanded(
//                             child: Text(
//                               [
//                                 if (_selectedCategory != null)
//                                   'Kategori: $_selectedCategory',
//                                 if (_search.isNotEmpty) 'Cari: "$_search"',
//                               ].join(' · '),
//                               style: const TextStyle(
//                                   fontSize: 12, color: AppColors.textMuted),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           Text(
//                             '${filtered.length} produk',
//                             style: const TextStyle(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w700,
//                                 color: AppColors.primary),
//                           ),
//                           TextButton(
//                             onPressed: () => setState(() {
//                               _selectedCategory = null;
//                               _search = '';
//                             }),
//                             style: TextButton.styleFrom(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 8, vertical: 0),
//                               minimumSize: const Size(0, 28),
//                               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                             ),
//                             child: const Text('Reset',
//                                 style: TextStyle(fontSize: 12)),
//                           ),
//                         ],
//                       ),
//                     ),
//                   // ── Product list ─────────────────────────────────
//                   Expanded(
//                     child: filtered.isEmpty
//                         ? Center(
//                             child: Padding(
//                               padding: const EdgeInsets.all(32),
//                               child: Column(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   const Icon(Icons.search_off_rounded,
//                                       size: 48, color: AppColors.textMuted),
//                                   const SizedBox(height: 12),
//                                   Text(
//                                     _selectedCategory != null
//                                         ? 'Tidak ada produk pada kategori "$_selectedCategory"'
//                                         : 'Produk tidak ditemukan',
//                                     textAlign: TextAlign.center,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         : RefreshIndicator(
//                             onRefresh: () async => context
//                                 .read<AdminProductBloc>()
//                                 .add(const AdminProductEvent.load()),
//                             child: ListView.separated(
//                               padding:
//                                   const EdgeInsets.fromLTRB(20, 8, 20, 100),
//                               itemCount: filtered.length,
//                               separatorBuilder: (_, __) =>
//                                   const SizedBox(height: 10),
//                               itemBuilder: (_, i) {
//                                 final product = filtered[i];
//                                 return TweenAnimationBuilder<double>(
//                                   tween: Tween(begin: 0, end: 1),
//                                   duration: Duration(
//                                       milliseconds:
//                                           200 + (i * 50).clamp(0, 500)),
//                                   curve: Curves.easeOut,
//                                   builder: (_, v, child) => Opacity(
//                                     opacity: v,
//                                     child: Transform.translate(
//                                         offset: Offset(0, (1 - v) * 12),
//                                         child: child),
//                                   ),
//                                   child: _ProductTile(
//                                     product: product,
//                                     rupiah: _rupiah,
//                                     onEdit: () =>
//                                         _showProductSheet(context, product),
//                                     onEditPrice: () =>
//                                         _showEditPriceSheet(context, product),
//                                     onDelete: () =>
//                                         _confirmDelete(context, product),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                   ),
//                 ],
//               );
//             },
//             actionLoading: () =>
//                 const Center(child: CircularProgressIndicator()),
//             actionSuccess: (_) =>
//                 const Center(child: CircularProgressIndicator()),
//             error: (msg) => Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.error_outline,
//                       size: 48, color: AppColors.danger),
//                   const SizedBox(height: 12),
//                   Text(msg),
//                   const SizedBox(height: 16),
//                   ElevatedButton(
//                     onPressed: () => context
//                         .read<AdminProductBloc>()
//                         .add(const AdminProductEvent.load()),
//                     child: const Text('Coba Lagi'),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Product Tile
// // ─────────────────────────────────────────────────────────────────────────────
// class _ProductTile extends StatelessWidget {
//   final Map<String, dynamic> product;
//   final NumberFormat rupiah;
//   final VoidCallback onEdit;
//   final VoidCallback onEditPrice;
//   final VoidCallback onDelete;

//   const _ProductTile({
//     required this.product,
//     required this.rupiah,
//     required this.onEdit,
//     required this.onEditPrice,
//     required this.onDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final id = _toInt(product['id']);
//     final name = product['name'] as String? ?? '';
//     final sku = product['sku'] as String? ?? '';
//     final unit = product['unit'] as String? ?? '-';
//     final _catRaw = product['category'];
//     final category = (_catRaw is String)
//         ? (_catRaw.isEmpty ? '-' : _catRaw)
//         : (_catRaw is Map)
//             ? ((_catRaw['name'] as String?)?.trim().isNotEmpty == true
//                 ? (_catRaw['name'] as String).trim()
//                 : '-')
//             : '-';
//     final minStock = _toInt(product['min_stock']);
//     final purchasePrice = _toDouble(product['purchase_price']);
//     final sellingPrice = _toDouble(product['selling_price']);
//     final stockQty = _toInt(product['stock_qty']);
//     final isLow = stockQty <= minStock + 5;

//     return Dismissible(
//       key: ValueKey('product_$id'),
//       direction: DismissDirection.endToStart,
//       background: Container(
//         alignment: Alignment.centerRight,
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         decoration: BoxDecoration(
//           color: AppColors.danger,
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: const Icon(Icons.delete_outline_rounded, color: Colors.white),
//       ),
//       confirmDismiss: (_) async {
//         return await showDialog<bool>(
//               context: context,
//               builder: (dialogCtx) => AlertDialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 title: const Text('Hapus produk?'),
//                 content: Text('Hapus "$name" dari sistem?'),
//                 actions: [
//                   TextButton(
//                       onPressed: () => Navigator.pop(dialogCtx, false),
//                       child: const Text('Batal')),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.danger,
//                         foregroundColor: Colors.white),
//                     onPressed: () => Navigator.pop(dialogCtx, true),
//                     child: const Text('Hapus'),
//                   ),
//                 ],
//               ),
//             ) ??
//             false;
//       },
//       onDismissed: (_) {
//         HapticFeedback.lightImpact();
//         context.read<AdminProductBloc>().add(AdminProductEvent.delete(id));
//       },
//       child: Container(
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: AppColors.surface,
//           border: Border.all(color: AppColors.border),
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ── Row atas: icon + info + badge stok ────────────────
//             Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: AppColors.primarySoft,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Icon(Icons.inventory_2_rounded,
//                       color: AppColors.primary),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(name,
//                           style: const TextStyle(fontWeight: FontWeight.w700)),
//                       const SizedBox(height: 2),
//                       Text(
//                         '$sku · $category · $unit',
//                         style: const TextStyle(
//                             color: AppColors.textMuted, fontSize: 12),
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         'Stok: $stockQty $unit (min $minStock)',
//                         style: const TextStyle(
//                             fontSize: 12, fontWeight: FontWeight.w600),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: isLow ? AppColors.dangerSoft : AppColors.successSoft,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Text(
//                     isLow ? 'Menipis' : 'Aman',
//                     style: TextStyle(
//                       color: isLow ? AppColors.danger : AppColors.success,
//                       fontWeight: FontWeight.w700,
//                       fontSize: 11,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             // ── HPP / harga info row ───────────────────────────────
//             InkWell(
//               onTap: onEditPrice,
//               borderRadius: BorderRadius.circular(10),
//               child: Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: AppColors.bg,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.payments_rounded,
//                         size: 16, color: AppColors.textMuted),
//                     const SizedBox(width: 6),
//                     const Text('HPP',
//                         style: TextStyle(
//                             fontSize: 12, color: AppColors.textMuted)),
//                     const Spacer(),
//                     Text(
//                       purchasePrice != null && purchasePrice > 0
//                           ? rupiah.format(purchasePrice)
//                           : 'Belum diset',
//                       style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         color: (purchasePrice ?? 0) > 0
//                             ? AppColors.text
//                             : AppColors.danger,
//                         fontSize: 13,
//                       ),
//                     ),
//                     if (sellingPrice != null && sellingPrice > 0) ...[
//                       const SizedBox(width: 8),
//                       Container(
//                         width: 1,
//                         height: 14,
//                         color: AppColors.border,
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         rupiah.format(sellingPrice),
//                         style: const TextStyle(
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.primary,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             // ── Action buttons ─────────────────────────────────────
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton.icon(
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: AppColors.primary,
//                       side: const BorderSide(color: AppColors.primary),
//                       minimumSize: const Size.fromHeight(36),
//                     ),
//                     onPressed: onEditPrice,
//                     icon: const Icon(Icons.payments_rounded, size: 15),
//                     label: const Text('Ubah Harga',
//                         style: TextStyle(fontSize: 12.5)),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: OutlinedButton.icon(
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: AppColors.textMuted,
//                       side: const BorderSide(color: AppColors.border),
//                       minimumSize: const Size.fromHeight(36),
//                     ),
//                     onPressed: onEdit,
//                     icon: const Icon(Icons.edit_rounded, size: 15),
//                     label: const Text('Edit', style: TextStyle(fontSize: 12.5)),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Product Sheet (Add / Edit)
// // ─────────────────────────────────────────────────────────────────────────────
// class _ProductSheet extends StatelessWidget {
//   final Map<String, dynamic>? existing;
//   final TextEditingController nameCtrl;
//   final TextEditingController skuCtrl;
//   final TextEditingController descCtrl;
//   final TextEditingController unitCtrl;
//   final TextEditingController minStockCtrl;
//   final TextEditingController purchasePriceCtrl;
//   final TextEditingController sellingPriceCtrl;

//   const _ProductSheet({
//     this.existing,
//     required this.nameCtrl,
//     required this.skuCtrl,
//     required this.descCtrl,
//     required this.unitCtrl,
//     required this.minStockCtrl,
//     required this.purchasePriceCtrl,
//     required this.sellingPriceCtrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final mq = MediaQuery.of(context);
//     return Container(
//       padding: EdgeInsets.only(
//           left: 24, right: 24, top: 16, bottom: 24 + mq.viewInsets.bottom),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Center(
//               child: Container(
//                 width: 36,
//                 height: 4,
//                 margin: const EdgeInsets.only(bottom: 16),
//                 decoration: BoxDecoration(
//                   color: AppColors.border,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//             Text(
//               existing == null ? 'Tambah Produk' : 'Edit Produk',
//               style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
//             ),
//             const SizedBox(height: 14),
//             _field(nameCtrl, 'Nama Produk'),
//             const SizedBox(height: 10),
//             _field(skuCtrl, 'SKU'),
//             const SizedBox(height: 10),
//             _field(descCtrl, 'Deskripsi', maxLines: 2),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Expanded(child: _field(unitCtrl, 'Satuan')),
//                 const SizedBox(width: 10),
//                 Expanded(
//                     child: _field(minStockCtrl, 'Min Stok', isNumber: true)),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Expanded(
//                     child: _field(purchasePriceCtrl, 'Harga Beli',
//                         isNumber: true)),
//                 const SizedBox(width: 10),
//                 Expanded(
//                     child:
//                         _field(sellingPriceCtrl, 'Harga Jual', isNumber: true)),
//               ],
//             ),
//             const SizedBox(height: 18),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.primary,
//                 foregroundColor: Colors.white,
//                 minimumSize: const Size(double.infinity, 46),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//               ),
//               onPressed: () {
//                 if (nameCtrl.text.trim().isEmpty || skuCtrl.text.trim().isEmpty)
//                   return;

//                 final data = <String, dynamic>{
//                   'name': nameCtrl.text.trim(),
//                   'sku': skuCtrl.text.trim(),
//                   if (descCtrl.text.trim().isNotEmpty)
//                     'description': descCtrl.text.trim(),
//                   if (unitCtrl.text.trim().isNotEmpty)
//                     'unit': unitCtrl.text.trim(),
//                   if (minStockCtrl.text.trim().isNotEmpty)
//                     'min_stock': int.tryParse(minStockCtrl.text.trim()),
//                   if (purchasePriceCtrl.text.trim().isNotEmpty)
//                     'purchase_price':
//                         double.tryParse(purchasePriceCtrl.text.trim()),
//                   if (sellingPriceCtrl.text.trim().isNotEmpty)
//                     'selling_price':
//                         double.tryParse(sellingPriceCtrl.text.trim()),
//                 };

//                 Navigator.pop(context);

//                 if (existing == null) {
//                   context
//                       .read<AdminProductBloc>()
//                       .add(AdminProductEvent.create(data));
//                 } else {
//                   context.read<AdminProductBloc>().add(
//                         AdminProductEvent.update(
//                           productId: _toInt(existing!['id']),
//                           data: data,
//                         ),
//                       );
//                 }
//               },
//               child: Text(existing == null ? 'Simpan Produk' : 'Update Produk'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _field(
//     TextEditingController ctrl,
//     String label, {
//     int maxLines = 1,
//     bool isNumber = false,
//   }) {
//     return TextField(
//       controller: ctrl,
//       maxLines: maxLines,
//       keyboardType: isNumber ? TextInputType.number : TextInputType.text,
//       decoration: InputDecoration(labelText: label),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';

/// Safely parse harga dari backend — bisa String "10000.00" atau num 10000
double? _toDouble(dynamic v) {
  if (v == null) return null;
  if (v is num) return v.toDouble();
  if (v is String) return double.tryParse(v);
  return null;
}

/// Safely parse int dari backend — bisa String atau int
int _toInt(dynamic v, [int fallback = 0]) {
  if (v == null) return fallback;
  if (v is int) return v;
  if (v is num) return v.toInt();
  if (v is String) return int.tryParse(v) ?? fallback;
  return fallback;
}

/// Model ringan untuk dropdown kategori
class _CategoryOption {
  final int id;
  final String name;
  const _CategoryOption({required this.id, required this.name});
}

class AdminProductListPage extends StatefulWidget {
  const AdminProductListPage({super.key});

  @override
  State<AdminProductListPage> createState() => _AdminProductListPageState();
}

class _AdminProductListPageState extends State<AdminProductListPage> {
  String _search = '';
  String? _selectedCategory;

  final _rupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();
    context.read<AdminProductBloc>().add(const AdminProductEvent.load());
  }

  static String _categoryName(dynamic raw) {
    if (raw == null) return '';
    if (raw is String) return raw;
    if (raw is Map) return (raw['name'] as String?)?.trim() ?? '';
    return raw.toString();
  }

  List<String> _categoriesFrom(List items) {
    final cats = <String>{};
    for (final item in items) {
      final cat = _categoryName((item as Map<String, dynamic>)['category']);
      if (cat.isNotEmpty) cats.add(cat);
    }
    return cats.toList()..sort();
  }

  List<Map<String, dynamic>> _filtered(List items) {
    final q = _search.toLowerCase();
    return items.whereType<Map<String, dynamic>>().where((p) {
      final matchSearch = q.isEmpty ||
          (p['name'] as String? ?? '').toLowerCase().contains(q) ||
          (p['sku'] as String? ?? '').toLowerCase().contains(q);
      final matchCat = _selectedCategory == null ||
          _categoryName(p['category']) == _selectedCategory;
      return matchSearch && matchCat;
    }).toList();
  }

  /// Ekstrak daftar _CategoryOption dari list produk untuk dropdown
  List<_CategoryOption> _categoryOptionsFrom(List items) {
    final seen = <int>{};
    final options = <_CategoryOption>[];
    for (final item in items.whereType<Map<String, dynamic>>()) {
      final cat = item['category'];
      if (cat is Map) {
        final id = _toInt(cat['id']);
        final name = (cat['name'] as String?)?.trim() ?? '';
        if (id > 0 && name.isNotEmpty && seen.add(id)) {
          options.add(_CategoryOption(id: id, name: name));
        }
      }
    }
    options.sort((a, b) => a.name.compareTo(b.name));
    return options;
  }

  // ── Edit price sheet ─────────────────────────────────────────────────────
  void _showEditPriceSheet(BuildContext context, Map<String, dynamic> product) {
    HapticFeedback.selectionClick();
    final oldPurchase = _toDouble(product['purchase_price']) ?? 0;
    final oldSelling = _toDouble(product['selling_price']) ?? 0;
    final purchaseCtrl = TextEditingController(
      text: oldPurchase > 0 ? oldPurchase.toInt().toString() : '',
    );
    final sellingCtrl = TextEditingController(
      text: oldSelling > 0 ? oldSelling.toInt().toString() : '',
    );
    final reasonCtrl = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<AdminProductBloc>(),
        child: StatefulBuilder(builder: (ctx, setSt) {
          final mq = MediaQuery.of(ctx);
          final newPurchase = double.tryParse(purchaseCtrl.text) ?? 0;
          final newSelling = double.tryParse(sellingCtrl.text) ?? 0;
          final diff = newPurchase - oldPurchase;
          final hasChange = (newPurchase != oldPurchase && newPurchase > 0) ||
              (newSelling != oldSelling && newSelling > 0);
          final pctChange = oldPurchase > 0 ? (diff / oldPurchase) * 100 : 0.0;

          return Padding(
            padding: EdgeInsets.only(bottom: mq.viewInsets.bottom),
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
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
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.primarySoft,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.payments_rounded,
                              color: AppColors.primary),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Ubah Harga Produk',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 2),
                              Text(
                                '${product['name']} · ${product['sku'] ?? ''}',
                                style: const TextStyle(
                                    fontSize: 12, color: AppColors.textMuted),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.bg,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.history_rounded,
                              size: 16, color: AppColors.textMuted),
                          const SizedBox(width: 8),
                          const Text('Harga saat ini',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.textMuted)),
                          const Spacer(),
                          Text(
                            oldPurchase > 0
                                ? _rupiah.format(oldPurchase)
                                : 'Belum diset',
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: purchaseCtrl,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (_) => setSt(() {}),
                      decoration: const InputDecoration(
                        labelText: 'Harga Beli (HPP)',
                        prefixText: 'Rp ',
                        helperText: 'Dasar perhitungan jurnal keuangan',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      children: [
                        _quickAdjust('-10%', () {
                          final v =
                              (newPurchase == 0 ? oldPurchase : newPurchase) *
                                  0.9;
                          purchaseCtrl.text = v.round().toString();
                          setSt(() {});
                        }),
                        _quickAdjust('-5%', () {
                          final v =
                              (newPurchase == 0 ? oldPurchase : newPurchase) *
                                  0.95;
                          purchaseCtrl.text = v.round().toString();
                          setSt(() {});
                        }),
                        _quickAdjust('+5%', () {
                          final v =
                              (newPurchase == 0 ? oldPurchase : newPurchase) *
                                  1.05;
                          purchaseCtrl.text = v.round().toString();
                          setSt(() {});
                        }),
                        _quickAdjust('+10%', () {
                          final v =
                              (newPurchase == 0 ? oldPurchase : newPurchase) *
                                  1.10;
                          purchaseCtrl.text = v.round().toString();
                          setSt(() {});
                        }),
                        _quickAdjust('Reset', () {
                          purchaseCtrl.text = oldPurchase > 0
                              ? oldPurchase.toStringAsFixed(0)
                              : '';
                          setSt(() {});
                        }, danger: true),
                      ],
                    ),
                    const SizedBox(height: 14),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 220),
                      child: hasChange && diff != 0
                          ? Container(
                              key: ValueKey('${diff}_$newPurchase'),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: diff > 0
                                    ? AppColors.warningSoft
                                    : AppColors.successSoft,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: diff > 0
                                      ? AppColors.warning.withValues(alpha: 0.4)
                                      : AppColors.success
                                          .withValues(alpha: 0.4),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    diff > 0
                                        ? Icons.trending_up_rounded
                                        : Icons.trending_down_rounded,
                                    color: diff > 0
                                        ? AppColors.warning
                                        : AppColors.success,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          diff > 0
                                              ? 'Harga naik'
                                              : 'Harga turun',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: diff > 0
                                                ? AppColors.warning
                                                : AppColors.success,
                                          ),
                                        ),
                                        Text(
                                          '${diff > 0 ? '+' : ''}${_rupiah.format(diff)}'
                                          '${oldPurchase > 0 ? '  (${pctChange.toStringAsFixed(1)}%)' : ''}',
                                          style: const TextStyle(
                                              fontSize: 12.5,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: sellingCtrl,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (_) => setSt(() {}),
                      decoration: const InputDecoration(
                        labelText: 'Harga Jual',
                        prefixText: 'Rp ',
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: reasonCtrl,
                      maxLines: 2,
                      decoration: const InputDecoration(
                        labelText: 'Alasan perubahan (opsional)',
                        hintText:
                            'Contoh: kenaikan harga supplier, promo, koreksi...',
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(ctx),
                            child: const Text('Batal'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: hasChange
                                ? () {
                                    final data = <String, dynamic>{
                                      if (purchaseCtrl.text.trim().isNotEmpty)
                                        'purchase_price': double.tryParse(
                                            purchaseCtrl.text.trim()),
                                      if (sellingCtrl.text.trim().isNotEmpty)
                                        'selling_price': double.tryParse(
                                            sellingCtrl.text.trim()),
                                    };
                                    Navigator.pop(ctx);
                                    HapticFeedback.mediumImpact();
                                    context
                                        .read<AdminProductBloc>()
                                        .add(AdminProductEvent.update(
                                          productId: _toInt(product['id']),
                                          data: data,
                                        ));
                                  }
                                : null,
                            icon: const Icon(Icons.save_rounded, size: 18),
                            label: const Text('Simpan Harga'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _quickAdjust(String label, VoidCallback onTap, {bool danger = false}) {
    return ActionChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 11.5,
          fontWeight: FontWeight.w700,
          color: danger ? AppColors.danger : AppColors.primaryDark,
        ),
      ),
      backgroundColor: danger ? AppColors.dangerSoft : AppColors.primarySoft,
      side: BorderSide.none,
      onPressed: () {
        HapticFeedback.selectionClick();
        onTap();
      },
    );
  }

  Widget _categoryChip({
    required String label,
    required int count,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        selected: selected,
        onSelected: (_) {
          HapticFeedback.selectionClick();
          onTap();
        },
        showCheckmark: false,
        labelPadding: const EdgeInsets.symmetric(horizontal: 4),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.w700,
                color: selected ? Colors.white : AppColors.text,
              ),
            ),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: selected
                    ? Colors.white.withValues(alpha: 0.22)
                    : AppColors.bg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: selected ? Colors.white : AppColors.textMuted,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.surface,
        selectedColor: AppColors.primary,
        side: BorderSide(
          color: selected ? AppColors.primary : AppColors.border,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  void _showAddSheet(
      BuildContext context, List<_CategoryOption> categoryOptions) {
    HapticFeedback.lightImpact();
    _showProductSheet(context, null, categoryOptions);
  }

  void _showProductSheet(
    BuildContext context,
    Map<String, dynamic>? existing,
    List<_CategoryOption> categoryOptions,
  ) {
    final nameCtrl =
        TextEditingController(text: existing?['name'] as String? ?? '');
    final skuCtrl =
        TextEditingController(text: existing?['sku'] as String? ?? '');
    final descCtrl =
        TextEditingController(text: existing?['description'] as String? ?? '');
    final unitCtrl =
        TextEditingController(text: existing?['unit'] as String? ?? '');
    final minStockCtrl =
        TextEditingController(text: '${existing?['min_stock'] ?? 0}');
    final purchasePriceCtrl = TextEditingController(
        text: existing != null && _toDouble(existing['purchase_price']) != null
            ? '${_toDouble(existing['purchase_price'])!.toInt()}'
            : '');
    final sellingPriceCtrl = TextEditingController(
        text: existing != null && _toDouble(existing['selling_price']) != null
            ? '${_toDouble(existing['selling_price'])!.toInt()}'
            : '');

    // Tentukan category_id awal dari existing product
    int? initialCategoryId;
    if (existing != null) {
      final cat = existing['category'];
      if (cat is Map) {
        initialCategoryId = _toInt(cat['id']);
        if (initialCategoryId == 0) initialCategoryId = null;
      }
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<AdminProductBloc>(),
        child: _ProductSheet(
          existing: existing,
          nameCtrl: nameCtrl,
          skuCtrl: skuCtrl,
          descCtrl: descCtrl,
          unitCtrl: unitCtrl,
          minStockCtrl: minStockCtrl,
          purchasePriceCtrl: purchasePriceCtrl,
          sellingPriceCtrl: sellingPriceCtrl,
          categoryOptions: categoryOptions,
          initialCategoryId: initialCategoryId,
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, Map<String, dynamic> product) {
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Hapus Produk?'),
        content: Text('Hapus "${product['name']}" dari sistem?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogCtx);
              context
                  .read<AdminProductBloc>()
                  .add(AdminProductEvent.delete(_toInt(product['id'])));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.danger,
                foregroundColor: Colors.white),
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
        title: const Text('Produk'),
        backgroundColor: AppColors.surface,
      ),
      body: BlocConsumer<AdminProductBloc, AdminProductState>(
        listener: (context, state) {
          state.maybeWhen(
            actionSuccess: (msg) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(msg),
                backgroundColor: AppColors.success,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ));
              context
                  .read<AdminProductBloc>()
                  .add(const AdminProductEvent.load());
            },
            error: (msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(msg),
              backgroundColor: AppColors.danger,
              behavior: SnackBarBehavior.floating,
            )),
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (items, totalItems, hasMore) {
              final allProducts =
                  items.whereType<Map<String, dynamic>>().toList();
              final categories = _categoriesFrom(allProducts);
              final filtered = _filtered(allProducts);

              // Ekstrak category options untuk dropdown form
              final categoryOptions = _categoryOptionsFrom(allProducts);

              return Stack(
                children: [
                  Column(
                    children: [
                      // ── Search bar ─────────────────────────────
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Cari produk atau SKU...',
                            prefixIcon: const Icon(Icons.search_rounded),
                            suffixIcon: _search.isEmpty
                                ? null
                                : IconButton(
                                    icon: const Icon(Icons.close_rounded),
                                    onPressed: () =>
                                        setState(() => _search = ''),
                                  ),
                          ),
                          onChanged: (v) => setState(() => _search = v),
                        ),
                      ),
                      // ── Category filter chips ──────────────────
                      SizedBox(
                        height: 44,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.fromLTRB(20, 4, 20, 4),
                          children: [
                            _categoryChip(
                              label: 'Semua',
                              count: allProducts.length,
                              selected: _selectedCategory == null,
                              onTap: () =>
                                  setState(() => _selectedCategory = null),
                            ),
                            ...categories.map((cat) {
                              final count = allProducts
                                  .where((p) =>
                                      _categoryName(p['category']) == cat)
                                  .length;
                              return _categoryChip(
                                label: cat,
                                count: count,
                                selected: _selectedCategory == cat,
                                onTap: () =>
                                    setState(() => _selectedCategory = cat),
                              );
                            }),
                          ],
                        ),
                      ),
                      // ── Active filter indicator ────────────────
                      if (_selectedCategory != null || _search.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
                          child: Row(
                            children: [
                              const Icon(Icons.filter_list_rounded,
                                  size: 14, color: AppColors.textMuted),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  [
                                    if (_selectedCategory != null)
                                      'Kategori: $_selectedCategory',
                                    if (_search.isNotEmpty) 'Cari: "$_search"',
                                  ].join(' · '),
                                  style: const TextStyle(
                                      fontSize: 12, color: AppColors.textMuted),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                '${filtered.length} produk',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary),
                              ),
                              TextButton(
                                onPressed: () => setState(() {
                                  _selectedCategory = null;
                                  _search = '';
                                }),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 0),
                                  minimumSize: const Size(0, 28),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text('Reset',
                                    style: TextStyle(fontSize: 12)),
                              ),
                            ],
                          ),
                        ),
                      // ── Product list ───────────────────────────
                      Expanded(
                        child: filtered.isEmpty
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(32),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.search_off_rounded,
                                          size: 48, color: AppColors.textMuted),
                                      const SizedBox(height: 12),
                                      Text(
                                        _selectedCategory != null
                                            ? 'Tidak ada produk pada kategori "$_selectedCategory"'
                                            : 'Produk tidak ditemukan',
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : RefreshIndicator(
                                onRefresh: () async => context
                                    .read<AdminProductBloc>()
                                    .add(const AdminProductEvent.load()),
                                child: ListView.separated(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 8, 20, 100),
                                  itemCount: filtered.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 10),
                                  itemBuilder: (_, i) {
                                    final product = filtered[i];
                                    return TweenAnimationBuilder<double>(
                                      tween: Tween(begin: 0, end: 1),
                                      duration: Duration(
                                          milliseconds:
                                              200 + (i * 50).clamp(0, 500)),
                                      curve: Curves.easeOut,
                                      builder: (_, v, child) => Opacity(
                                        opacity: v,
                                        child: Transform.translate(
                                            offset: Offset(0, (1 - v) * 12),
                                            child: child),
                                      ),
                                      child: _ProductTile(
                                        product: product,
                                        rupiah: _rupiah,
                                        onEdit: () => _showProductSheet(
                                            context, product, categoryOptions),
                                        onEditPrice: () => _showEditPriceSheet(
                                            context, product),
                                        onDelete: () =>
                                            _confirmDelete(context, product),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ),
                    ],
                  ),
                  // ── FAB ────────────────────────────────────────
                  Positioned(
                    right: 16,
                    bottom: 16,
                    child: FloatingActionButton.extended(
                      onPressed: () => _showAddSheet(context, categoryOptions),
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      icon: const Icon(Icons.add_rounded),
                      label: const Text('Produk Baru'),
                    ),
                  ),
                ],
              );
            },
            actionLoading: () =>
                const Center(child: CircularProgressIndicator()),
            actionSuccess: (_) =>
                const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline,
                      size: 48, color: AppColors.danger),
                  const SizedBox(height: 12),
                  Text(msg),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context
                        .read<AdminProductBloc>()
                        .add(const AdminProductEvent.load()),
                    child: const Text('Coba Lagi'),
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

// ─────────────────────────────────────────────────────────────────────────────
// Product Tile
// ─────────────────────────────────────────────────────────────────────────────
class _ProductTile extends StatelessWidget {
  final Map<String, dynamic> product;
  final NumberFormat rupiah;
  final VoidCallback onEdit;
  final VoidCallback onEditPrice;
  final VoidCallback onDelete;

  const _ProductTile({
    required this.product,
    required this.rupiah,
    required this.onEdit,
    required this.onEditPrice,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final id = _toInt(product['id']);
    final name = product['name'] as String? ?? '';
    final sku = product['sku'] as String? ?? '';
    final unit = product['unit'] as String? ?? '-';
    final catRaw = product['category'];
    final category = (catRaw is String)
        ? (catRaw.isEmpty ? '-' : catRaw)
        : (catRaw is Map)
            ? (((catRaw['name'] as String?)?.trim().isNotEmpty == true)
                ? (catRaw['name'] as String).trim()
                : '-')
            : '-';
    final minStock = _toInt(product['min_stock']);
    final purchasePrice = _toDouble(product['purchase_price']);
    final sellingPrice = _toDouble(product['selling_price']);
    final stockQty = _toInt(product['stock_qty']);
    final isLow = stockQty <= minStock + 5;

    return Dismissible(
      key: ValueKey('product_$id'),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.danger,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.delete_outline_rounded, color: Colors.white),
      ),
      confirmDismiss: (_) async {
        return await showDialog<bool>(
              context: context,
              builder: (dialogCtx) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: const Text('Hapus produk?'),
                content: Text('Hapus "$name" dari sistem?'),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(dialogCtx, false),
                      child: const Text('Batal')),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.danger,
                        foregroundColor: Colors.white),
                    onPressed: () => Navigator.pop(dialogCtx, true),
                    child: const Text('Hapus'),
                  ),
                ],
              ),
            ) ??
            false;
      },
      onDismissed: (_) {
        HapticFeedback.lightImpact();
        context.read<AdminProductBloc>().add(AdminProductEvent.delete(id));
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primarySoft,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.inventory_2_rounded,
                      color: AppColors.primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: const TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 2),
                      Text(
                        '$sku · $category · $unit',
                        style: const TextStyle(
                            color: AppColors.textMuted, fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Stok: $stockQty $unit (min $minStock)',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: isLow ? AppColors.dangerSoft : AppColors.successSoft,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isLow ? 'Menipis' : 'Aman',
                    style: TextStyle(
                      color: isLow ? AppColors.danger : AppColors.success,
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: onEditPrice,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.payments_rounded,
                        size: 16, color: AppColors.textMuted),
                    const SizedBox(width: 6),
                    const Text('HPP',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.textMuted)),
                    const Spacer(),
                    Text(
                      purchasePrice != null && purchasePrice > 0
                          ? rupiah.format(purchasePrice)
                          : 'Belum diset',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: (purchasePrice ?? 0) > 0
                            ? AppColors.text
                            : AppColors.danger,
                        fontSize: 13,
                      ),
                    ),
                    if (sellingPrice != null && sellingPrice > 0) ...[
                      const SizedBox(width: 8),
                      Container(width: 1, height: 14, color: AppColors.border),
                      const SizedBox(width: 8),
                      Text(
                        rupiah.format(sellingPrice),
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      minimumSize: const Size.fromHeight(36),
                    ),
                    onPressed: onEditPrice,
                    icon: const Icon(Icons.payments_rounded, size: 15),
                    label: const Text('Ubah Harga',
                        style: TextStyle(fontSize: 12.5)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textMuted,
                      side: const BorderSide(color: AppColors.border),
                      minimumSize: const Size.fromHeight(36),
                    ),
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit_rounded, size: 15),
                    label: const Text('Edit', style: TextStyle(fontSize: 12.5)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Product Sheet (Add / Edit)  ← FIXED: category_id dropdown
// ─────────────────────────────────────────────────────────────────────────────
class _ProductSheet extends StatefulWidget {
  final Map<String, dynamic>? existing;
  final TextEditingController nameCtrl;
  final TextEditingController skuCtrl;
  final TextEditingController descCtrl;
  final TextEditingController unitCtrl;
  final TextEditingController minStockCtrl;
  final TextEditingController purchasePriceCtrl;
  final TextEditingController sellingPriceCtrl;
  final List<_CategoryOption> categoryOptions;
  final int? initialCategoryId;

  const _ProductSheet({
    this.existing,
    required this.nameCtrl,
    required this.skuCtrl,
    required this.descCtrl,
    required this.unitCtrl,
    required this.minStockCtrl,
    required this.purchasePriceCtrl,
    required this.sellingPriceCtrl,
    required this.categoryOptions,
    this.initialCategoryId,
  });

  @override
  State<_ProductSheet> createState() => _ProductSheetState();
}

class _ProductSheetState extends State<_ProductSheet> {
  int? _selectedCategoryId;
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    _selectedCategoryId = widget.initialCategoryId;
  }

  bool get _categoryValid => _selectedCategoryId != null;

  void _submit() {
    setState(() => _submitted = true);

    // Validasi wajib
    if (widget.nameCtrl.text.trim().isEmpty ||
        widget.skuCtrl.text.trim().isEmpty ||
        widget.unitCtrl.text.trim().isEmpty ||
        !_categoryValid) {
      return;
    }

    final data = <String, dynamic>{
      'category_id': _selectedCategoryId!, // ← FIX: selalu ikut serta
      'name': widget.nameCtrl.text.trim(),
      'sku': widget.skuCtrl.text.trim(),
      'unit': widget.unitCtrl.text.trim(),
      if (widget.descCtrl.text.trim().isNotEmpty)
        'description': widget.descCtrl.text.trim(),
      if (widget.minStockCtrl.text.trim().isNotEmpty)
        'min_stock': int.tryParse(widget.minStockCtrl.text.trim()),
      if (widget.purchasePriceCtrl.text.trim().isNotEmpty)
        'purchase_price': double.tryParse(widget.purchasePriceCtrl.text.trim()),
      if (widget.sellingPriceCtrl.text.trim().isNotEmpty)
        'selling_price': double.tryParse(widget.sellingPriceCtrl.text.trim()),
    };

    Navigator.pop(context);

    if (widget.existing == null) {
      context.read<AdminProductBloc>().add(AdminProductEvent.create(data));
    } else {
      context.read<AdminProductBloc>().add(
            AdminProductEvent.update(
              productId: _toInt(widget.existing!['id']),
              data: data,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final isAdd = widget.existing == null;

    return Container(
      padding: EdgeInsets.only(
          left: 24, right: 24, top: 16, bottom: 24 + mq.viewInsets.bottom),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.primarySoft,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    isAdd ? Icons.add_box_rounded : Icons.edit_rounded,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  isAdd ? 'Tambah Produk' : 'Edit Produk',
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // ── Kategori dropdown ── FIX UTAMA ───────────────────
            _SectionLabel(label: 'Kategori', required: true),
            const SizedBox(height: 6),
            widget.categoryOptions.isEmpty
                ? Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.warningSoft,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColors.warning.withValues(alpha: 0.4)),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.warning_amber_rounded,
                            size: 16, color: AppColors.warning),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Belum ada data kategori. Muat ulang halaman.',
                            style: TextStyle(
                                fontSize: 12, color: AppColors.warning),
                          ),
                        ),
                      ],
                    ),
                  )
                : DropdownButtonFormField<int>(
                    value: _selectedCategoryId,
                    decoration: InputDecoration(
                      hintText: 'Pilih kategori...',
                      errorText: _submitted && !_categoryValid
                          ? 'Kategori wajib dipilih'
                          : null,
                    ),
                    items: widget.categoryOptions
                        .map((opt) => DropdownMenuItem(
                              value: opt.id,
                              child: Text(opt.name),
                            ))
                        .toList(),
                    onChanged: (v) => setState(() => _selectedCategoryId = v),
                  ),
            const SizedBox(height: 12),

            // ── Nama & SKU ────────────────────────────────────────
            _SectionLabel(label: 'Nama Produk', required: true),
            const SizedBox(height: 6),
            _field(widget.nameCtrl, 'Contoh: Beras Premium 5kg',
                submitted: _submitted),
            const SizedBox(height: 12),

            _SectionLabel(label: 'SKU', required: true),
            const SizedBox(height: 6),
            _field(widget.skuCtrl, 'Contoh: BRS-001', submitted: _submitted),
            const SizedBox(height: 12),

            // ── Satuan & Min Stok ─────────────────────────────────
            _SectionLabel(label: 'Satuan', required: true),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                    child: _field(widget.unitCtrl, 'kg / pcs / liter',
                        submitted: _submitted)),
                const SizedBox(width: 10),
                Expanded(
                    child: _field(widget.minStockCtrl, 'Min Stok',
                        isNumber: true)),
              ],
            ),
            const SizedBox(height: 12),

            // ── Harga ─────────────────────────────────────────────
            const _SectionLabel(label: 'Harga'),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                    child: _field(widget.purchasePriceCtrl, 'Harga Beli',
                        isNumber: true, prefix: 'Rp ')),
                const SizedBox(width: 10),
                Expanded(
                    child: _field(widget.sellingPriceCtrl, 'Harga Jual',
                        isNumber: true, prefix: 'Rp ')),
              ],
            ),
            const SizedBox(height: 12),

            // ── Deskripsi ─────────────────────────────────────────
            const _SectionLabel(label: 'Deskripsi'),
            const SizedBox(height: 6),
            _field(widget.descCtrl, 'Keterangan tambahan (opsional)',
                maxLines: 2),
            const SizedBox(height: 20),

            // ── Submit button ─────────────────────────────────────
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 46),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: _submit,
              child: Text(isAdd ? 'Simpan Produk' : 'Update Produk'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController ctrl,
    String hint, {
    int maxLines = 1,
    bool isNumber = false,
    String? prefix,
    bool submitted = false,
  }) {
    return TextField(
      controller: ctrl,
      maxLines: maxLines,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters:
          isNumber ? [FilteringTextInputFormatter.digitsOnly] : null,
      decoration: InputDecoration(
        hintText: hint,
        prefixText: prefix,
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Helper: section label
// ─────────────────────────────────────────────────────────────────────────────
class _SectionLabel extends StatelessWidget {
  final String label;
  final bool required;

  const _SectionLabel({required this.label, this.required = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            color: AppColors.textMuted,
          ),
        ),
        if (required) ...[
          const SizedBox(width: 3),
          const Text('*',
              style: TextStyle(color: AppColors.danger, fontSize: 13)),
        ],
      ],
    );
  }
}
