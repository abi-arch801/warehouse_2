// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:warehouse/data/datasource/admin/stock_datasource.dart';
// import 'package:warehouse/presentation/admin/app_theme.dart';
// import 'package:warehouse/presentation/bloc/admin/stock_manual_in/stock_manual_in_bloc.dart';

// class StockManualInPage extends StatelessWidget {
//   const StockManualInPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) =>
//           StockManualInBloc()..add(const StockManualInEvent.loadOptions()),
//       child: const _StockManualInView(),
//     );
//   }
// }

// class _StockManualInView extends StatefulWidget {
//   const _StockManualInView();

//   @override
//   State<_StockManualInView> createState() => _StockManualInViewState();
// }

// class _StockManualInViewState extends State<_StockManualInView> {
//   final _formKey = GlobalKey<FormState>();
//   final _qtyController = TextEditingController();
//   final _noteController = TextEditingController();
//   final _stockDs = StockDataSource();

//   int? _selectedWarehouseId;
//   int? _selectedProductId;
//   bool _isSubmitting = false;

//   @override
//   void dispose() {
//     _qtyController.dispose();
//     _noteController.dispose();
//     super.dispose();
//   }

//   Future<void> _submit() async {
//     if (!_formKey.currentState!.validate()) return;
//     setState(() => _isSubmitting = true);

//     final result = await _stockDs.manualStockIn(
//       warehouseId: _selectedWarehouseId!,
//       productId: _selectedProductId!,
//       quantity: int.parse(_qtyController.text),
//       note: _noteController.text.isEmpty ? null : _noteController.text,
//     );

//     if (!mounted) return;
//     setState(() => _isSubmitting = false);

//     result.fold(
//       (err) => ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(err), backgroundColor: Colors.red)),
//       (msg) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(msg), backgroundColor: Colors.green));
//         Navigator.pop(context, true);
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF0F9FF),
//       appBar: AppBar(
//         title: const Text('Input Stok Manual'),
//         backgroundColor: AppColors.primary,
//         foregroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: BlocBuilder<StockManualInBloc, StockManualInState>(
//         builder: (context, state) {
//           return state.when(
//             initial: () => const SizedBox.shrink(),
//             loading: () => const Center(child: CircularProgressIndicator()),
//             error: (msg) => Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Text(msg, textAlign: TextAlign.center),
//               ),
//             ),
//             loaded: (products, warehouses) => Form(
//               key: _formKey,
//               child: ListView(
//                 padding: const EdgeInsets.all(20),
//                 children: [
//                   const Text('Gudang', style: TextStyle(fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 8),
//                   DropdownButtonFormField<int>(
//                     value: _selectedWarehouseId,
//                     decoration: const InputDecoration(
//                         border: OutlineInputBorder(), hintText: 'Pilih gudang'),
//                     items: warehouses
//                         .map((w) => DropdownMenuItem(value: w.id, child: Text(w.name)))
//                         .toList(),
//                     onChanged: (v) => setState(() => _selectedWarehouseId = v),
//                     validator: (v) => v == null ? 'Pilih gudang terlebih dahulu' : null,
//                   ),
//                   const SizedBox(height: 20),

//                   const Text('Produk', style: TextStyle(fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 8),
//                   DropdownButtonFormField<int>(
//                     value: _selectedProductId,
//                     decoration: const InputDecoration(
//                         border: OutlineInputBorder(), hintText: 'Pilih produk'),
//                     items: products
//                         .map((p) => DropdownMenuItem(value: p.id, child: Text(p.name)))
//                         .toList(),
//                     onChanged: (v) => setState(() => _selectedProductId = v),
//                     validator: (v) => v == null ? 'Pilih produk terlebih dahulu' : null,
//                   ),
//                   const SizedBox(height: 20),

//                   const Text('Jumlah', style: TextStyle(fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _qtyController,
//                     keyboardType: TextInputType.number,
//                     decoration: const InputDecoration(
//                         border: OutlineInputBorder(), hintText: 'Contoh: 50'),
//                     validator: (v) {
//                       final n = int.tryParse(v ?? '');
//                       if (n == null || n <= 0) return 'Masukkan jumlah yang valid';
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 20),

//                   const Text('Catatan (opsional)', style: TextStyle(fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 8),
//                   TextFormField(
//                     controller: _noteController,
//                     maxLines: 2,
//                     decoration: const InputDecoration(
//                         border: OutlineInputBorder(),
//                         hintText: 'Misal: Stok awal produk baru'),
//                   ),
//                   const SizedBox(height: 28),

//                   ElevatedButton(
//                     onPressed: _isSubmitting ? null : _submit,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primary,
//                       foregroundColor: Colors.white,
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                     ),
//                     child: _isSubmitting
//                         ? const SizedBox(
//                             height: 20, width: 20,
//                             child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
//                         : const Text('Simpan Stok'),
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