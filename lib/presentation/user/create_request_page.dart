// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'package:warehouse/core/constant/variables.dart';
// import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
// import 'package:warehouse/data/model/request/request_request_model.dart';
// import 'package:warehouse/presentation/bloc/user/request/request_bloc.dart';
// import 'app_theme.dart';

// // ─────────────────────────────────────────────────────────────────────────────
// // Model lokal untuk opsi produk dari API
// // ─────────────────────────────────────────────────────────────────────────────
// class ProductOption {
//   final int id;
//   final String name;
//   final String unit;
//   final String? sku;

//   const ProductOption({
//     required this.id,
//     required this.name,
//     required this.unit,
//     this.sku,
//   });

//   factory ProductOption.fromMap(Map<String, dynamic> map) => ProductOption(
//         id: map['id'] ?? 0,
//         name: map['name'] ?? '',
//         unit: map['unit'] ?? 'unit',
//         sku: map['sku'],
//       );
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Item entry per baris barang
// // ─────────────────────────────────────────────────────────────────────────────
// const int _kMaxItems = 5;

// class _ItemEntry {
//   ProductOption? selectedProduct;
//   final TextEditingController searchCtrl = TextEditingController();
//   bool showDropdown = false;
//   final TextEditingController qtyCtrl = TextEditingController();
//   final TextEditingController itemNoteCtrl = TextEditingController();
//   String? photoLabel;

//   // Untuk source = luar
//   final TextEditingController extNameCtrl = TextEditingController();
//   final TextEditingController extSpecCtrl = TextEditingController();
//   final TextEditingController extLinkCtrl = TextEditingController();
//   final TextEditingController extPriceCtrl = TextEditingController();

//   void dispose() {
//     searchCtrl.dispose();
//     qtyCtrl.dispose();
//     itemNoteCtrl.dispose();
//     extNameCtrl.dispose();
//     extSpecCtrl.dispose();
//     extLinkCtrl.dispose();
//     extPriceCtrl.dispose();
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // CreateRequestPage
// // ─────────────────────────────────────────────────────────────────────────────
// class CreateRequestPage extends StatefulWidget {
//   const CreateRequestPage({super.key});

//   @override
//   State<CreateRequestPage> createState() => _CreateRequestPageState();
// }

// class _CreateRequestPageState extends State<CreateRequestPage> {
//   final _formKey = GlobalKey<FormState>();

//   String _source = 'gudang';
//   String? _purpose;

//   static const _purposeOptions = [
//     {
//       'value': 'maintenance',
//       'label': 'Maintenance',
//       'icon': Icons.build_rounded
//     },
//     {
//       'value': 'distribution',
//       'label': 'Distribution',
//       'icon': Icons.local_shipping_rounded
//     },
//     {
//       'value': 'return',
//       'label': 'Return',
//       'icon': Icons.assignment_return_rounded
//     },
//     {'value': 'other', 'label': 'Lainnya', 'icon': Icons.more_horiz_rounded},
//   ];

//   final List<_ItemEntry> _warehouseItems = [_ItemEntry()];
//   final List<_ItemEntry> _externalItems = [_ItemEntry()];
//   List<_ItemEntry> get _items =>
//       _source == 'gudang' ? _warehouseItems : _externalItems;

//   // Produk dari API
//   List<ProductOption> _allProducts = [];
//   bool _productsLoading = false;
//   String? _productsError;

//   // State submit lokal — JANGAN bergantung pada BLoC loading state
//   // karena BLoC di-share dengan RequestListPage (BlocProvider.value),
//   // state loading dari operasi sebelumnya bisa bocor ke sini.
//   bool _isSubmitting = false;

//   // State submit lokal — JANGAN pakai BLoC loading untuk ini
//   // karena BLoC di-share dengan RequestListPage, state loading dari list
//   // bisa bocor ke halaman ini dan membuat tombol disabled selamanya.
//   // bool _isSubmitting = false;

//   final _noteCtrl = TextEditingController(); // Laravel: 'note'

//   static const _units = [
//     'unit',
//     'pcs',
//     'kg',
//     'liter',
//     'modul',
//     'batang',
//     'roll'
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _loadProducts();
//   }

//   @override
//   void dispose() {
//     for (final it in _warehouseItems) it.dispose();
//     for (final it in _externalItems) it.dispose();
//     _noteCtrl.dispose();
//     super.dispose();
//   }

//   // ── Load produk dari GET /api/products ───────────────────────────────────
//   Future<void> _loadProducts() async {
//     if (!mounted) return;
//     setState(() {
//       _productsLoading = true;
//       _productsError = null;
//     });

//     try {
//       final token = await AuthLocalDatasource().getToken();
//       final url = Uri.parse('${Variables.baseUrl}/api/products')
//           .replace(queryParameters: {'per_page': '200', 'is_active': 'true'});

//       final response = await http.get(url, headers: {
//         'Accept': 'application/json',
//         if (token != null) 'Authorization': 'Bearer $token',
//       });

//       log('📦 [PRODUCTS] ${response.statusCode}');
//       if (!mounted) return;

//       if (response.statusCode == 200) {
//         final decoded = jsonDecode(response.body);
//         final rawData = decoded['data'];
//         List items = [];

//         if (rawData is Map && rawData['data'] is List) {
//           items = rawData['data']; // paginate()
//         } else if (rawData is List) {
//           items = rawData;
//         }

//         setState(() {
//           _allProducts = items
//               .map((e) => ProductOption.fromMap(Map<String, dynamic>.from(e)))
//               .toList();
//           _productsLoading = false;
//         });
//         log('📦 [PRODUCTS] Loaded ${_allProducts.length} products');
//       } else {
//         setState(() {
//           _productsError = 'Gagal memuat produk (${response.statusCode})';
//           _productsLoading = false;
//         });
//       }
//     } catch (e) {
//       if (!mounted) return;
//       setState(() {
//         _productsError = 'Koneksi gagal: $e';
//         _productsLoading = false;
//       });
//     }
//   }

//   // ── Helpers ───────────────────────────────────────────────────────────────
//   List<ProductOption> _filterProducts(String query) {
//     if (query.isEmpty) return _allProducts;
//     return _allProducts
//         .where((p) =>
//             p.name.toLowerCase().contains(query.toLowerCase()) ||
//             (p.sku?.toLowerCase().contains(query.toLowerCase()) ?? false))
//         .toList();
//   }

//   void _selectProduct(_ItemEntry entry, ProductOption product) {
//     setState(() {
//       entry.selectedProduct = product;
//       entry.searchCtrl.text = product.name;
//       entry.showDropdown = false;
//     });
//   }

//   void _addItem() {
//     if (_items.length >= _kMaxItems) return;
//     HapticFeedback.selectionClick();
//     setState(() => _items.add(_ItemEntry()));
//   }

//   void _removeItem(int index) {
//     if (_items.length <= 1) return;
//     HapticFeedback.lightImpact();
//     setState(() => _items.removeAt(index).dispose());
//   }

//   // ── Date picker ──────────────────────────────────────────────────────────
//   DateTime _neededDate = DateTime.now().add(const Duration(days: 3));

//   Future<void> _pickDate() async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: _neededDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//       builder: (ctx, child) => Theme(
//         data: Theme.of(ctx).copyWith(
//           colorScheme: const ColorScheme.light(
//             primary: AppTheme.primary,
//             onPrimary: Colors.white,
//             onSurface: AppTheme.textPrimary,
//           ),
//         ),
//         child: child!,
//       ),
//     );
//     if (picked != null) setState(() => _neededDate = picked);
//   }

//   // ── Submit — field names sesuai Laravel controller ───────────────────────
//   void _submit() {
//     if (_isSubmitting) return;
//     if (!_formKey.currentState!.validate()) return;

//     if (_purpose == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Pilih tujuan permintaan terlebih dahulu')),
//       );
//       return;
//     }

//     // Validasi produk dipilih (hanya untuk source gudang)
//     if (_source == 'gudang') {
//       for (int i = 0; i < _warehouseItems.length; i++) {
//         if (_warehouseItems[i].selectedProduct == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//                 content: Text('Barang ${i + 1} belum dipilih dari daftar')),
//           );
//           return;
//         }
//       }
//     }

//     HapticFeedback.lightImpact();
//     setState(() => _isSubmitting = true);

//     // Build items — sesuai Laravel: product_id, quantity, note
//     final requestItems = _source == 'gudang'
//         ? _warehouseItems
//             .map((e) => RequestItemInput(
//                   productId: e.selectedProduct!.id,
//                   quantity: int.tryParse(e.qtyCtrl.text.trim()) ?? 1,
//                   note: e.itemNoteCtrl.text.trim().isEmpty
//                       ? null
//                       : e.itemNoteCtrl.text.trim(),
//                 ))
//             .toList()
//         : <RequestItemInput>[];

//     // Build model — sesuai Laravel: purpose, note (bukan notes), items
//     final model = StoreStockRequestModel(
//       purpose: _purpose!,
//       note: _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim(),
//       items: requestItems,
//     );

//     log('[SUBMIT] ${model.toJson()}');
//     context.read<RequestBloc>().add(RequestEvent.storeRequest(model));
//   }

//   // ── Build ─────────────────────────────────────────────────────────────────
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<RequestBloc, RequestState>(
//       // listenWhen: hanya react saat _isSubmitting = true supaya tidak
//       // terganggu state dari RequestListPage yang share BLoC yang sama
//       listenWhen: (_, current) => _isSubmitting,
//       listener: (context, state) {
//         state.maybeWhen(
//           actionSuccess: (message, data) {
//             setState(() => _isSubmitting = false);
//             showDialog(
//               context: context,
//               builder: (_) => Dialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         width: 64,
//                         height: 64,
//                         decoration: BoxDecoration(
//                           color:
//                               AppTheme.statusApproved.withValues(alpha: 0.12),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(Icons.check_circle_rounded,
//                             color: AppTheme.statusApproved, size: 36),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text('Request Berhasil Dikirim',
//                           style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w800,
//                               color: AppTheme.textPrimary)),
//                       const SizedBox(height: 6),
//                       Text(
//                         message,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey.shade600,
//                             height: 1.5),
//                       ),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context); // tutup dialog
//                             Navigator.pop(context,
//                                 true); // kembali ke list, trigger reload
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppTheme.primary,
//                             foregroundColor: Colors.white,
//                             elevation: 0,
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12)),
//                           ),
//                           child: const Text('Selesai',
//                               style: TextStyle(fontWeight: FontWeight.w700)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//           error: (message) {
//             setState(() => _isSubmitting = false);
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(message), backgroundColor: Colors.red),
//             );
//           },
//           orElse: () {},
//         );
//       },
//       child: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: AppTheme.lightOverlay,
//         child: Scaffold(
//           backgroundColor: AppTheme.background,
//           body: GestureDetector(
//             onTap: () {
//               setState(() {
//                 for (final e in _warehouseItems) e.showDropdown = false;
//                 for (final e in _externalItems) e.showDropdown = false;
//               });
//               FocusScope.of(context).unfocus();
//             },
//             child: CustomScrollView(
//               physics: const BouncingScrollPhysics(),
//               slivers: [
//                 _buildHeader(),
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // ── Tujuan Permintaan ─────────────────────────
//                           _sectionLabel('Tujuan Permintaan *'),
//                           const SizedBox(height: 10),
//                           _buildPurposeSelector(),
//                           const SizedBox(height: 22),

//                           // ── Sumber Barang ─────────────────────────────
//                           _sectionLabel('Sumber Barang'),
//                           const SizedBox(height: 10),
//                           _buildSourceSelector(),
//                           const SizedBox(height: 22),

//                           // ── Header daftar barang ──────────────────────
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _sectionLabel(_source == 'gudang'
//                                     ? 'Daftar Barang dari Gudang'
//                                     : 'Daftar Barang dari Luar'),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color:
//                                       AppTheme.primary.withValues(alpha: 0.1),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Text(
//                                   '${_items.length}/$_kMaxItems jenis',
//                                   style: const TextStyle(
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w800,
//                                       color: AppTheme.primary),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),

//                           // ── Banner loading/error produk ───────────────
//                           if (_source == 'gudang') ...[
//                             if (_productsLoading)
//                               Container(
//                                 padding: const EdgeInsets.all(12),
//                                 margin: const EdgeInsets.only(bottom: 10),
//                                 decoration: BoxDecoration(
//                                   color:
//                                       AppTheme.primary.withValues(alpha: 0.06),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: const Row(
//                                   children: [
//                                     SizedBox(
//                                         width: 16,
//                                         height: 16,
//                                         child: CircularProgressIndicator(
//                                             strokeWidth: 2,
//                                             color: AppTheme.primary)),
//                                     SizedBox(width: 10),
//                                     Text('Memuat daftar produk...',
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             color: AppTheme.primary)),
//                                   ],
//                                 ),
//                               ),
//                             if (_productsError != null)
//                               Container(
//                                 padding: const EdgeInsets.all(12),
//                                 margin: const EdgeInsets.only(bottom: 10),
//                                 decoration: BoxDecoration(
//                                   color: AppTheme.statusRejected
//                                       .withValues(alpha: 0.06),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     const Icon(Icons.error_outline_rounded,
//                                         size: 16,
//                                         color: AppTheme.statusRejected),
//                                     const SizedBox(width: 8),
//                                     Expanded(
//                                         child: Text(_productsError!,
//                                             style: const TextStyle(
//                                                 fontSize: 11,
//                                                 color:
//                                                     AppTheme.statusRejected))),
//                                     TextButton(
//                                       onPressed: _loadProducts,
//                                       child: const Text('Coba lagi',
//                                           style: TextStyle(fontSize: 11)),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                           ],

//                           // ── Item cards ────────────────────────────────
//                           AnimatedSize(
//                             duration: const Duration(milliseconds: 220),
//                             curve: Curves.easeOut,
//                             child: Column(
//                               children: List.generate(
//                                 _items.length,
//                                 (i) => Padding(
//                                   padding: EdgeInsets.only(
//                                       bottom: i == _items.length - 1 ? 0 : 12),
//                                   child: _buildItemCard(i),
//                                 ),
//                               ),
//                             ),
//                           ),

//                           const SizedBox(height: 12),

//                           // ── Tombol tambah barang ──────────────────────
//                           SizedBox(
//                             width: double.infinity,
//                             child: OutlinedButton.icon(
//                               onPressed:
//                                   _items.length < _kMaxItems ? _addItem : null,
//                               icon: Icon(
//                                   _items.length < _kMaxItems
//                                       ? Icons.add_rounded
//                                       : Icons.block_rounded,
//                                   size: 18),
//                               label: Text(
//                                 _items.length < _kMaxItems
//                                     ? 'Tambah Barang (${_items.length}/$_kMaxItems)'
//                                     : 'Maksimal $_kMaxItems jenis barang',
//                                 style: const TextStyle(
//                                     fontSize: 13, fontWeight: FontWeight.w700),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 foregroundColor: _items.length < _kMaxItems
//                                     ? AppTheme.primary
//                                     : Colors.grey.shade500,
//                                 side: BorderSide(
//                                   color: _items.length < _kMaxItems
//                                       ? AppTheme.primary.withValues(alpha: 0.5)
//                                       : Colors.grey.shade300,
//                                   width: 1.5,
//                                 ),
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 14),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(14)),
//                               ),
//                             ),
//                           ),

//                           const SizedBox(height: 22),

//                           // ── Catatan / Keperluan ───────────────────────
//                           _sectionLabel('Catatan / Keperluan'),
//                           const SizedBox(height: 10),
//                           _buildCard(
//                             child: _buildTextField(
//                               controller: _noteCtrl,
//                               label: 'Catatan',
//                               hint: 'Tuliskan tujuan penggunaan barang...',
//                               icon: Icons.notes_rounded,
//                               maxLines: 4,
//                               validator: (v) => (v == null || v.trim().isEmpty)
//                                   ? 'Tolong jelaskan keperluannya'
//                                   : null,
//                             ),
//                           ),

//                           const SizedBox(height: 22),
//                           _buildInfoBanner(),
//                           const SizedBox(height: 20),

//                           // ── Tombol kirim ──────────────────────────────
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: _isSubmitting ? null : _submit,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: AppTheme.primary,
//                                 foregroundColor: Colors.white,
//                                 elevation: 0,
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 16),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(14)),
//                               ),
//                               child: _isSubmitting
//                                   ? const SizedBox(
//                                       width: 20,
//                                       height: 20,
//                                       child: CircularProgressIndicator(
//                                           strokeWidth: 2, color: Colors.white),
//                                     )
//                                   : Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         const Icon(Icons.send_rounded,
//                                             size: 18),
//                                         const SizedBox(width: 8),
//                                         Text(
//                                           'Kirim Request (${_items.length} jenis)',
//                                           style: const TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w800),
//                                         ),
//                                       ],
//                                     ),
//                             ),
//                           ),

//                           const SizedBox(height: 10),
//                           SizedBox(
//                             width: double.infinity,
//                             child: TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               style: TextButton.styleFrom(
//                                 foregroundColor: Colors.grey.shade600,
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 14),
//                               ),
//                               child: const Text('Batal',
//                                   style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w600)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ── Purpose selector ───────────────────────────────────────────────────────
//   Widget _buildPurposeSelector() {
//     return Wrap(
//       spacing: 8,
//       runSpacing: 8,
//       children: _purposeOptions.map((opt) {
//         final selected = _purpose == opt['value'];
//         return GestureDetector(
//           onTap: () {
//             HapticFeedback.selectionClick();
//             setState(() => _purpose = opt['value'] as String);
//           },
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 180),
//             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//             decoration: BoxDecoration(
//               color: selected ? AppTheme.primary : Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(
//                 color: selected ? AppTheme.primary : Colors.grey.shade200,
//                 width: 1.5,
//               ),
//               boxShadow: selected
//                   ? [
//                       BoxShadow(
//                           color: AppTheme.primary.withValues(alpha: 0.25),
//                           blurRadius: 10,
//                           offset: const Offset(0, 4))
//                     ]
//                   : null,
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(opt['icon'] as IconData,
//                     size: 16,
//                     color: selected ? Colors.white : AppTheme.primary),
//                 const SizedBox(width: 6),
//                 Text(opt['label'] as String,
//                     style: TextStyle(
//                       fontSize: 12.5,
//                       fontWeight: FontWeight.w700,
//                       color: selected ? Colors.white : AppTheme.textPrimary,
//                     )),
//               ],
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   // ── Source selector ────────────────────────────────────────────────────────
//   Widget _buildSourceSelector() {
//     const options = [
//       {
//         'value': 'gudang',
//         'title': 'Dari Gudang',
//         'subtitle': 'Ambil dari stok yang tersedia',
//         'icon': Icons.warehouse_rounded,
//       },
//       {
//         'value': 'luar',
//         'title': 'Dari Luar',
//         'subtitle': 'Beli dari supplier / toko luar',
//         'icon': Icons.storefront_rounded,
//       },
//     ];
//     return Row(
//       children: options.map((opt) {
//         final selected = _source == opt['value'];
//         return Expanded(
//           child: Padding(
//             padding: EdgeInsets.only(
//               right: opt['value'] == 'gudang' ? 6 : 0,
//               left: opt['value'] == 'luar' ? 6 : 0,
//             ),
//             child: GestureDetector(
//               onTap: () {
//                 if (selected) return;
//                 HapticFeedback.selectionClick();
//                 setState(() => _source = opt['value'] as String);
//               },
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 220),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//                 decoration: BoxDecoration(
//                   color: selected ? AppTheme.primary : Colors.white,
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(
//                     color: selected ? AppTheme.primary : Colors.grey.shade200,
//                     width: 1.5,
//                   ),
//                   boxShadow: selected
//                       ? [
//                           BoxShadow(
//                               color: AppTheme.primary.withValues(alpha: 0.25),
//                               blurRadius: 14,
//                               offset: const Offset(0, 6))
//                         ]
//                       : null,
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 38,
//                       height: 38,
//                       decoration: BoxDecoration(
//                         color: selected
//                             ? Colors.white.withValues(alpha: 0.22)
//                             : AppTheme.primary.withValues(alpha: 0.1),
//                         borderRadius: BorderRadius.circular(11),
//                       ),
//                       child: Icon(opt['icon'] as IconData,
//                           size: 20,
//                           color: selected ? Colors.white : AppTheme.primary),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(opt['title'] as String,
//                               style: TextStyle(
//                                   fontSize: 12.5,
//                                   fontWeight: FontWeight.w800,
//                                   color: selected
//                                       ? Colors.white
//                                       : AppTheme.textPrimary)),
//                           const SizedBox(height: 2),
//                           Text(opt['subtitle'] as String,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w500,
//                                   color: selected
//                                       ? Colors.white.withValues(alpha: 0.85)
//                                       : Colors.grey.shade600)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   // ── Item card ──────────────────────────────────────────────────────────────
//   Widget _buildItemCard(int index) {
//     final entry = _items[index];
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade100, width: 1.5),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withValues(alpha: 0.03),
//               blurRadius: 10,
//               offset: const Offset(0, 3))
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header
//           Container(
//             padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
//             decoration: BoxDecoration(
//               color: AppTheme.primary.withValues(alpha: 0.06),
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(16)),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 28,
//                   height: 28,
//                   decoration: BoxDecoration(
//                       color: AppTheme.primary,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: Center(
//                     child: Text('${index + 1}',
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w800)),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Text('Barang ${index + 1}',
//                       style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w800,
//                           color: AppTheme.textPrimary)),
//                 ),
//                 if (_items.length > 1)
//                   IconButton(
//                     onPressed: () => _removeItem(index),
//                     icon: const Icon(Icons.delete_outline_rounded,
//                         size: 20, color: AppTheme.statusRejected),
//                   ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
//             child: _source == 'gudang'
//                 ? _buildWarehouseFields(entry, index)
//                 : _buildExternalFields(entry),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Bottom sheet picker produk ─────────────────────────────────────────────
//   Future<void> _pickProduct(_ItemEntry e) async {
//     if (_productsLoading) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Daftar produk masih dimuat, tunggu sebentar...')),
//       );
//       return;
//     }
//     if (_allProducts.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Tidak ada produk tersedia')),
//       );
//       return;
//     }

//     final picked = await showModalBottomSheet<ProductOption>(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (ctx) => _ProductPickerSheet(products: _allProducts),
//     );

//     if (picked != null) {
//       setState(() {
//         e.selectedProduct = picked;
//       });
//     }
//   }

//   // ── Warehouse fields — tap to pick, no free-type ──────────────────────────
//   Widget _buildWarehouseFields(_ItemEntry e, int index) {
//     final isSelected = e.selectedProduct != null;
//     return Column(
//       key: ValueKey('gudang-$index'),
//       children: [
//         // Picker field
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Nama Barang *',
//                 style: TextStyle(
//                     fontSize: 11,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.grey.shade700)),
//             const SizedBox(height: 6),

//             // FormField untuk validasi
//             FormField<ProductOption>(
//               initialValue: e.selectedProduct,
//               validator: (_) =>
//                   e.selectedProduct == null ? 'Pilih barang dari daftar' : null,
//               builder: (field) => Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GestureDetector(
//                     onTap: () => _pickProduct(e),
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 150),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 13),
//                       decoration: BoxDecoration(
//                         color: AppTheme.background,
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           color: field.hasError
//                               ? AppTheme.statusRejected
//                               : isSelected
//                                   ? AppTheme.primary.withValues(alpha: 0.5)
//                                   : Colors.transparent,
//                           width: 1.5,
//                         ),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(
//                             isSelected
//                                 ? Icons.inventory_2_rounded
//                                 : Icons.search_rounded,
//                             size: 18,
//                             color: isSelected
//                                 ? AppTheme.primary
//                                 : Colors.grey.shade400,
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: Text(
//                               isSelected
//                                   ? e.selectedProduct!.name
//                                   : _productsLoading
//                                       ? 'Memuat produk...'
//                                       : 'Pilih barang dari daftar',
//                               style: TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: isSelected
//                                     ? FontWeight.w600
//                                     : FontWeight.w400,
//                                 color: isSelected
//                                     ? AppTheme.textPrimary
//                                     : Colors.grey.shade400,
//                               ),
//                             ),
//                           ),
//                           if (_productsLoading)
//                             const SizedBox(
//                               width: 16,
//                               height: 16,
//                               child: CircularProgressIndicator(
//                                   strokeWidth: 2, color: AppTheme.primary),
//                             )
//                           else if (isSelected)
//                             GestureDetector(
//                               onTap: () =>
//                                   setState(() => e.selectedProduct = null),
//                               child: Icon(Icons.close_rounded,
//                                   size: 18, color: Colors.grey.shade400),
//                             )
//                           else
//                             Icon(Icons.keyboard_arrow_down_rounded,
//                                 color: Colors.grey.shade400, size: 20),
//                         ],
//                       ),
//                     ),
//                   ),
//                   if (field.hasError) ...[
//                     const SizedBox(height: 4),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 12),
//                       child: Text(
//                         field.errorText!,
//                         style: const TextStyle(
//                             fontSize: 11, color: AppTheme.statusRejected),
//                       ),
//                     ),
//                   ],
//                 ],
//               ),
//             ),

//             // Badge detail produk terpilih
//             if (isSelected) ...[
//               const SizedBox(height: 6),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: AppTheme.statusApproved.withValues(alpha: 0.07),
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                       color: AppTheme.statusApproved.withValues(alpha: 0.25)),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.check_circle_rounded,
//                         size: 14, color: AppTheme.statusApproved),
//                     const SizedBox(width: 6),
//                     Expanded(
//                       child: Text(
//                         '${e.selectedProduct!.name} · ${e.selectedProduct!.unit}'
//                         '${e.selectedProduct!.sku != null ? ' · SKU: ${e.selectedProduct!.sku}' : ''}',
//                         style: const TextStyle(
//                             fontSize: 11,
//                             fontWeight: FontWeight.w600,
//                             color: AppTheme.statusApproved),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ],
//         ),

//         const SizedBox(height: 14),

//         // Qty + catatan item
//         _buildTextField(
//           controller: e.qtyCtrl,
//           label: 'Jumlah',
//           hint: '0',
//           icon: Icons.numbers_rounded,
//           keyboardType: TextInputType.number,
//           validator: (v) {
//             if (v == null || v.trim().isEmpty) return 'Wajib diisi';
//             final n = int.tryParse(v.trim());
//             if (n == null || n <= 0) return 'Jumlah tidak valid';
//             return null;
//           },
//         ),

//         const SizedBox(height: 14),

//         _buildTextField(
//           controller: e.itemNoteCtrl,
//           label: 'Catatan Item (opsional)',
//           hint: 'Contoh: warna merah, ukuran M...',
//           icon: Icons.edit_note_rounded,
//         ),
//       ],
//     );
//   }

//   // ── External fields ────────────────────────────────────────────────────────
//   Widget _buildExternalFields(_ItemEntry e) {
//     return Column(
//       key: ValueKey('luar-${e.hashCode}'),
//       children: [
//         _buildTextField(
//           controller: e.extNameCtrl,
//           label: 'Nama Barang',
//           hint: 'Contoh: Pompa Dosing Kimia 12 L/h',
//           icon: Icons.inventory_2_rounded,
//           validator: (v) =>
//               (v == null || v.trim().isEmpty) ? 'Wajib diisi' : null,
//         ),
//         const SizedBox(height: 14),
//         _buildTextField(
//           controller: e.extSpecCtrl,
//           label: 'Spesifikasi Barang',
//           hint: 'Kapasitas, daya, material, merk, dll.',
//           icon: Icons.list_alt_rounded,
//           maxLines: 3,
//           validator: (v) => (v == null || v.trim().isEmpty)
//               ? 'Spesifikasi wajib diisi'
//               : null,
//         ),
//         const SizedBox(height: 14),
//         _buildTextField(
//           controller: e.qtyCtrl,
//           label: 'Jumlah',
//           hint: '0',
//           icon: Icons.numbers_rounded,
//           keyboardType: TextInputType.number,
//           validator: (v) {
//             if (v == null || v.trim().isEmpty) return 'Wajib diisi';
//             final n = int.tryParse(v.trim());
//             if (n == null || n <= 0) return 'Tidak valid';
//             return null;
//           },
//         ),
//         const SizedBox(height: 14),
//         _buildTextField(
//           controller: e.extLinkCtrl,
//           label: 'Link Pembelian',
//           hint: 'https://...',
//           icon: Icons.link_rounded,
//           keyboardType: TextInputType.url,
//           validator: (v) {
//             if (v == null || v.trim().isEmpty) return 'Masukkan link pembelian';
//             if (!v.trim().startsWith('http') && !v.trim().contains('.'))
//               return 'Link tidak valid';
//             return null;
//           },
//         ),
//         const SizedBox(height: 14),
//         _buildTextField(
//           controller: e.extPriceCtrl,
//           label: 'Estimasi Harga (Rp)',
//           hint: 'Contoh: 1250000',
//           icon: Icons.payments_rounded,
//           keyboardType: TextInputType.number,
//           validator: (v) {
//             if (v == null || v.trim().isEmpty) return 'Harga wajib diisi';
//             final n = int.tryParse(v.replaceAll(RegExp(r'[^0-9]'), ''));
//             if (n == null || n <= 0) return 'Harga tidak valid';
//             return null;
//           },
//         ),
//       ],
//     );
//   }

//   // ── Header ─────────────────────────────────────────────────────────────────
//   Widget _buildHeader() {
//     return SliverAppBar(
//       expandedHeight: 120,
//       pinned: true,
//       elevation: 0,
//       backgroundColor: AppTheme.primaryDark,
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
//         onPressed: () => Navigator.pop(context),
//       ),
//       flexibleSpace: FlexibleSpaceBar(
//         collapseMode: CollapseMode.pin,
//         background: Container(
//           decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
//           child: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(60, 14, 20, 0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text('Buat Request Barang',
//                       style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w800,
//                           color: Colors.white)),
//                   const SizedBox(height: 4),
//                   Text('Bisa request hingga $_kMaxItems jenis barang sekaligus',
//                       style: TextStyle(
//                           fontSize: 11,
//                           color: Colors.white.withValues(alpha: 0.85),
//                           fontWeight: FontWeight.w500)),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ── Helpers UI ─────────────────────────────────────────────────────────────
//   Widget _sectionLabel(String text) => Padding(
//         padding: const EdgeInsets.only(left: 4),
//         child: Text(text,
//             style: const TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w800,
//                 color: AppTheme.textPrimary,
//                 letterSpacing: 0.3)),
//       );

//   Widget _buildCard({required Widget child}) => Container(
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: Colors.grey.shade100, width: 1.5),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.03),
//                 blurRadius: 10,
//                 offset: const Offset(0, 3))
//           ],
//         ),
//         child: child,
//       );

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required String hint,
//     required IconData icon,
//     int maxLines = 1,
//     TextInputType? keyboardType,
//     String? Function(String?)? validator,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: TextStyle(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.grey.shade700)),
//         const SizedBox(height: 6),
//         TextFormField(
//           controller: controller,
//           maxLines: maxLines,
//           keyboardType: keyboardType,
//           validator: validator,
//           style: const TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.w600,
//               color: AppTheme.textPrimary),
//           decoration: InputDecoration(
//             hintText: hint,
//             hintStyle: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey.shade400,
//                 fontWeight: FontWeight.w500),
//             prefixIcon: Padding(
//               padding: const EdgeInsets.only(left: 12, right: 8),
//               child: Icon(icon, size: 18, color: AppTheme.primary),
//             ),
//             prefixIconConstraints:
//                 const BoxConstraints(minWidth: 36, minHeight: 36),
//             filled: true,
//             fillColor: AppTheme.background,
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide.none),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide:
//                     const BorderSide(color: AppTheme.primary, width: 1.5)),
//             errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(
//                     color: AppTheme.statusRejected, width: 1.5)),
//             focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(
//                     color: AppTheme.statusRejected, width: 1.5)),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildInfoBanner() {
//     final isExternal = _source == 'luar';
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: AppTheme.primary.withValues(alpha: 0.06),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: AppTheme.primary.withValues(alpha: 0.15)),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Icon(Icons.info_rounded, size: 18, color: AppTheme.primary),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               isExternal
//                   ? 'Request pembelian dari luar membutuhkan persetujuan tambahan. Pastikan link & estimasi harga benar.'
//                   : 'Request akan diproses oleh approver. Pastikan data setiap barang sudah benar sebelum dikirim.',
//               style: TextStyle(
//                   fontSize: 11,
//                   color: Colors.grey.shade700,
//                   height: 1.5,
//                   fontWeight: FontWeight.w500),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ProductPickerSheet extends StatefulWidget {
//   final List<ProductOption> products;

//   const _ProductPickerSheet({
//     required this.products,
//   });

//   @override
//   State<_ProductPickerSheet> createState() => _ProductPickerSheetState();
// }

// class _ProductPickerSheetState extends State<_ProductPickerSheet> {
//   final TextEditingController searchCtrl = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final products = widget.products.where((p) {
//       return p.name.toLowerCase().contains(searchCtrl.text.toLowerCase());
//     }).toList();

//     return Container(
//       height: MediaQuery.of(context).size.height * 0.8,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: TextField(
//               controller: searchCtrl,
//               decoration: const InputDecoration(
//                 hintText: 'Cari produk...',
//                 prefixIcon: Icon(Icons.search),
//               ),
//               onChanged: (_) => setState(() {}),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (_, index) {
//                 final product = products[index];

//                 return ListTile(
//                   title: Text(product.name),
//                   subtitle: Text(product.unit),
//                   onTap: () {
//                     Navigator.pop(context, product);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart' as http;
// import 'package:warehouse/core/constant/variables.dart';
// import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
// import 'package:warehouse/data/model/request/request_request_model.dart';
// import 'package:warehouse/presentation/bloc/user/request/request_bloc.dart';
// import 'app_theme.dart';

// // ─────────────────────────────────────────────────────────────────────────────
// // Model lokal untuk opsi produk dari API
// // ─────────────────────────────────────────────────────────────────────────────
// class ProductOption {
//   final int id;
//   final String name;
//   final String unit;
//   final String? sku;

//   const ProductOption({
//     required this.id,
//     required this.name,
//     required this.unit,
//     this.sku,
//   });

//   factory ProductOption.fromMap(Map<String, dynamic> map) => ProductOption(
//         id: map['id'] ?? 0,
//         name: map['name'] ?? '',
//         unit: map['unit'] ?? 'unit',
//         sku: map['sku'],
//       );
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Item entry per baris barang — gabungan field file 1 & 2
// // ─────────────────────────────────────────────────────────────────────────────
// const int _kMaxItems = 5;

// class _ItemEntry {
//   // ── Dari Gudang — product picker (file 2) ──
//   ProductOption? selectedProduct;

//   // ── Dari Gudang — field tambahan (file 1) ──
//   final TextEditingController qtyCtrl = TextEditingController();
//   final TextEditingController itemNoteCtrl = TextEditingController();
//   String? photoLabel; // foto contoh barang

//   // ── Dari Luar (file 1 & 2) ──
//   final TextEditingController extNameCtrl = TextEditingController();
//   final TextEditingController extSpecCtrl = TextEditingController();
//   final TextEditingController extLinkCtrl = TextEditingController();
//   final TextEditingController extPriceCtrl = TextEditingController();

//   void dispose() {
//     qtyCtrl.dispose();
//     itemNoteCtrl.dispose();
//     extNameCtrl.dispose();
//     extSpecCtrl.dispose();
//     extLinkCtrl.dispose();
//     extPriceCtrl.dispose();
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // CreateRequestPage
// // ─────────────────────────────────────────────────────────────────────────────
// class CreateRequestPage extends StatefulWidget {
//   /// Opsional: prefill dari katalog stok gudang
//   final Map<String, dynamic>? prefillItem;

//   const CreateRequestPage({super.key, this.prefillItem});

//   @override
//   State<CreateRequestPage> createState() => _CreateRequestPageState();
// }

// class _CreateRequestPageState extends State<CreateRequestPage> {
//   final _formKey = GlobalKey<FormState>();

//   // ── Sumber & tujuan ─────────────────────────────────────────────────────
//   String _source = 'gudang';
//   String? _purpose;

//   static const _purposeOptions = [
//     {
//       'value': 'maintenance',
//       'label': 'Maintenance',
//       'icon': Icons.build_rounded
//     },
//     {
//       'value': 'distribution',
//       'label': 'Distribution',
//       'icon': Icons.local_shipping_rounded
//     },
//     {
//       'value': 'return',
//       'label': 'Return',
//       'icon': Icons.assignment_return_rounded
//     },
//     {'value': 'other', 'label': 'Lainnya', 'icon': Icons.more_horiz_rounded},
//   ];

//   // ── Daftar barang TERPISAH per sumber ───────────────────────────────────
//   final List<_ItemEntry> _warehouseItems = [];
//   final List<_ItemEntry> _externalItems = [];
//   List<_ItemEntry> get _items =>
//       _source == 'gudang' ? _warehouseItems : _externalItems;

//   // ── Produk dari API ─────────────────────────────────────────────────────
//   List<ProductOption> _allProducts = [];
//   bool _productsLoading = false;
//   String? _productsError;

//   // ── Field tingkat request ───────────────────────────────────────────────
//   final _noteCtrl = TextEditingController();
//   String _urgency = 'normal';
//   DateTime _neededDate = DateTime.now().add(const Duration(days: 3));

//   // ── Submit state lokal (jangan pakai BLoC loading — bisa bocor) ─────────
//   bool _isSubmitting = false;

//   static const _units = [
//     'unit',
//     'pcs',
//     'kg',
//     'liter',
//     'modul',
//     'batang',
//     'roll'
//   ];

//   @override
//   void initState() {
//     super.initState();

//     final warehouseFirst = _ItemEntry();
//     final externalFirst = _ItemEntry();

//     // Prefill dari katalog gudang → item pertama warehouse
//     final p = widget.prefillItem;
//     if (p != null && p['id'] != null) {
//       warehouseFirst.selectedProduct = ProductOption(
//         id: p['id'] as int,
//         name: (p['name'] ?? '') as String,
//         unit: (p['unit'] ?? 'unit') as String,
//         sku: p['sku'] as String?,
//       );
//     }

//     _warehouseItems.add(warehouseFirst);
//     _externalItems.add(externalFirst);

//     _loadProducts();
//   }

//   @override
//   void dispose() {
//     for (final it in _warehouseItems) it.dispose();
//     for (final it in _externalItems) it.dispose();
//     _noteCtrl.dispose();
//     super.dispose();
//   }

//   // ── Load produk dari GET /api/products ──────────────────────────────────
//   Future<void> _loadProducts() async {
//     if (!mounted) return;
//     setState(() {
//       _productsLoading = true;
//       _productsError = null;
//     });

//     try {
//       final token = await AuthLocalDatasource().getToken();
//       final url = Uri.parse('${Variables.baseUrl}/api/products')
//           .replace(queryParameters: {'per_page': '200', 'is_active': 'true'});

//       final response = await http.get(url, headers: {
//         'Accept': 'application/json',
//         if (token != null) 'Authorization': 'Bearer $token',
//       });

//       log('📦 [PRODUCTS] ${response.statusCode}');
//       if (!mounted) return;

//       if (response.statusCode == 200) {
//         final decoded = jsonDecode(response.body);
//         final rawData = decoded['data'];
//         List items = [];

//         if (rawData is Map && rawData['data'] is List) {
//           items = rawData['data'];
//         } else if (rawData is List) {
//           items = rawData;
//         }

//         setState(() {
//           _allProducts = items
//               .map((e) => ProductOption.fromMap(Map<String, dynamic>.from(e)))
//               .toList();
//           _productsLoading = false;
//         });
//         log('📦 [PRODUCTS] Loaded ${_allProducts.length} products');
//       } else {
//         setState(() {
//           _productsError = 'Gagal memuat produk (${response.statusCode})';
//           _productsLoading = false;
//         });
//       }
//     } catch (e) {
//       if (!mounted) return;
//       setState(() {
//         _productsError = 'Koneksi gagal: $e';
//         _productsLoading = false;
//       });
//     }
//   }

//   // ── Manipulasi item list ────────────────────────────────────────────────
//   void _addItem() {
//     if (_items.length >= _kMaxItems) return;
//     HapticFeedback.selectionClick();
//     setState(() => _items.add(_ItemEntry()));
//   }

//   void _removeItem(int index) {
//     if (_items.length <= 1) return;
//     HapticFeedback.lightImpact();
//     setState(() => _items.removeAt(index).dispose());
//   }

//   // ── Date picker ─────────────────────────────────────────────────────────
//   Future<void> _pickDate() async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: _neededDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//       builder: (ctx, child) => Theme(
//         data: Theme.of(ctx).copyWith(
//           colorScheme: const ColorScheme.light(
//             primary: AppTheme.primary,
//             onPrimary: Colors.white,
//             onSurface: AppTheme.textPrimary,
//           ),
//         ),
//         child: child!,
//       ),
//     );
//     if (picked != null) setState(() => _neededDate = picked);
//   }

//   // ── Product picker bottom sheet ─────────────────────────────────────────
//   Future<void> _pickProduct(_ItemEntry e) async {
//     if (_productsLoading) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Daftar produk masih dimuat, tunggu sebentar...')),
//       );
//       return;
//     }
//     if (_allProducts.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Tidak ada produk tersedia')),
//       );
//       return;
//     }

//     final picked = await showModalBottomSheet<ProductOption>(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (ctx) => _ProductPickerSheet(products: _allProducts),
//     );

//     if (picked != null) {
//       setState(() => e.selectedProduct = picked);
//     }
//   }

//   // ── Photo picker bottom sheet (placeholder) ─────────────────────────────
//   Future<void> _pickPhoto(_ItemEntry entry) async {
//     HapticFeedback.selectionClick();
//     final hasPhoto = entry.photoLabel != null;

//     final result = await showModalBottomSheet<String>(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (ctx) => Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//         ),
//         padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Container(
//               width: 42,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//             const SizedBox(height: 18),
//             const Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Unggah Foto Contoh',
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w800,
//                   color: AppTheme.textPrimary,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 14),
//             _photoSourceTile(
//               icon: Icons.photo_camera_rounded,
//               title: 'Ambil dari Kamera',
//               subtitle: 'Foto langsung dari kamera perangkat',
//               onTap: () => Navigator.pop(ctx, 'Foto Kamera'),
//             ),
//             const SizedBox(height: 10),
//             _photoSourceTile(
//               icon: Icons.photo_library_rounded,
//               title: 'Pilih dari Galeri',
//               subtitle: 'Pilih foto yang sudah ada di galeri',
//               onTap: () => Navigator.pop(ctx, 'Foto Galeri'),
//             ),
//             if (hasPhoto) ...[
//               const SizedBox(height: 10),
//               _photoSourceTile(
//                 icon: Icons.delete_outline_rounded,
//                 title: 'Hapus Foto',
//                 subtitle: 'Batalkan unggahan foto contoh',
//                 color: AppTheme.statusRejected,
//                 onTap: () => Navigator.pop(ctx, '__remove__'),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );

//     if (result == null) return;
//     setState(() {
//       entry.photoLabel = result == '__remove__' ? null : result;
//     });
//   }

//   Widget _photoSourceTile({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required VoidCallback onTap,
//     Color? color,
//   }) {
//     final c = color ?? AppTheme.primary;
//     return InkWell(
//       borderRadius: BorderRadius.circular(14),
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: c.withValues(alpha: 0.08),
//           borderRadius: BorderRadius.circular(14),
//         ),
//         child: Row(
//           children: [
//             Container(
//               width: 42,
//               height: 42,
//               decoration: BoxDecoration(
//                 color: c.withValues(alpha: 0.15),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(icon, color: c, size: 22),
//             ),
//             const SizedBox(width: 14),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 13.5,
//                       fontWeight: FontWeight.w800,
//                       color: color ?? AppTheme.textPrimary,
//                     ),
//                   ),
//                   Text(
//                     subtitle,
//                     style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
//                   ),
//                 ],
//               ),
//             ),
//             Icon(Icons.chevron_right_rounded,
//                 color: Colors.grey.shade400, size: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   // ── Submit ──────────────────────────────────────────────────────────────
//   void _submit() {
//     if (_isSubmitting) return;
//     if (!_formKey.currentState!.validate()) return;

//     if (_purpose == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Pilih tujuan permintaan terlebih dahulu')),
//       );
//       return;
//     }

//     if (_source == 'gudang') {
//       for (int i = 0; i < _warehouseItems.length; i++) {
//         if (_warehouseItems[i].selectedProduct == null) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//                 content: Text('Barang ${i + 1} belum dipilih dari daftar')),
//           );
//           return;
//         }
//       }
//     }

//     HapticFeedback.lightImpact();
//     setState(() => _isSubmitting = true);

//     final requestItems = _source == 'gudang'
//         ? _warehouseItems
//             .map((e) => RequestItemInput(
//                   productId: e.selectedProduct!.id,
//                   quantity: int.tryParse(e.qtyCtrl.text.trim()) ?? 1,
//                   note: e.itemNoteCtrl.text.trim().isEmpty
//                       ? null
//                       : e.itemNoteCtrl.text.trim(),
//                 ))
//             .toList()
//         : <RequestItemInput>[];

//     final model = StoreStockRequestModel(
//       purpose: _purpose!,
//       note: _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim(),
//       items: requestItems,
//     );

//     log('[SUBMIT] ${model.toJson()}');
//     context.read<RequestBloc>().add(RequestEvent.storeRequest(model));
//   }

//   // ── Build ───────────────────────────────────────────────────────────────
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<RequestBloc, RequestState>(
//       listenWhen: (_, __) => _isSubmitting,
//       listener: (context, state) {
//         state.maybeWhen(
//           actionSuccess: (message, data) {
//             setState(() => _isSubmitting = false);
//             showDialog(
//               context: context,
//               builder: (_) => Dialog(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         width: 64,
//                         height: 64,
//                         decoration: BoxDecoration(
//                           color:
//                               AppTheme.statusApproved.withValues(alpha: 0.12),
//                           shape: BoxShape.circle,
//                         ),
//                         child: const Icon(Icons.check_circle_rounded,
//                             color: AppTheme.statusApproved, size: 36),
//                       ),
//                       const SizedBox(height: 16),
//                       const Text(
//                         'Request Berhasil Dikirim',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w800,
//                           color: AppTheme.textPrimary,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       Text(
//                         message,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.grey.shade600,
//                             height: 1.5),
//                       ),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pop(context); // tutup dialog
//                             Navigator.pop(context, true); // kembali ke list
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppTheme.primary,
//                             foregroundColor: Colors.white,
//                             elevation: 0,
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12)),
//                           ),
//                           child: const Text('Selesai',
//                               style: TextStyle(fontWeight: FontWeight.w700)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//           error: (message) {
//             setState(() => _isSubmitting = false);
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text(message), backgroundColor: Colors.red),
//             );
//           },
//           orElse: () {},
//         );
//       },
//       child: AnnotatedRegion<SystemUiOverlayStyle>(
//         value: AppTheme.lightOverlay,
//         child: Scaffold(
//           backgroundColor: AppTheme.background,
//           body: GestureDetector(
//             onTap: () => FocusScope.of(context).unfocus(),
//             child: CustomScrollView(
//               physics: const BouncingScrollPhysics(),
//               slivers: [
//                 _buildHeader(),
//                 SliverToBoxAdapter(
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // ── Tujuan Permintaan ──────────────────────────
//                           _sectionLabel('Tujuan Permintaan *'),
//                           const SizedBox(height: 10),
//                           _buildPurposeSelector(),
//                           const SizedBox(height: 22),

//                           // ── Sumber Barang ──────────────────────────────
//                           _sectionLabel('Sumber Barang'),
//                           const SizedBox(height: 10),
//                           _buildSourceSelector(),
//                           const SizedBox(height: 22),

//                           // ── Header daftar barang ───────────────────────
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: _sectionLabel(_source == 'gudang'
//                                     ? 'Daftar Barang dari Gudang'
//                                     : 'Daftar Barang dari Luar'),
//                               ),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 10, vertical: 4),
//                                 decoration: BoxDecoration(
//                                   color:
//                                       AppTheme.primary.withValues(alpha: 0.1),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Text(
//                                   '${_items.length}/$_kMaxItems jenis',
//                                   style: const TextStyle(
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w800,
//                                       color: AppTheme.primary),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 10),

//                           // ── Banner loading/error produk ────────────────
//                           if (_source == 'gudang') ...[
//                             if (_productsLoading)
//                               _buildStatusBanner(
//                                 color: AppTheme.primary,
//                                 icon: null,
//                                 isLoading: true,
//                                 text: 'Memuat daftar produk...',
//                               ),
//                             if (_productsError != null)
//                               _buildStatusBanner(
//                                 color: AppTheme.statusRejected,
//                                 icon: Icons.error_outline_rounded,
//                                 text: _productsError!,
//                                 trailing: TextButton(
//                                   onPressed: _loadProducts,
//                                   child: const Text('Coba lagi',
//                                       style: TextStyle(fontSize: 11)),
//                                 ),
//                               ),
//                           ],

//                           // ── Item cards ─────────────────────────────────
//                           AnimatedSize(
//                             duration: const Duration(milliseconds: 220),
//                             curve: Curves.easeOut,
//                             child: Column(
//                               children: List.generate(
//                                 _items.length,
//                                 (i) => Padding(
//                                   padding: EdgeInsets.only(
//                                       bottom: i == _items.length - 1 ? 0 : 12),
//                                   child: _buildItemCard(i),
//                                 ),
//                               ),
//                             ),
//                           ),

//                           const SizedBox(height: 12),

//                           // ── Tombol tambah barang ───────────────────────
//                           SizedBox(
//                             width: double.infinity,
//                             child: OutlinedButton.icon(
//                               onPressed:
//                                   _items.length < _kMaxItems ? _addItem : null,
//                               icon: Icon(
//                                   _items.length < _kMaxItems
//                                       ? Icons.add_rounded
//                                       : Icons.block_rounded,
//                                   size: 18),
//                               label: Text(
//                                 _items.length < _kMaxItems
//                                     ? 'Tambah Barang (${_items.length}/$_kMaxItems)'
//                                     : 'Maksimal $_kMaxItems jenis barang',
//                                 style: const TextStyle(
//                                     fontSize: 13, fontWeight: FontWeight.w700),
//                               ),
//                               style: OutlinedButton.styleFrom(
//                                 foregroundColor: _items.length < _kMaxItems
//                                     ? AppTheme.primary
//                                     : Colors.grey.shade500,
//                                 side: BorderSide(
//                                   color: _items.length < _kMaxItems
//                                       ? AppTheme.primary.withValues(alpha: 0.5)
//                                       : Colors.grey.shade300,
//                                   width: 1.5,
//                                 ),
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 14),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(14)),
//                               ),
//                             ),
//                           ),

//                           const SizedBox(height: 22),

//                           // ── Detail Permintaan ──────────────────────────
//                           _sectionLabel('Detail Permintaan'),
//                           const SizedBox(height: 10),
//                           _buildCard(
//                             child: Column(
//                               children: [
//                                 _buildUrgencySelector(),
//                                 const SizedBox(height: 14),
//                                 _buildDateField(),
//                                 const SizedBox(height: 14),
//                                 _buildTextField(
//                                   controller: _noteCtrl,
//                                   label: 'Catatan / Keperluan',
//                                   hint: 'Tuliskan tujuan penggunaan barang...',
//                                   icon: Icons.notes_rounded,
//                                   maxLines: 4,
//                                   validator: (v) =>
//                                       (v == null || v.trim().isEmpty)
//                                           ? 'Tolong jelaskan keperluannya'
//                                           : null,
//                                 ),
//                               ],
//                             ),
//                           ),

//                           const SizedBox(height: 22),
//                           _buildInfoBanner(),
//                           const SizedBox(height: 20),

//                           // ── Tombol kirim ───────────────────────────────
//                           SizedBox(
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: _isSubmitting ? null : _submit,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: AppTheme.primary,
//                                 foregroundColor: Colors.white,
//                                 elevation: 0,
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 16),
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(14)),
//                               ),
//                               child: _isSubmitting
//                                   ? const SizedBox(
//                                       width: 20,
//                                       height: 20,
//                                       child: CircularProgressIndicator(
//                                           strokeWidth: 2, color: Colors.white),
//                                     )
//                                   : Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         const Icon(Icons.send_rounded,
//                                             size: 18),
//                                         const SizedBox(width: 8),
//                                         Text(
//                                           'Kirim Request (${_items.length} jenis)',
//                                           style: const TextStyle(
//                                               fontSize: 14,
//                                               fontWeight: FontWeight.w800),
//                                         ),
//                                       ],
//                                     ),
//                             ),
//                           ),

//                           const SizedBox(height: 10),
//                           SizedBox(
//                             width: double.infinity,
//                             child: TextButton(
//                               onPressed: () => Navigator.pop(context),
//                               style: TextButton.styleFrom(
//                                 foregroundColor: Colors.grey.shade600,
//                                 padding:
//                                     const EdgeInsets.symmetric(vertical: 14),
//                               ),
//                               child: const Text('Batal',
//                                   style: TextStyle(
//                                       fontSize: 13,
//                                       fontWeight: FontWeight.w600)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // ── Purpose selector ────────────────────────────────────────────────────
//   Widget _buildPurposeSelector() {
//     return Wrap(
//       spacing: 8,
//       runSpacing: 8,
//       children: _purposeOptions.map((opt) {
//         final selected = _purpose == opt['value'];
//         return GestureDetector(
//           onTap: () {
//             HapticFeedback.selectionClick();
//             setState(() => _purpose = opt['value'] as String);
//           },
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 180),
//             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
//             decoration: BoxDecoration(
//               color: selected ? AppTheme.primary : Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(
//                 color: selected ? AppTheme.primary : Colors.grey.shade200,
//                 width: 1.5,
//               ),
//               boxShadow: selected
//                   ? [
//                       BoxShadow(
//                           color: AppTheme.primary.withValues(alpha: 0.25),
//                           blurRadius: 10,
//                           offset: const Offset(0, 4))
//                     ]
//                   : null,
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(opt['icon'] as IconData,
//                     size: 16,
//                     color: selected ? Colors.white : AppTheme.primary),
//                 const SizedBox(width: 6),
//                 Text(opt['label'] as String,
//                     style: TextStyle(
//                       fontSize: 12.5,
//                       fontWeight: FontWeight.w700,
//                       color: selected ? Colors.white : AppTheme.textPrimary,
//                     )),
//               ],
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   // ── Source selector ─────────────────────────────────────────────────────
//   Widget _buildSourceSelector() {
//     const options = [
//       {
//         'value': 'gudang',
//         'title': 'Dari Gudang',
//         'subtitle': 'Ambil dari stok yang tersedia',
//         'icon': Icons.warehouse_rounded,
//       },
//       {
//         'value': 'luar',
//         'title': 'Dari Luar',
//         'subtitle': 'Beli dari supplier / toko luar',
//         'icon': Icons.storefront_rounded,
//       },
//     ];
//     return Row(
//       children: options.map((opt) {
//         final selected = _source == opt['value'];
//         return Expanded(
//           child: Padding(
//             padding: EdgeInsets.only(
//               right: opt['value'] == 'gudang' ? 6 : 0,
//               left: opt['value'] == 'luar' ? 6 : 0,
//             ),
//             child: GestureDetector(
//               onTap: () {
//                 if (selected) return;
//                 HapticFeedback.selectionClick();
//                 setState(() => _source = opt['value'] as String);
//               },
//               child: AnimatedContainer(
//                 duration: const Duration(milliseconds: 220),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//                 decoration: BoxDecoration(
//                   color: selected ? AppTheme.primary : Colors.white,
//                   borderRadius: BorderRadius.circular(14),
//                   border: Border.all(
//                     color: selected ? AppTheme.primary : Colors.grey.shade200,
//                     width: 1.5,
//                   ),
//                   boxShadow: selected
//                       ? [
//                           BoxShadow(
//                               color: AppTheme.primary.withValues(alpha: 0.25),
//                               blurRadius: 14,
//                               offset: const Offset(0, 6))
//                         ]
//                       : null,
//                 ),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 38,
//                       height: 38,
//                       decoration: BoxDecoration(
//                         color: selected
//                             ? Colors.white.withValues(alpha: 0.22)
//                             : AppTheme.primary.withValues(alpha: 0.1),
//                         borderRadius: BorderRadius.circular(11),
//                       ),
//                       child: Icon(opt['icon'] as IconData,
//                           size: 20,
//                           color: selected ? Colors.white : AppTheme.primary),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(opt['title'] as String,
//                               style: TextStyle(
//                                   fontSize: 12.5,
//                                   fontWeight: FontWeight.w800,
//                                   color: selected
//                                       ? Colors.white
//                                       : AppTheme.textPrimary)),
//                           const SizedBox(height: 2),
//                           Text(opt['subtitle'] as String,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.w500,
//                                   color: selected
//                                       ? Colors.white.withValues(alpha: 0.85)
//                                       : Colors.grey.shade600)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   // ── Item card ───────────────────────────────────────────────────────────
//   Widget _buildItemCard(int index) {
//     final entry = _items[index];
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade100, width: 1.5),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withValues(alpha: 0.03),
//               blurRadius: 10,
//               offset: const Offset(0, 3))
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header kartu barang
//           Container(
//             padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
//             decoration: BoxDecoration(
//               color: AppTheme.primary.withValues(alpha: 0.06),
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(16)),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 28,
//                   height: 28,
//                   decoration: BoxDecoration(
//                       color: AppTheme.primary,
//                       borderRadius: BorderRadius.circular(8)),
//                   child: Center(
//                     child: Text('${index + 1}',
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 12,
//                             fontWeight: FontWeight.w800)),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Text('Barang ${index + 1}',
//                       style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w800,
//                           color: AppTheme.textPrimary)),
//                 ),
//                 if (_items.length > 1)
//                   IconButton(
//                     tooltip: 'Hapus barang',
//                     onPressed: () => _removeItem(index),
//                     icon: const Icon(Icons.delete_outline_rounded,
//                         size: 20, color: AppTheme.statusRejected),
//                   ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
//             child: AnimatedSwitcher(
//               duration: const Duration(milliseconds: 220),
//               switchInCurve: Curves.easeOut,
//               transitionBuilder: (child, anim) =>
//                   FadeTransition(opacity: anim, child: child),
//               child: _source == 'gudang'
//                   ? _buildWarehouseFields(entry, index)
//                   : _buildExternalFields(entry, index),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // ── Warehouse fields — product picker + qty + catatan item + foto ───────
//   Widget _buildWarehouseFields(_ItemEntry e, int index) {
//     final isSelected = e.selectedProduct != null;
//     return Column(
//       key: ValueKey('gudang-$index'),
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // ── Picker nama barang
//         Text('Nama Barang *',
//             style: TextStyle(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.grey.shade700)),
//         const SizedBox(height: 6),
//         FormField<ProductOption>(
//           initialValue: e.selectedProduct,
//           validator: (_) =>
//               e.selectedProduct == null ? 'Pilih barang dari daftar' : null,
//           builder: (field) => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               GestureDetector(
//                 onTap: () => _pickProduct(e),
//                 child: AnimatedContainer(
//                   duration: const Duration(milliseconds: 150),
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
//                   decoration: BoxDecoration(
//                     color: AppTheme.background,
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                       color: field.hasError
//                           ? AppTheme.statusRejected
//                           : isSelected
//                               ? AppTheme.primary.withValues(alpha: 0.5)
//                               : Colors.transparent,
//                       width: 1.5,
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(
//                         isSelected
//                             ? Icons.inventory_2_rounded
//                             : Icons.search_rounded,
//                         size: 18,
//                         color: isSelected
//                             ? AppTheme.primary
//                             : Colors.grey.shade400,
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         child: Text(
//                           isSelected
//                               ? e.selectedProduct!.name
//                               : _productsLoading
//                                   ? 'Memuat produk...'
//                                   : 'Pilih barang dari daftar',
//                           style: TextStyle(
//                             fontSize: 13,
//                             fontWeight:
//                                 isSelected ? FontWeight.w600 : FontWeight.w400,
//                             color: isSelected
//                                 ? AppTheme.textPrimary
//                                 : Colors.grey.shade400,
//                           ),
//                         ),
//                       ),
//                       if (_productsLoading)
//                         const SizedBox(
//                           width: 16,
//                           height: 16,
//                           child: CircularProgressIndicator(
//                               strokeWidth: 2, color: AppTheme.primary),
//                         )
//                       else if (isSelected)
//                         GestureDetector(
//                           onTap: () => setState(() => e.selectedProduct = null),
//                           child: Icon(Icons.close_rounded,
//                               size: 18, color: Colors.grey.shade400),
//                         )
//                       else
//                         Icon(Icons.keyboard_arrow_down_rounded,
//                             color: Colors.grey.shade400, size: 20),
//                     ],
//                   ),
//                 ),
//               ),
//               if (field.hasError) ...[
//                 const SizedBox(height: 4),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 12),
//                   child: Text(field.errorText!,
//                       style: const TextStyle(
//                           fontSize: 11, color: AppTheme.statusRejected)),
//                 ),
//               ],
//             ],
//           ),
//         ),

//         // Badge detail produk terpilih
//         if (isSelected) ...[
//           const SizedBox(height: 6),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//             decoration: BoxDecoration(
//               color: AppTheme.statusApproved.withValues(alpha: 0.07),
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(
//                   color: AppTheme.statusApproved.withValues(alpha: 0.25)),
//             ),
//             child: Row(
//               children: [
//                 const Icon(Icons.check_circle_rounded,
//                     size: 14, color: AppTheme.statusApproved),
//                 const SizedBox(width: 6),
//                 Expanded(
//                   child: Text(
//                     '${e.selectedProduct!.name} · ${e.selectedProduct!.unit}'
//                     '${e.selectedProduct!.sku != null ? ' · SKU: ${e.selectedProduct!.sku}' : ''}',
//                     style: const TextStyle(
//                         fontSize: 11,
//                         fontWeight: FontWeight.w600,
//                         color: AppTheme.statusApproved),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],

//         const SizedBox(height: 14),

//         // ── Jumlah
//         _buildTextField(
//           controller: e.qtyCtrl,
//           label: 'Jumlah',
//           hint: '0',
//           icon: Icons.numbers_rounded,
//           keyboardType: TextInputType.number,
//           validator: (v) {
//             if (v == null || v.trim().isEmpty) return 'Wajib diisi';
//             final n = int.tryParse(v.trim());
//             if (n == null || n <= 0) return 'Jumlah tidak valid';
//             return null;
//           },
//         ),

//         const SizedBox(height: 14),

//         // ── Catatan item
//         _buildTextField(
//           controller: e.itemNoteCtrl,
//           label: 'Catatan Item (opsional)',
//           hint: 'Contoh: warna merah, ukuran M...',
//           icon: Icons.edit_note_rounded,
//         ),

//         const SizedBox(height: 14),

//         // ── Foto contoh barang (dari file 1)
//         _buildPhotoUploader(
//           entry: e,
//           label: 'Foto Contoh Barang (opsional)',
//           helper:
//               'Lampirkan foto agar petugas gudang lebih mudah mengenali barang.',
//         ),
//       ],
//     );
//   }

//   // ── External fields (dari file 1 — lengkap) ─────────────────────────────
//   Widget _buildExternalFields(_ItemEntry e, int index) {
//     return Column(
//       key: ValueKey('luar-$index'),
//       children: [
//         _buildTextField(
//           controller: e.extNameCtrl,
//           label: 'Nama Barang',
//           hint: 'Contoh: Pompa Dosing Kimia 12 L/h',
//           icon: Icons.inventory_2_rounded,
//           validator: (v) =>
//               (v == null || v.trim().isEmpty) ? 'Wajib diisi' : null,
//         ),
//         const SizedBox(height: 14),
//         _buildTextField(
//           controller: e.extSpecCtrl,
//           label: 'Spesifikasi Barang',
//           hint: 'Kapasitas, daya, material, merk, dll.',
//           icon: Icons.list_alt_rounded,
//           maxLines: 3,
//           validator: (v) => (v == null || v.trim().isEmpty)
//               ? 'Spesifikasi wajib diisi'
//               : null,
//         ),
//         const SizedBox(height: 14),

//         // ── Foto contoh (wajib untuk luar)
//         _buildPhotoUploader(
//           entry: e,
//           label: 'Foto Contoh Barang',
//           helper:
//               'Wajib lampirkan foto agar approver bisa memverifikasi barang.',
//         ),

//         const SizedBox(height: 14),
//         _buildTextField(
//           controller: e.extLinkCtrl,
//           label: 'Link Pembelian',
//           hint: 'https://contoh-toko.com/produk/...',
//           icon: Icons.link_rounded,
//           keyboardType: TextInputType.url,
//           validator: (v) {
//             if (v == null || v.trim().isEmpty)
//               return 'Tolong masukkan link pembelian';
//             final url = v.trim();
//             if (!url.startsWith('http') && !url.contains('.'))
//               return 'Link tidak valid';
//             return null;
//           },
//         ),
//         const SizedBox(height: 14),
//         _buildTextField(
//           controller: e.extPriceCtrl,
//           label: 'Estimasi Harga (Rp)',
//           hint: 'Contoh: 1.250.000',
//           icon: Icons.payments_rounded,
//           keyboardType: TextInputType.number,
//           validator: (v) {
//             if (v == null || v.trim().isEmpty)
//               return 'Estimasi harga wajib diisi';
//             final n = int.tryParse(v.replaceAll(RegExp(r'[^0-9]'), ''));
//             if (n == null || n <= 0) return 'Harga tidak valid';
//             return null;
//           },
//         ),
//         const SizedBox(height: 14),
//         _buildTextField(
//           controller: e.qtyCtrl,
//           label: 'Jumlah',
//           hint: '0',
//           icon: Icons.numbers_rounded,
//           keyboardType: TextInputType.number,
//           validator: (v) {
//             if (v == null || v.trim().isEmpty) return 'Wajib diisi';
//             final n = int.tryParse(v.trim());
//             if (n == null || n <= 0) return 'Tidak valid';
//             return null;
//           },
//         ),
//       ],
//     );
//   }

//   // ── Photo uploader ──────────────────────────────────────────────────────
//   Widget _buildPhotoUploader({
//     required _ItemEntry entry,
//     required String label,
//     required String helper,
//   }) {
//     final hasPhoto = entry.photoLabel != null;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: TextStyle(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.grey.shade700)),
//         const SizedBox(height: 6),
//         GestureDetector(
//           onTap: () => _pickPhoto(entry),
//           child: AnimatedContainer(
//             duration: const Duration(milliseconds: 200),
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
//             decoration: BoxDecoration(
//               color: hasPhoto
//                   ? AppTheme.primary.withValues(alpha: 0.06)
//                   : AppTheme.background,
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(
//                 color: hasPhoto
//                     ? AppTheme.primary.withValues(alpha: 0.4)
//                     : Colors.grey.shade300,
//                 width: 1.5,
//               ),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   width: 44,
//                   height: 44,
//                   decoration: BoxDecoration(
//                     color: hasPhoto
//                         ? AppTheme.primary
//                         : AppTheme.primary.withValues(alpha: 0.12),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Icon(
//                     hasPhoto ? Icons.image_rounded : Icons.add_a_photo_rounded,
//                     color: hasPhoto ? Colors.white : AppTheme.primary,
//                     size: 22,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         hasPhoto
//                             ? 'Foto terlampir · ${entry.photoLabel!}'
//                             : 'Unggah Foto Contoh',
//                         style: const TextStyle(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w800,
//                             color: AppTheme.textPrimary),
//                       ),
//                       const SizedBox(height: 2),
//                       Text(
//                         hasPhoto
//                             ? 'Ketuk untuk mengganti / menghapus foto.'
//                             : helper,
//                         style: TextStyle(
//                             fontSize: 10.5,
//                             color: Colors.grey.shade600,
//                             height: 1.35),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Icon(
//                   hasPhoto
//                       ? Icons.check_circle_rounded
//                       : Icons.chevron_right_rounded,
//                   color:
//                       hasPhoto ? AppTheme.statusApproved : Colors.grey.shade400,
//                   size: 20,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // ── Urgency selector (dari file 1) ──────────────────────────────────────
//   Widget _buildUrgencySelector() {
//     final options = [
//       {'value': 'low', 'label': 'Rendah', 'color': AppTheme.statusCompleted},
//       {'value': 'normal', 'label': 'Normal', 'color': AppTheme.primary},
//       {'value': 'high', 'label': 'Tinggi', 'color': AppTheme.statusPending},
//       {'value': 'urgent', 'label': 'Urgent', 'color': AppTheme.statusRejected},
//     ];
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Tingkat Urgensi',
//             style: TextStyle(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.grey.shade700)),
//         const SizedBox(height: 8),
//         Row(
//           children: options.map((opt) {
//             final selected = _urgency == opt['value'];
//             final c = opt['color'] as Color;
//             return Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 3),
//                 child: GestureDetector(
//                   onTap: () =>
//                       setState(() => _urgency = opt['value'] as String),
//                   child: AnimatedContainer(
//                     duration: const Duration(milliseconds: 180),
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     decoration: BoxDecoration(
//                       color: selected ? c : c.withValues(alpha: 0.08),
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(
//                         color: selected ? c : Colors.transparent,
//                         width: 1.5,
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         opt['label'] as String,
//                         style: TextStyle(
//                           fontSize: 11,
//                           fontWeight: FontWeight.w700,
//                           color: selected ? Colors.white : c,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }

//   // ── Date field (dari file 1) ────────────────────────────────────────────
//   Widget _buildDateField() {
//     final months = [
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'Mei',
//       'Jun',
//       'Jul',
//       'Agu',
//       'Sep',
//       'Okt',
//       'Nov',
//       'Des'
//     ];
//     final formatted =
//         '${_neededDate.day.toString().padLeft(2, '0')} ${months[_neededDate.month - 1]} ${_neededDate.year}';

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Tanggal Dibutuhkan',
//             style: TextStyle(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.grey.shade700)),
//         const SizedBox(height: 6),
//         GestureDetector(
//           onTap: _pickDate,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//             decoration: BoxDecoration(
//               color: AppTheme.background,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               children: [
//                 const Icon(Icons.event_rounded,
//                     size: 18, color: AppTheme.primary),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: Text(formatted,
//                       style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                           color: AppTheme.textPrimary)),
//                 ),
//                 Icon(Icons.keyboard_arrow_down_rounded,
//                     color: Colors.grey.shade500),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // ── Header ──────────────────────────────────────────────────────────────
//   Widget _buildHeader() {
//     return SliverAppBar(
//       expandedHeight: 120,
//       pinned: true,
//       elevation: 0,
//       backgroundColor: AppTheme.primaryDark,
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
//         onPressed: () => Navigator.pop(context),
//       ),
//       flexibleSpace: FlexibleSpaceBar(
//         collapseMode: CollapseMode.pin,
//         background: Container(
//           decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
//           child: Stack(
//             children: [
//               Positioned(
//                 right: -20,
//                 top: -20,
//                 child: Container(
//                   width: 130,
//                   height: 130,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white.withValues(alpha: 0.06),
//                   ),
//                 ),
//               ),
//               SafeArea(
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(60, 14, 20, 0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Buat Request Barang',
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w800,
//                               color: Colors.white)),
//                       const SizedBox(height: 4),
//                       Text(
//                         'Bisa request hingga $_kMaxItems jenis barang sekaligus',
//                         style: TextStyle(
//                             fontSize: 11,
//                             color: Colors.white.withValues(alpha: 0.85),
//                             fontWeight: FontWeight.w500),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // ── Helpers UI ──────────────────────────────────────────────────────────
//   Widget _sectionLabel(String text) => Padding(
//         padding: const EdgeInsets.only(left: 4),
//         child: Text(text,
//             style: const TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w800,
//                 color: AppTheme.textPrimary,
//                 letterSpacing: 0.3)),
//       );

//   Widget _buildCard({required Widget child}) => Container(
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(color: Colors.grey.shade100, width: 1.5),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.03),
//                 blurRadius: 10,
//                 offset: const Offset(0, 3))
//           ],
//         ),
//         child: child,
//       );

//   Widget _buildStatusBanner({
//     required Color color,
//     required String text,
//     IconData? icon,
//     bool isLoading = false,
//     Widget? trailing,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       margin: const EdgeInsets.only(bottom: 10),
//       decoration: BoxDecoration(
//         color: color.withValues(alpha: 0.06),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         children: [
//           if (isLoading)
//             SizedBox(
//               width: 16,
//               height: 16,
//               child: CircularProgressIndicator(strokeWidth: 2, color: color),
//             )
//           else if (icon != null)
//             Icon(icon, size: 16, color: color),
//           const SizedBox(width: 10),
//           Expanded(
//               child: Text(text, style: TextStyle(fontSize: 12, color: color))),
//           if (trailing != null) trailing,
//         ],
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required String hint,
//     required IconData icon,
//     int maxLines = 1,
//     TextInputType? keyboardType,
//     String? Function(String?)? validator,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: TextStyle(
//                 fontSize: 11,
//                 fontWeight: FontWeight.w700,
//                 color: Colors.grey.shade700)),
//         const SizedBox(height: 6),
//         TextFormField(
//           controller: controller,
//           maxLines: maxLines,
//           keyboardType: keyboardType,
//           validator: validator,
//           style: const TextStyle(
//               fontSize: 13,
//               fontWeight: FontWeight.w600,
//               color: AppTheme.textPrimary),
//           decoration: InputDecoration(
//             hintText: hint,
//             hintStyle: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey.shade400,
//                 fontWeight: FontWeight.w500),
//             prefixIcon: Padding(
//               padding: const EdgeInsets.only(left: 12, right: 8),
//               child: Icon(icon, size: 18, color: AppTheme.primary),
//             ),
//             prefixIconConstraints:
//                 const BoxConstraints(minWidth: 36, minHeight: 36),
//             filled: true,
//             fillColor: AppTheme.background,
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide.none),
//             focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide:
//                     const BorderSide(color: AppTheme.primary, width: 1.5)),
//             errorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(
//                     color: AppTheme.statusRejected, width: 1.5)),
//             focusedErrorBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(
//                     color: AppTheme.statusRejected, width: 1.5)),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildInfoBanner() {
//     final isExternal = _source == 'luar';
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: AppTheme.primary.withValues(alpha: 0.06),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: AppTheme.primary.withValues(alpha: 0.15)),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Icon(Icons.info_rounded, size: 18, color: AppTheme.primary),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               isExternal
//                   ? 'Request pembelian dari luar membutuhkan persetujuan tambahan dari approver Divisi IPAL & Bagian Pengadaan. Pastikan link & estimasi harga setiap barang sudah benar.'
//                   : 'Request akan diproses oleh approver Divisi IPAL. Pastikan data setiap barang sudah benar sebelum dikirim.',
//               style: TextStyle(
//                   fontSize: 11,
//                   color: Colors.grey.shade700,
//                   height: 1.5,
//                   fontWeight: FontWeight.w500),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ─────────────────────────────────────────────────────────────────────────────
// // Product Picker Bottom Sheet
// // ─────────────────────────────────────────────────────────────────────────────
// class _ProductPickerSheet extends StatefulWidget {
//   final List<ProductOption> products;

//   const _ProductPickerSheet({required this.products});

//   @override
//   State<_ProductPickerSheet> createState() => _ProductPickerSheetState();
// }

// class _ProductPickerSheetState extends State<_ProductPickerSheet> {
//   final _searchCtrl = TextEditingController();

//   @override
//   void dispose() {
//     _searchCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final query = _searchCtrl.text.toLowerCase();
//     final filtered = query.isEmpty
//         ? widget.products
//         : widget.products
//             .where((p) =>
//                 p.name.toLowerCase().contains(query) ||
//                 (p.sku?.toLowerCase().contains(query) ?? false))
//             .toList();

//     return Container(
//       height: MediaQuery.of(context).size.height * 0.82,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       child: Column(
//         children: [
//           // Handle bar
//           const SizedBox(height: 12),
//           Container(
//             width: 42,
//             height: 4,
//             decoration: BoxDecoration(
//               color: Colors.grey.shade300,
//               borderRadius: BorderRadius.circular(2),
//             ),
//           ),
//           const SizedBox(height: 14),
//           // Title
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Pilih Barang',
//                 style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w800,
//                     color: AppTheme.textPrimary),
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           // Search field
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: TextField(
//               controller: _searchCtrl,
//               autofocus: true,
//               style: const TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600,
//                   color: AppTheme.textPrimary),
//               decoration: InputDecoration(
//                 hintText: 'Cari nama atau SKU produk...',
//                 hintStyle: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey.shade400,
//                     fontWeight: FontWeight.w500),
//                 prefixIcon: const Padding(
//                   padding: EdgeInsets.only(left: 12, right: 8),
//                   child: Icon(Icons.search_rounded,
//                       size: 18, color: AppTheme.primary),
//                 ),
//                 prefixIconConstraints:
//                     const BoxConstraints(minWidth: 36, minHeight: 36),
//                 filled: true,
//                 fillColor: AppTheme.background,
//                 contentPadding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide:
//                         const BorderSide(color: AppTheme.primary, width: 1.5)),
//               ),
//               onChanged: (_) => setState(() {}),
//             ),
//           ),
//           const SizedBox(height: 8),
//           // Count
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 '${filtered.length} produk ditemukan',
//                 style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
//               ),
//             ),
//           ),
//           // List
//           Expanded(
//             child: filtered.isEmpty
//                 ? Center(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Icons.search_off_rounded,
//                             size: 48, color: Colors.grey.shade300),
//                         const SizedBox(height: 8),
//                         Text('Produk tidak ditemukan',
//                             style: TextStyle(
//                                 color: Colors.grey.shade400,
//                                 fontWeight: FontWeight.w600)),
//                       ],
//                     ),
//                   )
//                 : ListView.separated(
//                     padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
//                     itemCount: filtered.length,
//                     separatorBuilder: (_, __) => const SizedBox(height: 6),
//                     itemBuilder: (_, i) {
//                       final p = filtered[i];
//                       return InkWell(
//                         borderRadius: BorderRadius.circular(12),
//                         onTap: () => Navigator.pop(context, p),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 14, vertical: 12),
//                           decoration: BoxDecoration(
//                             color: AppTheme.background,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 38,
//                                 height: 38,
//                                 decoration: BoxDecoration(
//                                   color:
//                                       AppTheme.primary.withValues(alpha: 0.1),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: const Icon(Icons.inventory_2_rounded,
//                                     size: 18, color: AppTheme.primary),
//                               ),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(p.name,
//                                         style: const TextStyle(
//                                             fontSize: 13,
//                                             fontWeight: FontWeight.w700,
//                                             color: AppTheme.textPrimary)),
//                                     const SizedBox(height: 2),
//                                     Row(
//                                       children: [
//                                         Container(
//                                           padding: const EdgeInsets.symmetric(
//                                               horizontal: 6, vertical: 2),
//                                           decoration: BoxDecoration(
//                                             color: AppTheme.primary
//                                                 .withValues(alpha: 0.08),
//                                             borderRadius:
//                                                 BorderRadius.circular(6),
//                                           ),
//                                           child: Text(p.unit,
//                                               style: const TextStyle(
//                                                   fontSize: 10,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: AppTheme.primary)),
//                                         ),
//                                         if (p.sku != null) ...[
//                                           const SizedBox(width: 6),
//                                           Text('SKU: ${p.sku}',
//                                               style: TextStyle(
//                                                   fontSize: 10,
//                                                   color: Colors.grey.shade500)),
//                                         ],
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Icon(Icons.chevron_right_rounded,
//                                   color: Colors.grey.shade400, size: 18),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:warehouse/core/constant/variables.dart';
import 'package:warehouse/data/datasource/auth/auth_local_datasource.dart';
import 'package:warehouse/data/model/request/request_request_model.dart';
import 'package:warehouse/presentation/bloc/user/request/request_bloc.dart';
import 'app_theme.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Model lokal untuk opsi produk dari API (GET /api/products)
// ─────────────────────────────────────────────────────────────────────────────
class ProductOption {
  final int id;
  final String name;
  final String unit;
  final String? sku;

  const ProductOption({
    required this.id,
    required this.name,
    required this.unit,
    this.sku,
  });

  factory ProductOption.fromMap(Map<String, dynamic> map) => ProductOption(
        id: map['id'] ?? 0,
        name: map['name'] ?? '',
        unit: map['unit'] ?? 'unit',
        sku: map['sku'],
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// Item entry per baris barang
// ─────────────────────────────────────────────────────────────────────────────
const int _kMaxItems = 5;

class _ItemEntry {
  // ── Dari Gudang ──
  ProductOption? selectedProduct;
  final TextEditingController qtyCtrl = TextEditingController();
  final TextEditingController itemNoteCtrl = TextEditingController();
  String? photoLabel;

  // ── Dari Luar ──
  final TextEditingController extNameCtrl = TextEditingController();
  final TextEditingController extSpecCtrl = TextEditingController();
  final TextEditingController extLinkCtrl = TextEditingController();
  final TextEditingController extPriceCtrl = TextEditingController();
  String extUnit = 'unit'; // tampilan saja

  void dispose() {
    qtyCtrl.dispose();
    itemNoteCtrl.dispose();
    extNameCtrl.dispose();
    extSpecCtrl.dispose();
    extLinkCtrl.dispose();
    extPriceCtrl.dispose();
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// CreateRequestPage
// ─────────────────────────────────────────────────────────────────────────────
class CreateRequestPage extends StatefulWidget {
  /// Opsional: prefill dari katalog stok gudang (dari file 1)
  final Map<String, dynamic>? prefillItem;

  const CreateRequestPage({super.key, this.prefillItem});

  @override
  State<CreateRequestPage> createState() => _CreateRequestPageState();
}

class _CreateRequestPageState extends State<CreateRequestPage> {
  final _formKey = GlobalKey<FormState>();

  String _source = 'gudang';
  String? _purpose;

  static const _purposeOptions = [
    {
      'value': 'maintenance',
      'label': 'Maintenance',
      'icon': Icons.build_rounded
    },
    {
      'value': 'distribution',
      'label': 'Distribution',
      'icon': Icons.local_shipping_rounded
    },
    {
      'value': 'return',
      'label': 'Return',
      'icon': Icons.assignment_return_rounded
    },
    {'value': 'other', 'label': 'Lainnya', 'icon': Icons.more_horiz_rounded},
  ];

  // Daftar barang TERPISAH per sumber
  final List<_ItemEntry> _warehouseItems = [];
  final List<_ItemEntry> _externalItems = [];
  List<_ItemEntry> get _items =>
      _source == 'gudang' ? _warehouseItems : _externalItems;

  // Produk dari API
  List<ProductOption> _allProducts = [];
  bool _productsLoading = false;
  String? _productsError;

  // Field tingkat request
  final _noteCtrl = TextEditingController();
  String _urgency = 'normal';
  DateTime _neededDate = DateTime.now().add(const Duration(days: 3));

  // Submit state lokal (jangan pakai BLoC loading — bisa bocor)
  bool _isSubmitting = false;

  static const _units = [
    'unit',
    'pcs',
    'kg',
    'liter',
    'modul',
    'batang',
    'roll'
  ];

  @override
  void initState() {
    super.initState();

    final warehouseFirst = _ItemEntry();
    final externalFirst = _ItemEntry();

    // Prefill dari katalog gudang → item pertama warehouse (dari file 1)
    final p = widget.prefillItem;
    if (p != null && p['id'] != null) {
      warehouseFirst.selectedProduct = ProductOption(
        id: p['id'] as int,
        name: (p['name'] ?? '') as String,
        unit: (p['unit'] ?? 'unit') as String,
        sku: p['sku'] as String?,
      );
    }

    _warehouseItems.add(warehouseFirst);
    _externalItems.add(externalFirst);

    _loadProducts();
  }

  @override
  void dispose() {
    for (final it in _warehouseItems) it.dispose();
    for (final it in _externalItems) it.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  // ── Load produk dari GET /api/products ──────────────────────────────────
  Future<void> _loadProducts() async {
    if (!mounted) return;
    setState(() {
      _productsLoading = true;
      _productsError = null;
    });

    try {
      final token = await AuthLocalDatasource().getToken();
      final url = Uri.parse('${Variables.baseUrl}/api/products')
          .replace(queryParameters: {'per_page': '200', 'is_active': 'true'});

      final response = await http.get(url, headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      }).timeout(const Duration(seconds: 15));

      log('📦 [PRODUCTS] ${response.statusCode}');
      if (!mounted) return;

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final rawData = decoded['data'];
        List items = [];

        if (rawData is Map && rawData['data'] is List) {
          items = rawData['data'];
        } else if (rawData is List) {
          items = rawData;
        }

        setState(() {
          _allProducts = items
              .map((e) => ProductOption.fromMap(Map<String, dynamic>.from(e)))
              .toList();
          _productsLoading = false;
        });
        log('📦 [PRODUCTS] Loaded ${_allProducts.length} products');
      } else {
        setState(() {
          _productsError = 'Gagal memuat produk (${response.statusCode})';
          _productsLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _productsError = 'Koneksi gagal: $e';
        _productsLoading = false;
      });
    }
  }

  // ── Manipulasi item list ────────────────────────────────────────────────
  void _addItem() {
    if (_items.length >= _kMaxItems) return;
    HapticFeedback.selectionClick();
    setState(() => _items.add(_ItemEntry()));
  }

  void _removeItem(int index) {
    if (_items.length <= 1) return;
    HapticFeedback.lightImpact();
    setState(() => _items.removeAt(index).dispose());
  }

  // ── Date picker ─────────────────────────────────────────────────────────
  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _neededDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppTheme.primary,
            onPrimary: Colors.white,
            onSurface: AppTheme.textPrimary,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _neededDate = picked);
  }

  // ── Photo picker ────────────────────────────────────────────────────────
  Future<void> _pickPhoto(_ItemEntry entry) async {
    HapticFeedback.selectionClick();
    final hasPhoto = entry.photoLabel != null;

    final result = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.fromLTRB(20, 14, 20, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 18),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Unggah Foto Contoh',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
            const SizedBox(height: 14),
            _photoSourceTile(
              icon: Icons.photo_camera_rounded,
              title: 'Ambil dari Kamera',
              subtitle: 'Foto langsung dari kamera perangkat',
              onTap: () => Navigator.pop(ctx, 'Foto Kamera'),
            ),
            const SizedBox(height: 10),
            _photoSourceTile(
              icon: Icons.photo_library_rounded,
              title: 'Pilih dari Galeri',
              subtitle: 'Pilih foto yang sudah ada di galeri',
              onTap: () => Navigator.pop(ctx, 'Foto Galeri'),
            ),
            if (hasPhoto) ...[
              const SizedBox(height: 10),
              _photoSourceTile(
                icon: Icons.delete_outline_rounded,
                title: 'Hapus Foto',
                subtitle: 'Batalkan unggahan foto contoh',
                color: AppTheme.statusRejected,
                onTap: () => Navigator.pop(ctx, '__remove__'),
              ),
            ],
          ],
        ),
      ),
    );

    if (result == null) return;
    setState(() => entry.photoLabel = result == '__remove__' ? null : result);
  }

  Widget _photoSourceTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Color? color,
  }) {
    final c = color ?? AppTheme.primary;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: c.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: c.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: c, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w800,
                          color: color ?? AppTheme.textPrimary)),
                  Text(subtitle,
                      style:
                          TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded,
                color: Colors.grey.shade400, size: 20),
          ],
        ),
      ),
    );
  }

  // ── Product picker bottom sheet ─────────────────────────────────────────
  Future<void> _pickProduct(_ItemEntry e) async {
    if (_productsLoading) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Daftar produk masih dimuat, tunggu sebentar...')),
      );
      return;
    }
    if (_allProducts.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Tidak ada produk tersedia')),
      );
      return;
    }

    final picked = await showModalBottomSheet<ProductOption>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _ProductPickerSheet(products: _allProducts),
    );

    if (picked != null) setState(() => e.selectedProduct = picked);
  }

  // ── Submit ──────────────────────────────────────────────────────────────
  void _submit() {
    if (_isSubmitting) return;
    if (!_formKey.currentState!.validate()) return;

    if (_purpose == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Pilih tujuan permintaan terlebih dahulu')),
      );
      return;
    }

    final List<RequestItemInput> requestItems;

    if (_source == 'gudang') {
      // ── Arsitektur barang gudang: TIDAK diubah ──
      for (int i = 0; i < _warehouseItems.length; i++) {
        if (_warehouseItems[i].selectedProduct == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Barang ${i + 1} belum dipilih dari daftar')),
          );
          return;
        }
      }
      requestItems = _warehouseItems
          .map((e) => RequestItemInput.fromWarehouse(
                productId: e.selectedProduct!.id,
                quantity: int.tryParse(e.qtyCtrl.text.trim()) ?? 1,
                note: e.itemNoteCtrl.text.trim().isEmpty
                    ? null
                    : e.itemNoteCtrl.text.trim(),
              ))
          .toList();
    } else {
      // ── Barang dari luar: sekarang benar-benar terkirim ke backend ──
      requestItems = _externalItems.map((e) {
        final priceDigits =
            e.extPriceCtrl.text.replaceAll(RegExp(r'[^0-9]'), '');
        return RequestItemInput.fromExternal(
          externalName: e.extNameCtrl.text.trim(),
          externalSpec: e.extSpecCtrl.text.trim(),
          externalLink: e.extLinkCtrl.text.trim(),
          externalPrice: num.tryParse(priceDigits) ?? 0,
          quantity: int.tryParse(e.qtyCtrl.text.trim()) ?? 1,
        );
      }).toList();
    }

    HapticFeedback.lightImpact();
    setState(() => _isSubmitting = true);

    final model = StoreStockRequestModel(
      purpose: _purpose!,
      note: _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim(),
      items: requestItems,
    );

    log('[SUBMIT] ${model.toJson()}');
    context.read<RequestBloc>().add(RequestEvent.storeRequest(model));
  }

  // ── Build ───────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return BlocListener<RequestBloc, RequestState>(
      listenWhen: (_, __) => _isSubmitting,
      listener: (context, state) {
        state.maybeWhen(
          actionSuccess: (message, data) {
            setState(() => _isSubmitting = false);
            showDialog(
              context: context,
              builder: (_) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color:
                              AppTheme.statusApproved.withValues(alpha: 0.12),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check_circle_rounded,
                            color: AppTheme.statusApproved, size: 36),
                      ),
                      const SizedBox(height: 16),
                      const Text('Request Berhasil Dikirim',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.textPrimary)),
                      const SizedBox(height: 6),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                            height: 1.5),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context); // tutup dialog
                            Navigator.pop(context, true); // kembali ke list
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text('Selesai',
                              style: TextStyle(fontWeight: FontWeight.w700)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (message) {
            setState(() => _isSubmitting = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message), backgroundColor: Colors.red),
            );
          },
          orElse: () {},
        );
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: AppTheme.lightOverlay,
        child: Scaffold(
          backgroundColor: AppTheme.background,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                _buildHeader(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── Tujuan Permintaan ──────────────────────────
                          _sectionLabel('Tujuan Permintaan *'),
                          const SizedBox(height: 10),
                          _buildPurposeSelector(),
                          const SizedBox(height: 22),

                          // ── Sumber Barang ──────────────────────────────
                          _sectionLabel('Sumber Barang'),
                          const SizedBox(height: 10),
                          _buildSourceSelector(),
                          const SizedBox(height: 22),

                          // ── Header daftar barang ───────────────────────
                          Row(
                            children: [
                              Expanded(
                                child: _sectionLabel(_source == 'gudang'
                                    ? 'Daftar Barang dari Gudang'
                                    : 'Daftar Barang dari Luar'),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color:
                                      AppTheme.primary.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '${_items.length}/$_kMaxItems jenis',
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w800,
                                      color: AppTheme.primary),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // ── Banner status produk / info luar ───────────
                          if (_source == 'gudang') ...[
                            if (_productsLoading)
                              _buildStatusBanner(
                                color: AppTheme.primary,
                                isLoading: true,
                                text: 'Memuat daftar produk...',
                              ),
                            if (_productsError != null)
                              _buildStatusBanner(
                                color: AppTheme.statusRejected,
                                icon: Icons.error_outline_rounded,
                                text: _productsError!,
                                trailing: TextButton(
                                  onPressed: _loadProducts,
                                  child: const Text('Coba lagi',
                                      style: TextStyle(fontSize: 11)),
                                ),
                              ),
                          ] else
                            _buildStatusBanner(
                              color: AppTheme.statusPending,
                              icon: Icons.storefront_rounded,
                              text:
                                  'Isi nama, spesifikasi, link toko, dan estimasi harga setiap barang dengan lengkap.',
                            ),

                          // ── Item cards ─────────────────────────────────
                          AnimatedSize(
                            duration: const Duration(milliseconds: 220),
                            curve: Curves.easeOut,
                            child: Column(
                              children: List.generate(
                                _items.length,
                                (i) => Padding(
                                  padding: EdgeInsets.only(
                                      bottom: i == _items.length - 1 ? 0 : 12),
                                  child: _buildItemCard(i),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          // ── Tombol tambah barang ───────────────────────
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed:
                                  _items.length < _kMaxItems ? _addItem : null,
                              icon: Icon(
                                  _items.length < _kMaxItems
                                      ? Icons.add_rounded
                                      : Icons.block_rounded,
                                  size: 18),
                              label: Text(
                                _items.length < _kMaxItems
                                    ? 'Tambah Barang (${_items.length}/$_kMaxItems)'
                                    : 'Maksimal $_kMaxItems jenis barang',
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w700),
                              ),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: _items.length < _kMaxItems
                                    ? AppTheme.primary
                                    : Colors.grey.shade500,
                                side: BorderSide(
                                  color: _items.length < _kMaxItems
                                      ? AppTheme.primary.withValues(alpha: 0.5)
                                      : Colors.grey.shade300,
                                  width: 1.5,
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                            ),
                          ),

                          const SizedBox(height: 22),

                          // ── Detail Permintaan ──────────────────────────
                          _sectionLabel('Detail Permintaan'),
                          const SizedBox(height: 10),
                          _buildCard(
                            child: Column(
                              children: [
                                _buildUrgencySelector(),
                                const SizedBox(height: 14),
                                _buildDateField(),
                                const SizedBox(height: 14),
                                _buildTextField(
                                  controller: _noteCtrl,
                                  label: 'Catatan / Keperluan',
                                  hint: 'Tuliskan tujuan penggunaan barang...',
                                  icon: Icons.notes_rounded,
                                  maxLines: 4,
                                  validator: (v) =>
                                      (v == null || v.trim().isEmpty)
                                          ? 'Tolong jelaskan keperluannya'
                                          : null,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 22),
                          _buildInfoBanner(),
                          const SizedBox(height: 20),

                          // ── Tombol kirim ───────────────────────────────
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _isSubmitting ? null : _submit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primary,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14)),
                              ),
                              child: _isSubmitting
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2, color: Colors.white),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.send_rounded,
                                            size: 18),
                                        const SizedBox(width: 8),
                                        Text(
                                          'Kirim Request (${_items.length} jenis)',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ],
                                    ),
                            ),
                          ),

                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () => Navigator.pop(context),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.grey.shade600,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: const Text('Batal',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Purpose selector ────────────────────────────────────────────────────
  Widget _buildPurposeSelector() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _purposeOptions.map((opt) {
        final selected = _purpose == opt['value'];
        return GestureDetector(
          onTap: () {
            HapticFeedback.selectionClick();
            setState(() => _purpose = opt['value'] as String);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: selected ? AppTheme.primary : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selected ? AppTheme.primary : Colors.grey.shade200,
                width: 1.5,
              ),
              boxShadow: selected
                  ? [
                      BoxShadow(
                          color: AppTheme.primary.withValues(alpha: 0.25),
                          blurRadius: 10,
                          offset: const Offset(0, 4))
                    ]
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(opt['icon'] as IconData,
                    size: 16,
                    color: selected ? Colors.white : AppTheme.primary),
                const SizedBox(width: 6),
                Text(opt['label'] as String,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: selected ? Colors.white : AppTheme.textPrimary,
                    )),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  // ── Source selector ─────────────────────────────────────────────────────
  Widget _buildSourceSelector() {
    const options = [
      {
        'value': 'gudang',
        'title': 'Dari Gudang',
        'subtitle': 'Ambil dari stok yang tersedia',
        'icon': Icons.warehouse_rounded
      },
      {
        'value': 'luar',
        'title': 'Dari Luar',
        'subtitle': 'Beli dari supplier / toko luar',
        'icon': Icons.storefront_rounded
      },
    ];
    return Row(
      children: options.map((opt) {
        final selected = _source == opt['value'];
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: opt['value'] == 'gudang' ? 6 : 0,
              left: opt['value'] == 'luar' ? 6 : 0,
            ),
            child: GestureDetector(
              onTap: () {
                if (selected) return;
                HapticFeedback.selectionClick();
                setState(() => _source = opt['value'] as String);
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: selected ? AppTheme.primary : Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: selected ? AppTheme.primary : Colors.grey.shade200,
                    width: 1.5,
                  ),
                  boxShadow: selected
                      ? [
                          BoxShadow(
                              color: AppTheme.primary.withValues(alpha: 0.25),
                              blurRadius: 14,
                              offset: const Offset(0, 6))
                        ]
                      : null,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: selected
                            ? Colors.white.withValues(alpha: 0.22)
                            : AppTheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Icon(opt['icon'] as IconData,
                          size: 20,
                          color: selected ? Colors.white : AppTheme.primary),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(opt['title'] as String,
                              style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w800,
                                  color: selected
                                      ? Colors.white
                                      : AppTheme.textPrimary)),
                          const SizedBox(height: 2),
                          Text(opt['subtitle'] as String,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: selected
                                      ? Colors.white.withValues(alpha: 0.85)
                                      : Colors.grey.shade600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // ── Item card ───────────────────────────────────────────────────────────
  Widget _buildItemCard(int index) {
    final entry = _items[index];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100, width: 1.5),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 3))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(14, 12, 8, 12),
            decoration: BoxDecoration(
              color: AppTheme.primary.withValues(alpha: 0.06),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text('${index + 1}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w800)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text('Barang ${index + 1}',
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.textPrimary)),
                ),
                if (_items.length > 1)
                  IconButton(
                    tooltip: 'Hapus barang',
                    onPressed: () => _removeItem(index),
                    icon: const Icon(Icons.delete_outline_rounded,
                        size: 20, color: AppTheme.statusRejected),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 220),
              switchInCurve: Curves.easeOut,
              transitionBuilder: (child, anim) =>
                  FadeTransition(opacity: anim, child: child),
              child: _source == 'gudang'
                  ? _buildWarehouseFields(entry, index)
                  : _buildExternalFields(entry, index),
            ),
          ),
        ],
      ),
    );
  }

  // ── Warehouse fields ────────────────────────────────────────────────────
  Widget _buildWarehouseFields(_ItemEntry e, int index) {
    final isSelected = e.selectedProduct != null;
    return Column(
      key: ValueKey('gudang-$index'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Nama Barang *',
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700)),
        const SizedBox(height: 6),
        FormField<ProductOption>(
          initialValue: e.selectedProduct,
          validator: (_) =>
              e.selectedProduct == null ? 'Pilih barang dari daftar' : null,
          builder: (field) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => _pickProduct(e),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: field.hasError
                          ? AppTheme.statusRejected
                          : isSelected
                              ? AppTheme.primary.withValues(alpha: 0.5)
                              : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isSelected
                            ? Icons.inventory_2_rounded
                            : Icons.search_rounded,
                        size: 18,
                        color: isSelected
                            ? AppTheme.primary
                            : Colors.grey.shade400,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          isSelected
                              ? e.selectedProduct!.name
                              : _productsLoading
                                  ? 'Memuat produk...'
                                  : 'Pilih barang dari daftar',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: isSelected
                                ? AppTheme.textPrimary
                                : Colors.grey.shade400,
                          ),
                        ),
                      ),
                      if (_productsLoading)
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: AppTheme.primary),
                        )
                      else if (isSelected)
                        GestureDetector(
                          onTap: () => setState(() => e.selectedProduct = null),
                          child: Icon(Icons.close_rounded,
                              size: 18, color: Colors.grey.shade400),
                        )
                      else
                        Icon(Icons.keyboard_arrow_down_rounded,
                            color: Colors.grey.shade400, size: 20),
                    ],
                  ),
                ),
              ),
              if (field.hasError) ...[
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(field.errorText!,
                      style: const TextStyle(
                          fontSize: 11, color: AppTheme.statusRejected)),
                ),
              ],
            ],
          ),
        ),

        // Badge detail produk terpilih
        if (isSelected) ...[
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.statusApproved.withValues(alpha: 0.07),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: AppTheme.statusApproved.withValues(alpha: 0.25)),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle_rounded,
                    size: 14, color: AppTheme.statusApproved),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    '${e.selectedProduct!.name} · ${e.selectedProduct!.unit}'
                    '${e.selectedProduct!.sku != null ? ' · SKU: ${e.selectedProduct!.sku}' : ''}',
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.statusApproved),
                  ),
                ),
              ],
            ),
          ),
        ],

        const SizedBox(height: 14),
        _buildTextField(
          controller: e.qtyCtrl,
          label: 'Jumlah',
          hint: '0',
          icon: Icons.numbers_rounded,
          keyboardType: TextInputType.number,
          validator: (v) {
            if (v == null || v.trim().isEmpty) return 'Wajib diisi';
            final n = int.tryParse(v.trim());
            if (n == null || n <= 0) return 'Jumlah tidak valid';
            return null;
          },
        ),
        const SizedBox(height: 14),
        _buildTextField(
          controller: e.itemNoteCtrl,
          label: 'Catatan Item (opsional)',
          hint: 'Contoh: warna merah, ukuran M...',
          icon: Icons.edit_note_rounded,
        ),
        const SizedBox(height: 14),
        _buildPhotoUploader(
          entry: e,
          label: 'Foto Contoh Barang (opsional)',
          helper:
              'Lampirkan foto agar petugas gudang lebih mudah mengenali barang.',
        ),
      ],
    );
  }

  // ── External fields (dari file 2 — dengan satuan dropdown) ─────────────
  Widget _buildExternalFields(_ItemEntry e, int index) {
    return Column(
      key: ValueKey('luar-$index'),
      children: [
        _buildTextField(
          controller: e.extNameCtrl,
          label: 'Nama Barang',
          hint: 'Contoh: Pompa Dosing Kimia 12 L/h',
          icon: Icons.inventory_2_rounded,
          validator: (v) =>
              (v == null || v.trim().isEmpty) ? 'Wajib diisi' : null,
        ),
        const SizedBox(height: 14),
        _buildTextField(
          controller: e.extSpecCtrl,
          label: 'Spesifikasi Barang',
          hint: 'Tulis spesifikasi: kapasitas, daya, material, merk, dll.',
          icon: Icons.list_alt_rounded,
          maxLines: 4,
          validator: (v) => (v == null || v.trim().isEmpty)
              ? 'Spesifikasi wajib diisi'
              : null,
        ),
        const SizedBox(height: 14),
        _buildPhotoUploader(
          entry: e,
          label: 'Foto Contoh Barang',
          helper:
              'Wajib lampirkan foto agar approver bisa memverifikasi barang.',
        ),
        const SizedBox(height: 14),
        _buildTextField(
          controller: e.extLinkCtrl,
          label: 'Link Pembelian',
          hint: 'https://contoh-toko.com/produk/...',
          icon: Icons.link_rounded,
          keyboardType: TextInputType.url,
          validator: (v) {
            if (v == null || v.trim().isEmpty)
              return 'Tolong masukkan link pembelian';
            final url = v.trim();
            if (!url.startsWith('http://') &&
                !url.startsWith('https://') &&
                !url.contains('.')) return 'Link tidak valid';
            return null;
          },
        ),
        const SizedBox(height: 14),
        _buildTextField(
          controller: e.extPriceCtrl,
          label: 'Estimasi Harga (Rp)',
          hint: 'Contoh: 1.250.000',
          icon: Icons.payments_rounded,
          keyboardType: TextInputType.number,
          validator: (v) {
            if (v == null || v.trim().isEmpty)
              return 'Estimasi harga wajib diisi';
            final n = int.tryParse(v.replaceAll(RegExp(r'[^0-9]'), ''));
            if (n == null || n <= 0) return 'Harga tidak valid';
            return null;
          },
        ),
        const SizedBox(height: 14),
        // Jumlah + satuan dropdown (dari file 2)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildTextField(
                controller: e.qtyCtrl,
                label: 'Jumlah',
                hint: '0',
                icon: Icons.numbers_rounded,
                keyboardType: TextInputType.number,
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Wajib';
                  final n = int.tryParse(v.trim());
                  if (n == null || n <= 0) return 'Tidak valid';
                  return null;
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: _buildDropdown(
                label: 'Satuan',
                icon: Icons.straighten_rounded,
                value: e.extUnit,
                items: _units,
                onChanged: (v) => setState(() => e.extUnit = v!),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ── Photo uploader ──────────────────────────────────────────────────────
  Widget _buildPhotoUploader({
    required _ItemEntry entry,
    required String label,
    required String helper,
  }) {
    final hasPhoto = entry.photoLabel != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () => _pickPhoto(entry),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
            decoration: BoxDecoration(
              color: hasPhoto
                  ? AppTheme.primary.withValues(alpha: 0.06)
                  : AppTheme.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: hasPhoto
                      ? AppTheme.primary.withValues(alpha: 0.4)
                      : Colors.grey.shade300,
                  width: 1.5),
            ),
            child: Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: hasPhoto
                        ? AppTheme.primary
                        : AppTheme.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                      hasPhoto
                          ? Icons.image_rounded
                          : Icons.add_a_photo_rounded,
                      color: hasPhoto ? Colors.white : AppTheme.primary,
                      size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          hasPhoto
                              ? 'Foto terlampir · ${entry.photoLabel!}'
                              : 'Unggah Foto Contoh',
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.textPrimary)),
                      const SizedBox(height: 2),
                      Text(
                          hasPhoto
                              ? 'Ketuk untuk mengganti / menghapus foto.'
                              : helper,
                          style: TextStyle(
                              fontSize: 10.5,
                              color: Colors.grey.shade600,
                              height: 1.35)),
                    ],
                  ),
                ),
                Icon(
                    hasPhoto
                        ? Icons.check_circle_rounded
                        : Icons.chevron_right_rounded,
                    color: hasPhoto
                        ? AppTheme.statusApproved
                        : Colors.grey.shade400,
                    size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ── Urgency selector ────────────────────────────────────────────────────
  Widget _buildUrgencySelector() {
    final options = [
      {'value': 'low', 'label': 'Rendah', 'color': AppTheme.statusCompleted},
      {'value': 'normal', 'label': 'Normal', 'color': AppTheme.primary},
      {'value': 'high', 'label': 'Tinggi', 'color': AppTheme.statusPending},
      {'value': 'urgent', 'label': 'Urgent', 'color': AppTheme.statusRejected},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tingkat Urgensi',
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700)),
        const SizedBox(height: 8),
        Row(
          children: options.map((opt) {
            final selected = _urgency == opt['value'];
            final c = opt['color'] as Color;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: GestureDetector(
                  onTap: () =>
                      setState(() => _urgency = opt['value'] as String),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: selected ? c : c.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: selected ? c : Colors.transparent, width: 1.5),
                    ),
                    child: Center(
                      child: Text(opt['label'] as String,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: selected ? Colors.white : c)),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ── Date field ──────────────────────────────────────────────────────────
  Widget _buildDateField() {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des'
    ];
    final formatted =
        '${_neededDate.day.toString().padLeft(2, '0')} ${months[_neededDate.month - 1]} ${_neededDate.year}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tanggal Dibutuhkan',
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: _pickDate,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                const Icon(Icons.event_rounded,
                    size: 18, color: AppTheme.primary),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(formatted,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary))),
                Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.grey.shade500),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ── Header ──────────────────────────────────────────────────────────────
  Widget _buildHeader() {
    return SliverAppBar(
      expandedHeight: 120,
      pinned: true,
      elevation: 0,
      backgroundColor: AppTheme.primaryDark,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Container(
          decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                top: -20,
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60, 14, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Buat Request Barang',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                      const SizedBox(height: 4),
                      Text(
                        'Bisa request hingga $_kMaxItems jenis barang sekaligus',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white.withValues(alpha: 0.85),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── Helpers UI ──────────────────────────────────────────────────────────
  Widget _sectionLabel(String text) => Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(text,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: AppTheme.textPrimary,
                letterSpacing: 0.3)),
      );

  Widget _buildCard({required Widget child}) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100, width: 1.5),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 3))
          ],
        ),
        child: child,
      );

  // Generic status banner — menggabungkan _buildProductsLoadingBanner,
  // _buildProductsErrorBanner, dan _buildExternalInfoBanner dari file 2
  // menjadi satu method yang fleksibel (dari file 1)
  Widget _buildStatusBanner({
    required Color color,
    required String text,
    IconData? icon,
    bool isLoading = false,
    Widget? trailing,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          if (isLoading)
            SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2, color: color),
            )
          else if (icon != null)
            Icon(icon, size: 16, color: color),
          const SizedBox(width: 10),
          Expanded(
              child: Text(text, style: TextStyle(fontSize: 12, color: color))),
          if (trailing != null) trailing,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: Icon(icon, size: 18, color: AppTheme.primary),
            ),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 36, minHeight: 36),
            filled: true,
            fillColor: AppTheme.background,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                    const BorderSide(color: AppTheme.primary, width: 1.5)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    color: AppTheme.statusRejected, width: 1.5)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                    color: AppTheme.statusRejected, width: 1.5)),
          ),
        ),
      ],
    );
  }

  // Dropdown widget (dari file 2) — dipakai untuk satuan di external fields
  Widget _buildDropdown({
    required String label,
    required IconData icon,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade700)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Icon(icon, size: 18, color: AppTheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down_rounded,
                        color: Colors.grey.shade500),
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimary),
                    items: items
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: onChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoBanner() {
    final isExternal = _source == 'luar';
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_rounded, size: 18, color: AppTheme.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              isExternal
                  ? 'Request pembelian dari luar membutuhkan persetujuan tambahan dari approver Divisi IPAL & Bagian Pengadaan. Pastikan link & estimasi harga setiap barang sudah benar.'
                  : 'Request akan diproses oleh approver Divisi IPAL. Pastikan data setiap barang sudah benar sebelum dikirim.',
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade700,
                  height: 1.5,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Product Picker Bottom Sheet
// ─────────────────────────────────────────────────────────────────────────────
class _ProductPickerSheet extends StatefulWidget {
  final List<ProductOption> products;
  const _ProductPickerSheet({required this.products});

  @override
  State<_ProductPickerSheet> createState() => _ProductPickerSheetState();
}

class _ProductPickerSheetState extends State<_ProductPickerSheet> {
  final _searchCtrl = TextEditingController();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchCtrl.text.toLowerCase();
    final filtered = query.isEmpty
        ? widget.products
        : widget.products
            .where((p) =>
                p.name.toLowerCase().contains(query) ||
                (p.sku?.toLowerCase().contains(query) ?? false))
            .toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 42,
            height: 4,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(height: 14),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Pilih Barang',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppTheme.textPrimary)),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchCtrl,
              autofocus: true,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary),
              decoration: InputDecoration(
                hintText: 'Cari nama atau SKU produk...',
                hintStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 12, right: 8),
                  child: Icon(Icons.search_rounded,
                      size: 18, color: AppTheme.primary),
                ),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 36, minHeight: 36),
                filled: true,
                fillColor: AppTheme.background,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(color: AppTheme.primary, width: 1.5)),
              ),
              onChanged: (_) => setState(() {}),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('${filtered.length} produk ditemukan',
                  style: TextStyle(fontSize: 11, color: Colors.grey.shade500)),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off_rounded,
                            size: 48, color: Colors.grey.shade300),
                        const SizedBox(height: 8),
                        Text('Produk tidak ditemukan',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 6),
                    itemBuilder: (_, i) {
                      final p = filtered[i];
                      return InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => Navigator.pop(context, p),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 12),
                          decoration: BoxDecoration(
                              color: AppTheme.background,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                    color:
                                        AppTheme.primary.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(Icons.inventory_2_rounded,
                                    size: 18, color: AppTheme.primary),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(p.name,
                                        style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            color: AppTheme.textPrimary)),
                                    const SizedBox(height: 2),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                              color: AppTheme.primary
                                                  .withValues(alpha: 0.08),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                          child: Text(p.unit,
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppTheme.primary)),
                                        ),
                                        if (p.sku != null) ...[
                                          const SizedBox(width: 6),
                                          Text('SKU: ${p.sku}',
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.grey.shade500)),
                                        ],
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.chevron_right_rounded,
                                  color: Colors.grey.shade400, size: 18),
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




