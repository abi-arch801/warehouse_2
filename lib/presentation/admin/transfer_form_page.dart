// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:warehouse/presentation/admin/app_theme.dart';
// import 'package:warehouse/data/model/response/admin/admin_warehouse_model.dart';
// import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';
// import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
// import 'package:warehouse/presentation/bloc/admin/transfer/transfer_bloc.dart';

// class TransferFormPage extends StatefulWidget {
//   const TransferFormPage({super.key});

//   @override
//   State<TransferFormPage> createState() => _TransferFormPageState();
// }

// class _TransferItemDraft {
//   int? productId;
//   String productName = '';
//   final qtyCtrl = TextEditingController(text: '1');
//   final noteCtrl = TextEditingController();

//   void dispose() {
//     qtyCtrl.dispose();
//     noteCtrl.dispose();
//   }
// }

// class _TransferFormPageState extends State<TransferFormPage> {
//   int? _fromWarehouseId;
//   int? _toWarehouseId;
//   final _notesCtrl = TextEditingController();
//   final List<_TransferItemDraft> _items = [_TransferItemDraft()];

//   @override
//   void initState() {
//     super.initState();
//     context.read<AdminWarehouseBloc>().add(const AdminWarehouseEvent.load());
//     context.read<AdminProductBloc>().add(const AdminProductEvent.load());
//   }

//   @override
//   void dispose() {
//     _notesCtrl.dispose();
//     for (final i in _items) {
//       i.dispose();
//     }
//     super.dispose();
//   }

//   SnackBar _snack(String msg, Color c) => SnackBar(
//         content: Text(msg),
//         backgroundColor: c,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       );

//   void _addItem() {
//     setState(() => _items.add(_TransferItemDraft()));
//   }

//   void _removeItem(int index) {
//     if (_items.length <= 1) return;
//     setState(() {
//       _items[index].dispose();
//       _items.removeAt(index);
//     });
//   }

//   bool _validate() {
//      // DEBUG — hapus setelah fix
//   debugPrint('=== VALIDATE ===');
//   debugPrint('fromWarehouseId: $_fromWarehouseId');
//   debugPrint('toWarehouseId: $_toWarehouseId');
//   for (int i = 0; i < _items.length; i++) {
//     debugPrint('item[$i] productId: ${_items[i].productId}');
//     debugPrint('item[$i] qty: ${_items[i].qtyCtrl.text}');
//   }

//   if (_fromWarehouseId == null || _toWarehouseId == null) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(_snack('Pilih gudang asal & tujuan', AppColors.danger));
//     return false;
//   }
//     if (_fromWarehouseId == _toWarehouseId) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           _snack('Gudang asal & tujuan tidak boleh sama', AppColors.danger));
//       return false;
//     }
//     for (final item in _items) {
//       if (item.productId == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             _snack('Pilih produk untuk semua item', AppColors.danger));
//         return false;
//       }
//       final qty = int.tryParse(item.qtyCtrl.text.trim()) ?? 0;
//       if (qty <= 0) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             _snack('Jumlah item harus lebih dari 0', AppColors.danger));
//         return false;
//       }
//     }
//     return true;
//   }

// void _submit() {
//   if (!_validate()) return;

//   final body = <String, dynamic>{
//     'from_warehouse_id': _fromWarehouseId,
//     'to_warehouse_id': _toWarehouseId,
//     'transfer_date': DateTime.now().toIso8601String().substring(0, 10), // ← tambah ini
//     if (_notesCtrl.text.trim().isNotEmpty) 'notes': _notesCtrl.text.trim(),
//     'items': _items
//         .map((i) => {
//               'product_id': i.productId,
//               'quantity_requested': int.tryParse(i.qtyCtrl.text.trim()) ?? 0, // ← ganti dari quantity_sent
//               if (i.noteCtrl.text.trim().isNotEmpty) 'note': i.noteCtrl.text.trim(),
//             })
//         .toList(),
//   };

//   context.read<TransferBloc>().add(TransferEvent.store(body));
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bg,
//       appBar: AppBar(
//         title: const Text('Transfer Baru'),
//         backgroundColor: AppColors.surface,
//       ),
//       body: BlocConsumer<TransferBloc, TransferState>(
//         listener: (ctx, state) => state.maybeWhen(
//           actionSuccess: (msg, _) {
//             ScaffoldMessenger.of(ctx)
//                 .showSnackBar(_snack(msg, AppColors.success));
//             Navigator.pop(ctx, true);
//           },
//           error: (msg) => ScaffoldMessenger.of(ctx)
//               .showSnackBar(_snack(msg, AppColors.danger)),
//           orElse: () {},
//         ),
//         builder: (ctx, state) {
//           final isLoading = state.maybeWhen(
//             actionLoading: () => true,
//             orElse: () => false,
//           );

//           return Stack(
//             children: [
//               ListView(
//                 padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
//                 children: [
//                   Text('Gudang Asal & Tujuan',
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w700, fontSize: 14)),
//                   const SizedBox(height: 10),
//                   _WarehouseDropdown(
//                     label: 'Dari Gudang *',
//                     value: _fromWarehouseId,
//                     onChanged: (v) => setState(() => _fromWarehouseId = v),
//                   ),
//                   const SizedBox(height: 10),
//                   _WarehouseDropdown(
//                     label: 'Ke Gudang *',
//                     value: _toWarehouseId,
//                     onChanged: (v) => setState(() => _toWarehouseId = v),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       const Expanded(
//                         child: Text('Item Transfer',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700, fontSize: 14)),
//                       ),
//                       TextButton.icon(
//                         onPressed: _addItem,
//                         icon: const Icon(Icons.add_rounded, size: 18),
//                         label: const Text('Tambah Item'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   ...List.generate(_items.length, (i) {
//                     final item = _items[i];
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: AppColors.surface,
//                         border: Border.all(color: AppColors.border),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text('Item ${i + 1}',
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.w700,
//                                       fontSize: 12.5)),
//                               const Spacer(),
//                               if (_items.length > 1)
//                                 IconButton(
//                                   onPressed: () => _removeItem(i),
//                                   icon: const Icon(Icons.close_rounded,
//                                       color: AppColors.danger, size: 18),
//                                   visualDensity: VisualDensity.compact,
//                                 ),
//                             ],
//                           ),
//                           const SizedBox(height: 6),
//                           _ProductDropdown(
//                             value: item.productId,
//                             onChanged: (id, name) => setState(() {
//                               item.productId = id;
//                               item.productName = name;
//                             }),
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: TextField(
//                                   controller: item.qtyCtrl,
//                                   keyboardType: TextInputType.number,
//                                   decoration: const InputDecoration(
//                                       labelText: 'Jumlah *'),
//                                 ),
//                               ),
//                               const SizedBox(width: 10),
//                               Expanded(
//                                 flex: 2,
//                                 child: TextField(
//                                   controller: item.noteCtrl,
//                                   decoration: const InputDecoration(
//                                       labelText: 'Catatan item (opsional)'),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: _notesCtrl,
//                     maxLines: 2,
//                     decoration: const InputDecoration(
//                         labelText: 'Catatan Transfer (opsional)'),
//                   ),
//                 ],
//               ),
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 bottom: 0,
//                 child: Container(
//                   padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
//                   decoration: BoxDecoration(
//                     color: AppColors.surface,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withValues(alpha: 0.06),
//                         blurRadius: 12,
//                         offset: const Offset(0, -2),
//                       ),
//                     ],
//                   ),
//                   child: SafeArea(
//                     top: false,
//                     child: ElevatedButton(
//                       onPressed: isLoading
//                           ? null
//                           : () {
//                               HapticFeedback.lightImpact();
//                               _submit();
//                             },
//                       child: isLoading
//                           ? const SizedBox(
//                               width: 20,
//                               height: 20,
//                               child: CircularProgressIndicator(
//                                   strokeWidth: 2, color: Colors.white),
//                             )
//                           : const Text('Buat Transfer'),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// // ── Warehouse dropdown ──────────────────────────────────────────────────
// class _WarehouseDropdown extends StatelessWidget {
//   final String label;
//   final int? value;
//   final ValueChanged<int?> onChanged;

//   const _WarehouseDropdown({
//     required this.label,
//     required this.value,
//     required this.onChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AdminWarehouseBloc, AdminWarehouseState>(
//       builder: (ctx, state) {
//         final warehouses = state.maybeWhen(
//           listLoaded: (result) => result.data,
//           orElse: () => const [],
//         );

//         return DropdownButtonFormField<int>(
//           value: value,
//           decoration: InputDecoration(labelText: label),
//           items: warehouses
//               .map<DropdownMenuItem<int>>((w) => DropdownMenuItem<int>(
//                     value: w.id,
//                     child: Text(
//                       w.name,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ))
//               .toList(),
//           onChanged: onChanged,
//         );
//       },
//     );
//   }
// }

// // ── Product dropdown ─────────────────────────────────────────────────────
// class _ProductDropdown extends StatelessWidget {
//   final int? value;
//   final void Function(int? id, String name) onChanged;

//   const _ProductDropdown({required this.value, required this.onChanged});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AdminProductBloc, AdminProductState>(
//       builder: (ctx, state) {
//         final products = state.maybeWhen(
//           loaded: (items, totalItems, hasMore) => items,
//           orElse: () => const <dynamic>[],
//         );

//         return DropdownButtonFormField<int>(
//           value: value,
//           decoration: const InputDecoration(labelText: 'Produk *'),
//           isExpanded: true,
//           items: products.map<DropdownMenuItem<int>>((p) {
//             final m = p as Map<String, dynamic>;
//             final id = (m['id'] as num).toInt();
//             final name = (m['name'] ?? '').toString();
//             return DropdownMenuItem<int>(
//               value: id,
//               child: Text(name, overflow: TextOverflow.ellipsis),
//             );
//           }).toList(),
//           onChanged: (id) {
//             final match = products.cast<Map<String, dynamic>>().firstWhere(
//                   (p) => (p['id'] as num).toInt() == id,
//                   orElse: () => products.first as Map<String, dynamic>,
//                 );
//             onChanged(id, (match['name'] ?? '').toString());
//           },
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/transfer/transfer_bloc.dart';

class TransferFormPage extends StatefulWidget {
  const TransferFormPage({super.key});

  @override
  State<TransferFormPage> createState() => _TransferFormPageState();
}

class _TransferItemDraft {
  int? productId;
  String productName = '';
  final qtyCtrl = TextEditingController(text: '1');
  final noteCtrl = TextEditingController();

  void dispose() {
    qtyCtrl.dispose();
    noteCtrl.dispose();
  }
}

class _TransferFormPageState extends State<TransferFormPage> {
  int? _fromWarehouseId;
  int? _toWarehouseId;
  final _notesCtrl = TextEditingController();
  final List<_TransferItemDraft> _items = [_TransferItemDraft()];

  @override
  void dispose() {
    _notesCtrl.dispose();
    for (final i in _items) {
      i.dispose();
    }
    super.dispose();
  }

  SnackBar _snack(String msg, Color c) => SnackBar(
        content: Text(msg),
        backgroundColor: c,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      );

  void _addItem() => setState(() => _items.add(_TransferItemDraft()));

  void _removeItem(int index) {
    if (_items.length <= 1) return;
    setState(() {
      _items[index].dispose();
      _items.removeAt(index);
    });
  }

  bool _validate() {
    if (_fromWarehouseId == null || _toWarehouseId == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(_snack('Pilih gudang asal & tujuan', AppColors.danger));
      return false;
    }
    if (_fromWarehouseId == _toWarehouseId) {
      ScaffoldMessenger.of(context).showSnackBar(
          _snack('Gudang asal & tujuan tidak boleh sama', AppColors.danger));
      return false;
    }
    // Cek duplikat produk dalam satu transfer
    final productIds = _items.map((i) => i.productId).toList();
    if (productIds.toSet().length != productIds.length) {
      ScaffoldMessenger.of(context).showSnackBar(_snack(
          'Tidak boleh ada produk yang sama dua kali', AppColors.danger));
      return false;
    }
    for (final item in _items) {
      if (item.productId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            _snack('Pilih produk untuk semua item', AppColors.danger));
        return false;
      }
      final qty = int.tryParse(item.qtyCtrl.text.trim()) ?? 0;
      if (qty <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
            _snack('Jumlah item harus lebih dari 0', AppColors.danger));
        return false;
      }
    }
    return true;
  }

  void _submit() {
    if (!_validate()) return;

    final body = <String, dynamic>{
      'from_warehouse_id': _fromWarehouseId,
      'to_warehouse_id': _toWarehouseId,
      // transfer_date WAJIB — Laravel validasi "required|date"
      'transfer_date': DateTime.now().toIso8601String().substring(0, 10),
      if (_notesCtrl.text.trim().isNotEmpty) 'notes': _notesCtrl.text.trim(),
      'items': _items
          .map((i) => {
                'product_id': i.productId,
                // quantity_requested — sesuai kolom DB & validasi Laravel
                'quantity_requested': int.tryParse(i.qtyCtrl.text.trim()) ?? 0,
                if (i.noteCtrl.text.trim().isNotEmpty)
                  'note': i.noteCtrl.text.trim(),
              })
          .toList(),
    };

    context.read<TransferBloc>().add(TransferEvent.store(body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Transfer Baru'),
        backgroundColor: AppColors.surface,
      ),
      body: BlocConsumer<TransferBloc, TransferState>(
        listener: (ctx, state) => state.maybeWhen(
          actionSuccess: (msg, _) {
            ScaffoldMessenger.of(ctx)
                .showSnackBar(_snack(msg, AppColors.success));
            Navigator.pop(ctx, true);
          },
          error: (msg) => ScaffoldMessenger.of(ctx)
              .showSnackBar(_snack(msg, AppColors.danger)),
          orElse: () {},
        ),
        builder: (ctx, state) {
          final isLoading = state.maybeWhen(
            actionLoading: () => true,
            orElse: () => false,
          );

          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
                children: [
                  const Text('Gudang Asal & Tujuan',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
                  const SizedBox(height: 10),
                  _WarehouseDropdown(
                    label: 'Dari Gudang *',
                    value: _fromWarehouseId,
                    onChanged: (v) => setState(() => _fromWarehouseId = v),
                  ),
                  const SizedBox(height: 10),
                  _WarehouseDropdown(
                    label: 'Ke Gudang *',
                    value: _toWarehouseId,
                    onChanged: (v) => setState(() => _toWarehouseId = v),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Expanded(
                        child: Text('Item Transfer',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14)),
                      ),
                      TextButton.icon(
                        onPressed: _addItem,
                        icon: const Icon(Icons.add_rounded, size: 18),
                        label: const Text('Tambah Item'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ...List.generate(_items.length, (i) {
                    final item = _items[i];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Item ${i + 1}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.5)),
                              const Spacer(),
                              if (_items.length > 1)
                                IconButton(
                                  onPressed: () => _removeItem(i),
                                  icon: const Icon(Icons.close_rounded,
                                      color: AppColors.danger, size: 18),
                                  visualDensity: VisualDensity.compact,
                                ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          _ProductDropdown(
                            value: item.productId,
                            onChanged: (id, name) => setState(() {
                              item.productId = id;
                              item.productName = name;
                            }),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: item.qtyCtrl,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      labelText: 'Jumlah *'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                flex: 2,
                                child: TextField(
                                  controller: item.noteCtrl,
                                  decoration: const InputDecoration(
                                      labelText: 'Catatan (opsional)'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _notesCtrl,
                    maxLines: 2,
                    decoration: const InputDecoration(
                        labelText: 'Catatan Transfer (opsional)'),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 12,
                        offset: const Offset(0, -2),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    top: false,
                    child: ElevatedButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              HapticFeedback.lightImpact();
                              _submit();
                            },
                      child: isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white),
                            )
                          : const Text('Buat Transfer'),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ── Warehouse dropdown ──────────────────────────────────────────────────────
class _WarehouseDropdown extends StatelessWidget {
  final String label;
  final int? value;
  final ValueChanged<int?> onChanged;

  const _WarehouseDropdown({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminWarehouseBloc, AdminWarehouseState>(
      builder: (ctx, state) {
        final warehouses = state.maybeWhen(
          listLoaded: (result) => result.data,
          orElse: () => const [],
        );
        return DropdownButtonFormField<int>(
          value: value,
          decoration: InputDecoration(labelText: label),
          items: warehouses
              .map<DropdownMenuItem<int>>((w) => DropdownMenuItem<int>(
                    value: w.id,
                    child: Text(w.name, overflow: TextOverflow.ellipsis),
                  ))
              .toList(),
          onChanged: onChanged,
        );
      },
    );
  }
}

// ── Product dropdown ────────────────────────────────────────────────────────
class _ProductDropdown extends StatelessWidget {
  final int? value;
  final void Function(int? id, String name) onChanged;

  const _ProductDropdown({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminProductBloc, AdminProductState>(
      builder: (ctx, state) {
        final products = state.maybeWhen(
          loaded: (items, totalItems, hasMore) => items,
          orElse: () => const <dynamic>[],
        );
        return DropdownButtonFormField<int>(
          value: value,
          decoration: const InputDecoration(labelText: 'Produk *'),
          isExpanded: true,
          items: products.map<DropdownMenuItem<int>>((p) {
            final m = p as Map<String, dynamic>;
            final id = (m['id'] as num).toInt();
            final name = (m['name'] ?? '').toString();
            return DropdownMenuItem<int>(
              value: id,
              child: Text(name, overflow: TextOverflow.ellipsis),
            );
          }).toList(),
          onChanged: (id) {
            final match = products.cast<Map<String, dynamic>>().firstWhere(
                  (p) => (p['id'] as num).toInt() == id,
                  orElse: () => products.first as Map<String, dynamic>,
                );
            onChanged(id, (match['name'] ?? '').toString());
          },
        );
      },
    );
  }
}
