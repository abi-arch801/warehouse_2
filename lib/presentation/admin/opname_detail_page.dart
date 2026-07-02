// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:intl/intl.dart';
// // import 'package:warehouse/presentation/bloc/admin/opname/opname_bloc.dart';

// // class OpnameDetailPage extends StatefulWidget {
// //   final int opnameId;
// //   const OpnameDetailPage({super.key, required this.opnameId});

// //   @override
// //   State<OpnameDetailPage> createState() => _OpnameDetailPageState();
// // }

// // class _OpnameDetailPageState extends State<OpnameDetailPage> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     context.read<OpnameBloc>().add(GetOpnameDetail(id: widget.opnameId));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5F6FA),
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         title: const Text('Detail Opname', style: TextStyle(color: Color(0xFF1A1D1E), fontWeight: FontWeight.w700, fontSize: 18)),
// //         iconTheme: const IconThemeData(color: Color(0xFF1A1D1E)),
// //         actions: [
// //           BlocBuilder<OpnameBloc, OpnameState>(
// //             builder: (context, state) {
// //               if (state is OpnameDetailLoaded && state.opname.status == 'draft') {
// //                 return PopupMenuButton<String>(
// //                   onSelected: (v) => _handleMenu(v, state),
// //                   itemBuilder: (_) => [
// //                     const PopupMenuItem(value: 'edit', child: Row(children: [Icon(Icons.edit_outlined, size: 18), SizedBox(width: 8), Text('Edit')])),
// //                     const PopupMenuItem(value: 'start', child: Row(children: [Icon(Icons.play_arrow_outlined, size: 18), SizedBox(width: 8), Text('Mulai Opname')])),
// //                     const PopupMenuItem(value: 'delete', child: Row(children: [Icon(Icons.delete_outline, size: 18, color: Color(0xFFDC3545)), SizedBox(width: 8), Text('Hapus', style: TextStyle(color: Color(0xFFDC3545)))])),
// //                   ],
// //                 );
// //               }
// //               if (state is OpnameDetailLoaded && state.opname.status == 'in_progress') {
// //                 return Padding(
// //                   padding: const EdgeInsets.only(right: 8),
// //                   child: TextButton(
// //                     onPressed: () => _confirmFinish(state),
// //                     child: const Text('Selesaikan', style: TextStyle(color: Color(0xFF6C63FF), fontWeight: FontWeight.w700)),
// //                   ),
// //                 );
// //               }
// //               return const SizedBox();
// //             },
// //           ),
// //         ],
// //       ),
// //       body: BlocConsumer<OpnameBloc, OpnameState>(
// //         listener: (context, state) {
// //           if (state is OpnameActionSuccess) {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               SnackBar(content: Text(state.message), backgroundColor: const Color(0xFF0E9B6A), behavior: SnackBarBehavior.floating),
// //             );
// //             if (state.message.toLowerCase().contains('hapus')) {
// //               Navigator.pop(context, true);
// //             } else {
// //               context.read<OpnameBloc>().add(GetOpnameDetail(id: widget.opnameId));
// //             }
// //           }
// //         },
// //         builder: (context, state) {
// //           if (state is OpnameLoading) return const Center(child: CircularProgressIndicator(color: Color(0xFF6C63FF)));
// //           if (state is OpnameError) return _buildError(state.message);
// //           if (state is OpnameDetailLoaded) {
// //             final o = state.opname;
// //             return RefreshIndicator(
// //               color: const Color(0xFF6C63FF),
// //               onRefresh: () async => context.read<OpnameBloc>().add(GetOpnameDetail(id: widget.opnameId)),
// //               child: SingleChildScrollView(
// //                 physics: const AlwaysScrollableScrollPhysics(),
// //                 padding: const EdgeInsets.all(16),
// //                 child: Column(
// //                   children: [
// //                     _buildHeaderCard(o),
// //                     const SizedBox(height: 12),
// //                     _buildStatsRow(o),
// //                     const SizedBox(height: 12),
// //                     _buildItemsSection(o),
// //                     const SizedBox(height: 24),
// //                   ],
// //                 ),
// //               ),
// //             );
// //           }
// //           return const SizedBox();
// //         },
// //       ),
// //     );
// //   }

// //   Widget _buildHeaderCard(dynamic o) {
// //     return Container(
// //       width: double.infinity,
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(14),
// //         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             children: [
// //               Container(
// //                 padding: const EdgeInsets.all(10),
// //                 decoration: BoxDecoration(color: const Color(0xFF6C63FF).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
// //                 child: const Icon(Icons.inventory_2_outlined, color: Color(0xFF6C63FF), size: 24),
// //               ),
// //               const SizedBox(width: 12),
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(o.referenceNumber ?? 'OPN-${o.id}', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Color(0xFF1A1D1E))),
// //                     Text(o.warehouseName ?? '-', style: const TextStyle(color: Color(0xFF6C757D), fontSize: 13)),
// //                   ],
// //                 ),
// //               ),
// //               _StatusBadge(status: o.status ?? 'draft'),
// //             ],
// //           ),
// //           const SizedBox(height: 16),
// //           const Divider(height: 1, color: Color(0xFFF0F0F0)),
// //           const SizedBox(height: 12),
// //           _DetailRow(icon: Icons.calendar_today_outlined, label: 'Dibuat', value: _formatDate(o.createdAt)),
// //           if (o.scheduledDate != null) ...[
// //             const SizedBox(height: 8),
// //             _DetailRow(icon: Icons.event_outlined, label: 'Dijadwalkan', value: _formatDate(o.scheduledDate)),
// //           ],
// //           if (o.completedAt != null) ...[
// //             const SizedBox(height: 8),
// //             _DetailRow(icon: Icons.check_circle_outline, label: 'Selesai', value: _formatDate(o.completedAt)),
// //           ],
// //           if (o.notes != null && o.notes!.isNotEmpty) ...[
// //             const SizedBox(height: 8),
// //             _DetailRow(icon: Icons.notes_outlined, label: 'Catatan', value: o.notes!),
// //           ],
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildStatsRow(dynamic o) {
// //     return Row(
// //       children: [
// //         Expanded(child: _StatCard(label: 'Total Item', value: '${o.itemsCount ?? 0}', color: const Color(0xFF6C63FF), icon: Icons.list_alt_outlined)),
// //         const SizedBox(width: 10),
// //         Expanded(child: _StatCard(label: 'Sudah Dihitung', value: '${o.countedItems ?? 0}', color: const Color(0xFF0E9B6A), icon: Icons.check_circle_outline)),
// //         const SizedBox(width: 10),
// //         Expanded(child: _StatCard(label: 'Selisih', value: '${o.discrepancyItems ?? 0}', color: const Color(0xFFDC3545), icon: Icons.warning_amber_outlined)),
// //       ],
// //     );
// //   }

// //   Widget _buildItemsSection(dynamic o) {
// //     final items = o.items ?? [];
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(14),
// //         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(16),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 const Text('Daftar Item', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: Color(0xFF1A1D1E))),
// //                 if (o.status == 'in_progress')
// //                   TextButton.icon(
// //                     onPressed: () {},
// //                     icon: const Icon(Icons.add, size: 16, color: Color(0xFF6C63FF)),
// //                     label: const Text('Tambah Item', style: TextStyle(color: Color(0xFF6C63FF), fontSize: 13)),
// //                   ),
// //               ],
// //             ),
// //           ),
// //           const Divider(height: 1, color: Color(0xFFF0F0F0)),
// //           if (items.isEmpty)
// //             Padding(
// //               padding: const EdgeInsets.all(32),
// //               child: Center(
// //                 child: Column(
// //                   children: const [
// //                     Icon(Icons.inventory_2_outlined, size: 36, color: Color(0xFFADB5BD)),
// //                     SizedBox(height: 8),
// //                     Text('Belum ada item', style: TextStyle(color: Color(0xFF6C757D))),
// //                   ],
// //                 ),
// //               ),
// //             )
// //           else
// //             ...items.map<Widget>((item) => _OpnameItemTile(item: item, status: o.status)).toList(),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildError(String msg) => Center(
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             const Icon(Icons.error_outline, color: Color(0xFFDC3545), size: 48),
// //             const SizedBox(height: 12),
// //             Text(msg, style: const TextStyle(color: Color(0xFF6C757D))),
// //           ],
// //         ),
// //       );

// //   String _formatDate(String? dt) {
// //     if (dt == null) return '-';
// //     try {
// //       return DateFormat('dd MMM yyyy').format(DateTime.parse(dt));
// //     } catch (_) {
// //       return dt;
// //     }
// //   }

// //   void _handleMenu(String value, OpnameDetailLoaded state) {
// //     switch (value) {
// //       case 'edit':
// //         Navigator.push(context, MaterialPageRoute(builder: (_) => OpnameFormPage(opnameId: widget.opnameId)));
// //         break;
// //       case 'start':
// //         context.read<OpnameBloc>().add(StartOpname(id: widget.opnameId));
// //         break;
// //       case 'delete':
// //         _confirmDelete();
// //         break;
// //     }
// //   }

// //   void _confirmDelete() {
// //     showDialog(
// //       context: context,
// //       builder: (_) => AlertDialog(
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
// //         title: const Text('Hapus Opname?', style: TextStyle(fontWeight: FontWeight.w700)),
// //         content: const Text('Opname ini akan dihapus permanen. Tindakan ini tidak dapat dibatalkan.'),
// //         actions: [
// //           TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
// //           ElevatedButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //               context.read<OpnameBloc>().add(DeleteOpname(id: widget.opnameId));
// //             },
// //             style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFDC3545), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
// //             child: const Text('Hapus', style: TextStyle(color: Colors.white)),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _confirmFinish(OpnameDetailLoaded state) {
// //     showDialog(
// //       context: context,
// //       builder: (_) => AlertDialog(
// //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
// //         title: const Text('Selesaikan Opname?', style: TextStyle(fontWeight: FontWeight.w700)),
// //         content: const Text('Pastikan semua item sudah dihitung. Opname yang sudah selesai tidak dapat diubah.'),
// //         actions: [
// //           TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
// //           ElevatedButton(
// //             onPressed: () {
// //               Navigator.pop(context);
// //               context.read<OpnameBloc>().add(CompleteOpname(id: widget.opnameId));
// //             },
// //             style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6C63FF), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
// //             child: const Text('Selesaikan', style: TextStyle(color: Colors.white)),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _OpnameItemTile extends StatefulWidget {
// //   final dynamic item;
// //   final String? status;
// //   const _OpnameItemTile({required this.item, this.status});

// //   @override
// //   State<_OpnameItemTile> createState() => _OpnameItemTileState();
// // }

// // class _OpnameItemTileState extends State<_OpnameItemTile> {
// //   late TextEditingController _ctrl;
// //   bool _editing = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _ctrl = TextEditingController(text: '${widget.item.actualQty ?? ''}');
// //   }

// //   @override
// //   void dispose() {
// //     _ctrl.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final diff = (widget.item.actualQty ?? 0) - (widget.item.systemQty ?? 0);
// //     final hasDiff = diff != 0 && widget.item.actualQty != null;

// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //       decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFF0F0F0)))),
// //       child: Row(
// //         children: [
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(widget.item.productName ?? '-', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF1A1D1E))),
// //                 const SizedBox(height: 2),
// //                 Text('Sistem: ${widget.item.systemQty ?? 0} unit', style: const TextStyle(color: Color(0xFF6C757D), fontSize: 12)),
// //                 if (hasDiff)
// //                   Text(
// //                     'Selisih: ${diff > 0 ? '+' : ''}$diff',
// //                     style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: diff > 0 ? const Color(0xFF0E9B6A) : const Color(0xFFDC3545)),
// //                   ),
// //               ],
// //             ),
// //           ),
// //           if (widget.status == 'in_progress') ...[
// //             if (_editing)
// //               SizedBox(
// //                 width: 80,
// //                 child: TextField(
// //                   controller: _ctrl,
// //                   keyboardType: TextInputType.number,
// //                   textAlign: TextAlign.center,
// //                   autofocus: true,
// //                   decoration: InputDecoration(
// //                     isDense: true,
// //                     contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
// //                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF6C63FF))),
// //                     focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFF6C63FF), width: 1.5)),
// //                   ),
// //                   onSubmitted: (v) {
// //                     setState(() => _editing = false);
// //                     // TODO: dispatch update item qty event
// //                   },
// //                 ),
// //               )
// //             else
// //               GestureDetector(
// //                 onTap: () => setState(() => _editing = true),
// //                 child: Container(
// //                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //                   decoration: BoxDecoration(
// //                     color: widget.item.actualQty != null ? const Color(0xFF6C63FF).withOpacity(0.08) : const Color(0xFFF5F6FA),
// //                     borderRadius: BorderRadius.circular(8),
// //                     border: Border.all(color: const Color(0xFFDEE2E6)),
// //                   ),
// //                   child: Text(
// //                     widget.item.actualQty != null ? '${widget.item.actualQty}' : 'Isi',
// //                     style: TextStyle(
// //                       fontWeight: FontWeight.w600,
// //                       color: widget.item.actualQty != null ? const Color(0xFF6C63FF) : const Color(0xFFADB5BD),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //           ] else
// //             Container(
// //               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //               decoration: BoxDecoration(
// //                 color: widget.item.actualQty != null ? const Color(0xFF6C63FF).withOpacity(0.08) : const Color(0xFFF5F6FA),
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               child: Text(
// //                 widget.item.actualQty != null ? '${widget.item.actualQty}' : '-',
// //                 style: TextStyle(fontWeight: FontWeight.w600, color: widget.item.actualQty != null ? const Color(0xFF6C63FF) : const Color(0xFFADB5BD)),
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _StatCard extends StatelessWidget {
// //   final String label;
// //   final String value;
// //   final Color color;
// //   final IconData icon;
// //   const _StatCard({required this.label, required this.value, required this.color, required this.icon});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       padding: const EdgeInsets.all(12),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6, offset: const Offset(0, 2))],
// //       ),
// //       child: Column(
// //         children: [
// //           Icon(icon, color: color, size: 22),
// //           const SizedBox(height: 6),
// //           Text(value, style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: color)),
// //           const SizedBox(height: 2),
// //           Text(label, style: const TextStyle(color: Color(0xFF6C757D), fontSize: 11), textAlign: TextAlign.center),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _DetailRow extends StatelessWidget {
// //   final IconData icon;
// //   final String label;
// //   final String value;
// //   const _DetailRow({required this.icon, required this.label, required this.value});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Icon(icon, size: 15, color: const Color(0xFFADB5BD)),
// //         const SizedBox(width: 8),
// //         SizedBox(width: 90, child: Text(label, style: const TextStyle(color: Color(0xFF6C757D), fontSize: 13))),
// //         Expanded(child: Text(value, style: const TextStyle(color: Color(0xFF1A1D1E), fontSize: 13, fontWeight: FontWeight.w500))),
// //       ],
// //     );
// //   }
// // }

// // class _StatusBadge extends StatelessWidget {
// //   final String status;
// //   const _StatusBadge({required this.status});

// //   @override
// //   Widget build(BuildContext context) {
// //     final cfg = _cfg();
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
// //       decoration: BoxDecoration(color: cfg['bg'], borderRadius: BorderRadius.circular(20)),
// //       child: Text(cfg['label']!, style: TextStyle(color: cfg['color'], fontSize: 11, fontWeight: FontWeight.w600)),
// //     );
// //   }

// //   Map<String, dynamic> _cfg() {
// //     switch (status) {
// //       case 'draft': return {'bg': const Color(0xFFF8F9FA), 'color': const Color(0xFF6C757D), 'label': 'Draft'};
// //       case 'in_progress': return {'bg': const Color(0xFFFFF3CD), 'color': const Color(0xFFE6A817), 'label': 'In Progress'};
// //       case 'completed': return {'bg': const Color(0xFFD1F2EB), 'color': const Color(0xFF0E9B6A), 'label': 'Selesai'};
// //       default: return {'bg': const Color(0xFFF8F9FA), 'color': const Color(0xFF6C757D), 'label': status};
// //     }
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:warehouse/data/model/response/stock_response_model.dart';
// import 'package:warehouse/presentation/bloc/admin/opname/opname_bloc.dart';

// class OpnameDetailPage extends StatefulWidget {
//   final int opnameId;
//   const OpnameDetailPage({super.key, required this.opnameId});

//   @override
//   State<OpnameDetailPage> createState() => _OpnameDetailPageState();
// }

// class _OpnameDetailPageState extends State<OpnameDetailPage> {
//   // ✅ FIX: _editedStocks di State, bukan di StatefulWidget
//   final Map<int, int> _editedStocks = {};

//   @override
//   void initState() {
//     super.initState();
//     context.read<OpnameBloc>().add(OpnameEvent.loadDetail(widget.opnameId));
//   }

//   void _reload() =>
//       context.read<OpnameBloc>().add(OpnameEvent.loadDetail(widget.opnameId));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F6FA),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'Detail Opname',
//           style: TextStyle(
//               color: Color(0xFF1A1D1E),
//               fontWeight: FontWeight.w700,
//               fontSize: 18),
//         ),
//         iconTheme: const IconThemeData(color: Color(0xFF1A1D1E)),
//         actions: [
//           BlocBuilder<OpnameBloc, OpnameState>(
//             builder: (context, state) {
//               return state.maybeWhen(
//                 detailLoaded: (result) {
//                   final o = result.data;
//                   if (o == null) return const SizedBox();
//                   if (o.status == 'draft') {
//                     return PopupMenuButton<String>(
//                       onSelected: (v) => _handleMenu(v, o),
//                       itemBuilder: (_) => [
//                         const PopupMenuItem(
//                             value: 'start',
//                             child: Row(children: [
//                               Icon(Icons.play_arrow_outlined, size: 18),
//                               SizedBox(width: 8),
//                               Text('Mulai Opname')
//                             ])),
//                         const PopupMenuItem(
//                             value: 'delete',
//                             child: Row(children: [
//                               Icon(Icons.delete_outline,
//                                   size: 18, color: Color(0xFFDC3545)),
//                               SizedBox(width: 8),
//                               Text('Hapus',
//                                   style: TextStyle(color: Color(0xFFDC3545)))
//                             ])),
//                       ],
//                     );
//                   }
//                   if (o.status == 'in_progress') {
//                     return Padding(
//                       padding: const EdgeInsets.only(right: 8),
//                       child: TextButton(
//                         onPressed: () => _confirmFinish(o),
//                         child: const Text('Selesaikan',
//                             style: TextStyle(
//                                 color: Color(0xFF6C63FF),
//                                 fontWeight: FontWeight.w700)),
//                       ),
//                     );
//                   }
//                   return const SizedBox();
//                 },
//                 orElse: () => const SizedBox(),
//               );
//             },
//           ),
//         ],
//       ),
//       body: BlocConsumer<OpnameBloc, OpnameState>(
//         listener: (context, state) {
//           state.maybeWhen(
//             actionSuccess: (message, data) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(message),
//                   backgroundColor: const Color(0xFF0E9B6A),
//                   behavior: SnackBarBehavior.floating,
//                 ),
//               );
//               if (message.toLowerCase().contains('hapus')) {
//                 Navigator.pop(context, true);
//               } else {
//                 // ✅ Reset edited stocks saat reload
//                 _editedStocks.clear();
//                 _reload();
//               }
//             },
//             error: (msg) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(msg),
//                   backgroundColor: const Color(0xFFDC3545),
//                   behavior: SnackBarBehavior.floating,
//                 ),
//               );
//             },
//             orElse: () {},
//           );
//         },
//         builder: (context, state) {
//           return state.maybeWhen(
//             loading: () => const Center(
//               child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
//             ),
//             actionLoading: () => const Center(
//               child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
//             ),
//             error: (msg) => _buildError(msg),
//             detailLoaded: (result) {
//               final o = result.data;
//               if (o == null) return _buildError('Data tidak ditemukan.');
//               return RefreshIndicator(
//                 color: const Color(0xFF6C63FF),
//                 onRefresh: () async {
//                   _editedStocks.clear();
//                   _reload();
//                 },
//                 child: SingleChildScrollView(
//                   physics: const AlwaysScrollableScrollPhysics(),
//                   padding: const EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       _buildHeaderCard(o),
//                       const SizedBox(height: 12),
//                       _buildStatsRow(o),
//                       const SizedBox(height: 12),
//                       _buildItemsSection(o),
//                       const SizedBox(height: 24),
//                     ],
//                   ),
//                 ),
//               );
//             },
//             orElse: () => const SizedBox(),
//           );
//         },
//       ),
//     );
//   }

//   // ── Cards ──────────────────────────────────────────────────────────────

//   Widget _buildHeaderCard(StockOpnameModel o) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withValues(alpha: 0.04),
//               blurRadius: 8,
//               offset: const Offset(0, 2))
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: const Color(0xFF6C63FF).withValues(alpha: 0.1),
//                     borderRadius: BorderRadius.circular(12)),
//                 child: const Icon(Icons.inventory_2_outlined,
//                     color: Color(0xFF6C63FF), size: 24),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       o.opnameNumber,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 16,
//                           color: Color(0xFF1A1D1E)),
//                     ),
//                     Text(
//                       o.warehouse?['name'] as String? ?? '-',
//                       style: const TextStyle(
//                           color: Color(0xFF6C757D), fontSize: 13),
//                     ),
//                   ],
//                 ),
//               ),
//               _StatusBadge(status: o.status),
//             ],
//           ),
//           const SizedBox(height: 16),
//           const Divider(height: 1, color: Color(0xFFF0F0F0)),
//           const SizedBox(height: 12),
//           _DetailRow(
//               icon: Icons.calendar_today_outlined,
//               label: 'Tanggal',
//               value: _formatDate(o.opnameDate)),
//           if (o.startedAt != null) ...[
//             const SizedBox(height: 8),
//             _DetailRow(
//                 icon: Icons.play_arrow_outlined,
//                 label: 'Dimulai',
//                 value: _formatDate(o.startedAt)),
//           ],
//           if (o.completedAt != null) ...[
//             const SizedBox(height: 8),
//             _DetailRow(
//                 icon: Icons.check_circle_outline,
//                 label: 'Selesai',
//                 value: _formatDate(o.completedAt)),
//           ],
//           if (o.approvedByName != null) ...[
//             const SizedBox(height: 8),
//             _DetailRow(
//                 icon: Icons.verified_user_outlined,
//                 label: 'Disetujui oleh',
//                 value: o.approvedByName!),
//           ],
//           if (o.notes != null && o.notes!.isNotEmpty) ...[
//             const SizedBox(height: 8),
//             _DetailRow(
//                 icon: Icons.notes_outlined, label: 'Catatan', value: o.notes!),
//           ],
//           if (o.rejectReason != null && o.rejectReason!.isNotEmpty) ...[
//             const SizedBox(height: 8),
//             _DetailRow(
//                 icon: Icons.cancel_outlined,
//                 label: 'Alasan Tolak',
//                 value: o.rejectReason!),
//           ],
//         ],
//       ),
//     );
//   }

//   Widget _buildStatsRow(StockOpnameModel o) {
//     final total = o.items.length;
//     // ✅ Hitung dari _editedStocks juga
//     final counted = o.items.where((i) {
//       final edited = _editedStocks[i.productId];
//       return edited != null || i.physicalStock >= 0;
//     }).length;
//     final diff = o.items.where((i) {
//       final physStock = _editedStocks[i.productId] ?? i.physicalStock;
//       return (physStock - i.systemStock) != 0;
//     }).length;

//     return Row(
//       children: [
//         Expanded(
//           child: _StatCard(
//               label: 'Total Item',
//               value: '$total',
//               color: const Color(0xFF6C63FF),
//               icon: Icons.list_alt_outlined),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: _StatCard(
//               label: 'Sudah Dihitung',
//               value: '$counted',
//               color: const Color(0xFF0E9B6A),
//               icon: Icons.check_circle_outline),
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: _StatCard(
//               label: 'Selisih',
//               value: '$diff',
//               color: const Color(0xFFDC3545),
//               icon: Icons.warning_amber_outlined),
//         ),
//       ],
//     );
//   }

//   Widget _buildItemsSection(StockOpnameModel o) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withValues(alpha: 0.04),
//               blurRadius: 8,
//               offset: const Offset(0, 2))
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('Daftar Item',
//                     style: TextStyle(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 15,
//                         color: Color(0xFF1A1D1E))),
//                 if (o.status == 'in_progress')
//                   Text(
//                     '${_editedStocks.length} diubah',
//                     style: const TextStyle(
//                         color: Color(0xFF6C63FF),
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600),
//                   ),
//               ],
//             ),
//           ),
//           const Divider(height: 1, color: Color(0xFFF0F0F0)),
//           if (o.items.isEmpty)
//             const Padding(
//               padding: EdgeInsets.all(32),
//               child: Center(
//                 child: Column(
//                   children: [
//                     Icon(Icons.inventory_2_outlined,
//                         size: 36, color: Color(0xFFADB5BD)),
//                     SizedBox(height: 8),
//                     Text('Belum ada item',
//                         style: TextStyle(color: Color(0xFF6C757D))),
//                     SizedBox(height: 4),
//                     Text(
//                         'Tekan "Mulai Opname" untuk memuat item dari stok gudang',
//                         style:
//                             TextStyle(color: Color(0xFFADB5BD), fontSize: 11),
//                         textAlign: TextAlign.center),
//                   ],
//                 ),
//               ),
//             )
//           else
//             // ✅ Pass onStockChanged callback ke setiap tile
//             ...o.items
//                 .map((item) => _OpnameItemTile(
//                       item: item,
//                       status: o.status,
//                       overridePhysical: _editedStocks[item.productId],
//                       onStockChanged: (productId, qty) {
//                         setState(() {
//                           _editedStocks[productId] = qty;
//                         });
//                       },
//                     ))
//                 .toList(),
//         ],
//       ),
//     );
//   }

//   Widget _buildError(String msg) => Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.error_outline, color: Color(0xFFDC3545), size: 48),
//             const SizedBox(height: 12),
//             Text(msg, style: const TextStyle(color: Color(0xFF6C757D))),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _reload,
//               style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF6C63FF)),
//               child: const Text('Coba lagi'),
//             ),
//           ],
//         ),
//       );

//   // ── Helpers ───────────────────────────────────────────────────────────

//   String _formatDate(String? dt) {
//     if (dt == null || dt.isEmpty) return '-';
//     try {
//       return DateFormat('dd MMM yyyy').format(DateTime.parse(dt));
//     } catch (_) {
//       return dt;
//     }
//   }

//   void _handleMenu(String value, StockOpnameModel o) {
//     switch (value) {
//       case 'start':
//         context.read<OpnameBloc>().add(OpnameEvent.start(widget.opnameId));
//         break;
//       case 'delete':
//         _confirmDelete();
//         break;
//     }
//   }

//   void _confirmDelete() {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//         title: const Text('Hapus Opname?',
//             style: TextStyle(fontWeight: FontWeight.w700)),
//         content: const Text(
//             'Opname ini akan dihapus permanen. Tindakan ini tidak dapat dibatalkan.'),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Batal')),
//           ElevatedButton(
//             onPressed: () => Navigator.pop(context),
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFFDC3545),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8))),
//             child: const Text('Hapus', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   void _confirmFinish(StockOpnameModel o) {
//     // ✅ Gabungkan nilai dari _editedStocks (yang diubah admin) dengan
//     //    nilai asal dari state (yang belum diubah)
//     final items = o.items.map((i) {
//       final edited = _editedStocks[i.productId];
//       return {
//         'product_id': i.productId,
//         'physical_stock': edited ?? i.physicalStock,
//       };
//     }).toList();

//     // Hitung berapa item yang punya selisih
//     final diffCount = items.where((item) {
//       final orig = o.items.firstWhere((i) => i.productId == item['product_id']);
//       return (item['physical_stock'] as int) != orig.systemStock;
//     }).length;

//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
//         title: const Text('Selesaikan Opname?',
//             style: TextStyle(fontWeight: FontWeight.w700)),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text('Total: ${items.length} item'),
//             Text('Diubah: ${_editedStocks.length} item'),
//             Text(
//               'Selisih: $diffCount item',
//               style: TextStyle(
//                   color: diffCount > 0
//                       ? const Color(0xFFDC3545)
//                       : const Color(0xFF0E9B6A),
//                   fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Setelah selesai, data akan menunggu persetujuan super admin.',
//               style: TextStyle(color: Color(0xFF6C757D), fontSize: 12),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Batal')),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               context.read<OpnameBloc>().add(OpnameEvent.complete(
//                     id: widget.opnameId,
//                     items: items,
//                   ));
//             },
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF6C63FF),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8))),
//             child:
//                 const Text('Selesaikan', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Opname item tile ───────────────────────────────────────────────────────

// class _OpnameItemTile extends StatefulWidget {
//   final StockOpnameItemModel item;
//   final String status;
//   final int? overridePhysical; // ✅ nilai yang sudah diedit (dari _editedStocks)
//   final void Function(int productId, int qty)? onStockChanged; // ✅ callback

//   const _OpnameItemTile({
//     required this.item,
//     required this.status,
//     this.overridePhysical,
//     this.onStockChanged,
//   });

//   @override
//   State<_OpnameItemTile> createState() => _OpnameItemTileState();
// }

// class _OpnameItemTileState extends State<_OpnameItemTile> {
//   late TextEditingController _ctrl;
//   bool _editing = false;

//   // ✅ Nilai yang ditampilkan: pakai override kalau ada, fallback ke item asli
//   int get _displayPhysical =>
//       widget.overridePhysical ?? widget.item.physicalStock;

//   @override
//   void initState() {
//     super.initState();
//     _ctrl = TextEditingController(text: '$_displayPhysical');
//   }

//   @override
//   void didUpdateWidget(_OpnameItemTile oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     // ✅ Update controller kalau override berubah dari luar
//     if (oldWidget.overridePhysical != widget.overridePhysical && !_editing) {
//       _ctrl.text = '$_displayPhysical';
//     }
//   }

//   @override
//   void dispose() {
//     _ctrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final item = widget.item;
//     final currentPhysical = _displayPhysical;
//     final diff = currentPhysical - item.systemStock;
//     final hasDiff = diff != 0;
//     final productName = item.product?['name'] as String? ?? '-';
//     final isEdited = widget.overridePhysical != null;

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         border: const Border(bottom: BorderSide(color: Color(0xFFF0F0F0))),
//         // ✅ Highlight baris yang sudah diedit
//         color: isEdited
//             ? const Color(0xFF6C63FF).withValues(alpha: 0.03)
//             : Colors.transparent,
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Text(productName,
//                           style: const TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 14,
//                               color: Color(0xFF1A1D1E))),
//                     ),
//                     // ✅ Badge "Diubah" kalau sudah diedit
//                     if (isEdited)
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 6, vertical: 2),
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF6C63FF).withValues(alpha: 0.1),
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         child: const Text('Diubah',
//                             style: TextStyle(
//                                 color: Color(0xFF6C63FF),
//                                 fontSize: 10,
//                                 fontWeight: FontWeight.w600)),
//                       ),
//                   ],
//                 ),
//                 const SizedBox(height: 2),
//                 Text('Sistem: ${item.systemStock} unit',
//                     style: const TextStyle(
//                         color: Color(0xFF6C757D), fontSize: 12)),
//                 if (hasDiff)
//                   Text(
//                     'Selisih: ${diff > 0 ? '+' : ''}$diff',
//                     style: TextStyle(
//                         fontSize: 12,
//                         fontWeight: FontWeight.w600,
//                         color: diff > 0
//                             ? const Color(0xFF0E9B6A)
//                             : const Color(0xFFDC3545)),
//                   ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           if (widget.status == 'in_progress') ...[
//             if (_editing)
//               SizedBox(
//                 width: 80,
//                 child: TextField(
//                   controller: _ctrl,
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   autofocus: true,
//                   decoration: InputDecoration(
//                     isDense: true,
//                     contentPadding:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: const BorderSide(color: Color(0xFF6C63FF))),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: const BorderSide(
//                             color: Color(0xFF6C63FF), width: 1.5)),
//                   ),
//                   onSubmitted: (v) {
//                     final qty = int.tryParse(v.trim());
//                     if (qty != null && qty >= 0) {
//                       // ✅ Panggil callback ke parent
//                       widget.onStockChanged?.call(widget.item.productId, qty);
//                     }
//                     setState(() => _editing = false);
//                   },
//                 ),
//               )
//             else
//               GestureDetector(
//                 onTap: () => setState(() => _editing = true),
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF6C63FF).withValues(alpha: 0.08),
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(
//                         color: isEdited
//                             ? const Color(0xFF6C63FF)
//                             : const Color(0xFFDEE2E6)),
//                   ),
//                   child: Text(
//                     '$currentPhysical',
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xFF6C63FF),
//                     ),
//                   ),
//                 ),
//               ),
//           ] else
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                 color: const Color(0xFF6C63FF).withValues(alpha: 0.08),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(
//                 '$currentPhysical',
//                 style: const TextStyle(
//                     fontWeight: FontWeight.w600, color: Color(0xFF6C63FF)),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

// // ── Shared widgets ─────────────────────────────────────────────────────────

// class _StatCard extends StatelessWidget {
//   final String label;
//   final String value;
//   final Color color;
//   final IconData icon;
//   const _StatCard(
//       {required this.label,
//       required this.value,
//       required this.color,
//       required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.black.withValues(alpha: 0.04),
//               blurRadius: 6,
//               offset: const Offset(0, 2))
//         ],
//       ),
//       child: Column(
//         children: [
//           Icon(icon, color: color, size: 22),
//           const SizedBox(height: 6),
//           Text(value,
//               style: TextStyle(
//                   fontWeight: FontWeight.w800, fontSize: 18, color: color)),
//           const SizedBox(height: 2),
//           Text(label,
//               style: const TextStyle(color: Color(0xFF6C757D), fontSize: 11),
//               textAlign: TextAlign.center),
//         ],
//       ),
//     );
//   }
// }

// class _DetailRow extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String value;
//   const _DetailRow(
//       {required this.icon, required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Icon(icon, size: 15, color: const Color(0xFFADB5BD)),
//         const SizedBox(width: 8),
//         SizedBox(
//             width: 100,
//             child: Text(label,
//                 style:
//                     const TextStyle(color: Color(0xFF6C757D), fontSize: 13))),
//         Expanded(
//             child: Text(value,
//                 style: const TextStyle(
//                     color: Color(0xFF1A1D1E),
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500))),
//       ],
//     );
//   }
// }

// class _StatusBadge extends StatelessWidget {
//   final String status;
//   const _StatusBadge({required this.status});

//   @override
//   Widget build(BuildContext context) {
//     final cfg = _cfg();
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//           color: cfg['bg'], borderRadius: BorderRadius.circular(20)),
//       child: Text(cfg['label']!,
//           style: TextStyle(
//               color: cfg['color'], fontSize: 11, fontWeight: FontWeight.w600)),
//     );
//   }

//   Map<String, dynamic> _cfg() {
//     switch (status) {
//       case 'draft':
//         return {
//           'bg': const Color(0xFFF8F9FA),
//           'color': const Color(0xFF6C757D),
//           'label': 'Draft'
//         };
//       case 'in_progress':
//         return {
//           'bg': const Color(0xFFFFF3CD),
//           'color': const Color(0xFFE6A817),
//           'label': 'In Progress'
//         };
//       case 'pending_approval':
//         return {
//           'bg': const Color(0xFFCCE5FF),
//           'color': const Color(0xFF004085),
//           'label': 'Menunggu Approval'
//         };
//       case 'approved':
//         return {
//           'bg': const Color(0xFFD1F2EB),
//           'color': const Color(0xFF0E9B6A),
//           'label': 'Disetujui'
//         };
//       case 'cancelled':
//         return {
//           'bg': const Color(0xFFF8D7DA),
//           'color': const Color(0xFFDC3545),
//           'label': 'Dibatalkan'
//         };
//       default:
//         return {
//           'bg': const Color(0xFFF8F9FA),
//           'color': const Color(0xFF6C757D),
//           'label': status
//         };
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/model/response/stock_response_model.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/admin/opname_review_page.dart';
import 'package:warehouse/presentation/bloc/admin/opname/opname_bloc.dart';

// ─────────────────────────────────────────────────────────────────────────
// Worksheet: admin input stok fisik per item
// Semua edit disimpan di _editedItems (Map<productId, qty>)
// Admin bisa simpan progress atau langsung ke review
// ─────────────────────────────────────────────────────────────────────────
class OpnameDetailPage extends StatefulWidget {
  final int opnameId;
  const OpnameDetailPage({super.key, required this.opnameId});

  @override
  State<OpnameDetailPage> createState() => _OpnameDetailPageState();
}

class _OpnameDetailPageState extends State<OpnameDetailPage> {
  StockOpnameModel? _opname;

  // Track semua edit di sini — persist selama halaman hidup
  // Key: productId, Value: qty fisik yang sudah diinput
  final Map<int, int> _editedItems = {};

  bool _autoSaving = false;

  @override
  void initState() {
    super.initState();
    context.read<OpnameBloc>().add(OpnameEvent.loadDetail(widget.opnameId));
  }

  // Merge server data dengan local edits
  List<StockOpnameItemModel> get _mergedItems {
    if (_opname == null) return [];
    return _opname!.items.map((item) {
      if (_editedItems.containsKey(item.productId)) {
        return item.copyWithPhysical(_editedItems[item.productId]!);
      }
      return item;
    }).toList();
  }

  int get _filledCount => _mergedItems.where((i) => i.isFilledIn).length;
  int get _totalCount => _mergedItems.length;
  int get _pendingCount => _totalCount - _filledCount;

  bool get _canGoToReview => _filledCount > 0;
  bool get _allFilled => _filledCount == _totalCount && _totalCount > 0;

  bool get _isEditable =>
      _opname != null &&
      (_opname!.status == 'in_progress' || _opname!.status == 'draft');

  // ── Save progress ke backend ─────────────────────────────────────────────
  void _saveProgress() {
    if (_opname == null || _editedItems.isEmpty) return;
    final items = _editedItems.entries
        .map((e) => {'product_id': e.key, 'physical_stock': e.value})
        .toList();
    context.read<OpnameBloc>().add(
          OpnameEvent.saveProgress(id: _opname!.id, items: items),
        );
    setState(() => _autoSaving = true);
  }

  // ── Go to review page ────────────────────────────────────────────────────
  void _goToReview() {
    if (_opname == null) return;
    // Gabungkan data backend + editan lokal
    final merged = _mergedItems;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<OpnameBloc>(),
          child: OpnameReviewPage(
            opname: _opname!.copyWithItems(merged),
          ),
        ),
      ),
    ).then((refreshed) {
      if (refreshed == true) {
        context.read<OpnameBloc>().add(OpnameEvent.loadDetail(widget.opnameId));
      }
    });
  }

  // ── Mulai opname (draft → in_progress) ──────────────────────────────────
  void _startOpname() {
    if (_opname == null) return;
    context.read<OpnameBloc>().add(OpnameEvent.start(_opname!.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OpnameBloc, OpnameState>(
      listener: (ctx, state) {
        state.maybeWhen(
          loading: () {},
          actionLoading: () {},
          detailLoaded: (res) {
            if (res.data != null) {
              setState(() {
                _opname = res.data;
                _autoSaving = false;
                // Sync backend physical_stock ke _editedItems
                // (isi dari server yang sudah ada)
                for (final item in res.data!.items) {
                  if (item.physicalStock != null &&
                      !_editedItems.containsKey(item.productId)) {
                    _editedItems[item.productId] = item.physicalStock!;
                  }
                }
              });
            }
          },
          actionSuccess: (msg, data) {
            setState(() => _autoSaving = false);
            if (data?.data != null) {
              setState(() {
                _opname = data!.data;
                // Sync ulang setelah save
                for (final item in _opname!.items) {
                  if (item.physicalStock != null) {
                    _editedItems[item.productId] = item.physicalStock!;
                  }
                }
              });
            }
            ScaffoldMessenger.of(ctx).showSnackBar(
              SnackBar(
                  content: Text(msg),
                  backgroundColor: Colors.green.shade600,
                  duration: const Duration(seconds: 2)),
            );
          },
          error: (msg) {
            setState(() => _autoSaving = false);
            ScaffoldMessenger.of(ctx).showSnackBar(
              SnackBar(content: Text(msg), backgroundColor: Colors.red),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.bg,
        appBar: _buildAppBar(),
        body: _buildBody(),
        bottomNavigationBar:
            _opname != null && _isEditable ? _buildBottomBar() : null,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(_opname?.opnameNumber ?? 'Detail Opname'),
      backgroundColor: Colors.white,
      foregroundColor: AppColors.text,
      elevation: 0,
      actions: [
        if (_isEditable && _editedItems.isNotEmpty)
          _autoSaving
              ? const Padding(
                  padding: EdgeInsets.all(14),
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : TextButton.icon(
                  onPressed: _saveProgress,
                  icon: const Icon(Icons.save_outlined, size: 16),
                  label: const Text('Simpan'),
                  style:
                      TextButton.styleFrom(foregroundColor: AppColors.primary),
                ),
      ],
    );
  }

  Widget _buildBody() {
    if (_opname == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        _buildHeader(),
        if (_opname!.status == 'draft') _buildStartBanner(),
        if (_opname!.rejectReason != null) _buildRejectBanner(),
        Expanded(child: _buildItemsList()),
      ],
    );
  }

  // ── Header: info opname + progress bar ───────────────────────────────────
  Widget _buildHeader() {
    final o = _opname!;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      o.warehouseName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15),
                    ),
                    Text(
                      '${o.opnameDate}  •  ${_scopeLabel(o.scope)}',
                      style: const TextStyle(
                          fontSize: 12, color: AppColors.textMuted),
                    ),
                  ],
                ),
              ),
              _statusBadge(o.status),
            ],
          ),
          const SizedBox(height: 12),
          // Progress bar
          Row(
            children: [
              Text(
                '$_filledCount/$_totalCount item diisi',
                style:
                    const TextStyle(fontSize: 12, color: AppColors.textMuted),
              ),
              const Spacer(),
              Text(
                '${(_filledCount / (_totalCount == 0 ? 1 : _totalCount) * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: _totalCount == 0 ? 0 : _filledCount / _totalCount,
              backgroundColor: AppColors.border,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primary),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  // ── Banner: masih draft ──────────────────────────────────────────────────
  Widget _buildStartBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.orange.shade700, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Opname masih berstatus Draft. Tap "Mulai Opname" untuk mengisi stok fisik.',
              style: TextStyle(fontSize: 12, color: Colors.orange.shade800),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _startOpname,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange.shade600,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Mulai',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Banner: rejected ─────────────────────────────────────────────────────
  Widget _buildRejectBanner() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber_rounded,
              color: Colors.red.shade600, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Ditolak: ${_opname!.rejectReason}',
              style: TextStyle(fontSize: 12, color: Colors.red.shade700),
            ),
          ),
        ],
      ),
    );
  }

  // ── Daftar item worksheet ─────────────────────────────────────────────────
  Widget _buildItemsList() {
    final items = _mergedItems;
    if (items.isEmpty) {
      return const Center(
        child: Text('Tidak ada item.',
            style: TextStyle(color: AppColors.textMuted)),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 100),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (ctx, i) => _ItemRow(
        item: items[i],
        editable: _isEditable,
        onChanged: (qty) {
          setState(() => _editedItems[items[i].productId] = qty);
        },
      ),
    );
  }

  // ── Bottom bar ───────────────────────────────────────────────────────────
  Widget _buildBottomBar() {
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
          if (_pendingCount > 0)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  const Icon(Icons.pending_outlined,
                      size: 14, color: AppColors.textMuted),
                  const SizedBox(width: 6),
                  Text(
                    '$_pendingCount item belum diisi',
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
          Row(
            children: [
              // Simpan progress
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _editedItems.isNotEmpty ? _saveProgress : null,
                  icon: const Icon(Icons.save_outlined, size: 16),
                  label: const Text('Simpan Progress'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Review & Selesaikan
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed: _canGoToReview ? _goToReview : null,
                  icon: const Icon(Icons.check_circle_outline, size: 16),
                  label: Text(_allFilled
                      ? 'Review & Selesaikan'
                      : 'Review ($_filledCount item)'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        _allFilled ? AppColors.primary : AppColors.info,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Helpers ──────────────────────────────────────────────────────────────
  String _scopeLabel(String scope) {
    switch (scope) {
      case 'category':
        return 'Per Kategori';
      case 'manual':
        return 'Produk Pilihan';
      default:
        return 'Semua Produk';
    }
  }

  Widget _statusBadge(String status) {
    Color color;
    String label;
    switch (status) {
      case 'draft':
        color = Colors.grey.shade600;
        label = 'Draft';
        break;
      case 'in_progress':
        color = Colors.blue.shade600;
        label = 'Sedang Berjalan';
        break;
      case 'pending_approval':
        color = Colors.orange.shade700;
        label = 'Menunggu Approval';
        break;
      case 'approved':
        color = Colors.green.shade600;
        label = 'Disetujui';
        break;
      case 'cancelled':
        color = Colors.red.shade600;
        label = 'Dibatalkan';
        break;
      default:
        color = Colors.grey.shade600;
        label = status;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style:
            TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Row item worksheet dengan inline input
// ─────────────────────────────────────────────────────────────────────────
class _ItemRow extends StatefulWidget {
  final StockOpnameItemModel item;
  final bool editable;
  final ValueChanged<int> onChanged;

  const _ItemRow({
    required this.item,
    required this.editable,
    required this.onChanged,
  });

  @override
  State<_ItemRow> createState() => _ItemRowState();
}

class _ItemRowState extends State<_ItemRow> {
  late TextEditingController _ctrl;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(
      text: widget.item.physicalStock?.toString() ?? '',
    );
  }

  @override
  void didUpdateWidget(_ItemRow old) {
    super.didUpdateWidget(old);
    // Sync jika nilai dari parent berubah (misalnya setelah save)
    final newVal = widget.item.physicalStock?.toString() ?? '';
    if (!_focused && _ctrl.text != newVal) {
      _ctrl.text = newVal;
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  int? get _parsedQty => int.tryParse(_ctrl.text);

  int? get _diff {
    final qty = _parsedQty;
    if (qty == null) return null;
    return qty - widget.item.systemStock;
  }

  Color get _diffColor {
    final d = _diff;
    if (d == null) return AppColors.textMuted;
    if (d == 0) return Colors.green.shade600;
    if (d > 0) return Colors.blue.shade600;
    return Colors.red.shade600;
  }

  String get _diffLabel {
    final d = _diff;
    if (d == null) return '—';
    if (d == 0) return 'Sama';
    return d > 0 ? '+$d' : '$d';
  }

  @override
  Widget build(BuildContext context) {
    final filled = widget.item.isFilledIn || _ctrl.text.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: filled
              ? (_diff == 0
                  ? Colors.green.shade200
                  : _diff != null
                      ? Colors.orange.shade200
                      : AppColors.border)
              : AppColors.border,
          width: filled ? 1.5 : 1,
        ),
      ),
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Status dot
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: filled
                  ? (_diff == 0
                      ? Colors.green.shade500
                      : Colors.orange.shade500)
                  : Colors.grey.shade300,
            ),
          ),
          const SizedBox(width: 10),

          // Nama produk
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.item.productName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.item.productSku,
                  style:
                      const TextStyle(fontSize: 11, color: AppColors.textMuted),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Stok sistem
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text('Sistem',
                  style: TextStyle(fontSize: 10, color: AppColors.textMuted)),
              Text(
                '${widget.item.systemStock}',
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(width: 12),

          // Input stok fisik
          SizedBox(
            width: 72,
            child: Focus(
              onFocusChange: (f) => setState(() => _focused = f),
              child: TextFormField(
                controller: _ctrl,
                enabled: widget.editable,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Fisik',
                  isDense: true,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: AppColors.primary, width: 1.5),
                  ),
                ),
                onChanged: (v) {
                  final qty = int.tryParse(v);
                  if (qty != null) widget.onChanged(qty);
                  setState(() {});
                },
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Selisih
          SizedBox(
            width: 44,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Selisih',
                    style: TextStyle(fontSize: 10, color: AppColors.textMuted)),
                Text(
                  _diffLabel,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _diffColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Extension untuk copyWithItems
extension StockOpnameModelX on StockOpnameModel {
  StockOpnameModel copyWithItems(List<StockOpnameItemModel> items) =>
      StockOpnameModel(
        id: id,
        opnameNumber: opnameNumber,
        warehouseId: warehouseId,
        scope: scope,
        categoryId: categoryId,
        createdBy: createdBy,
        createdByName: createdByName,
        approvedBy: approvedBy,
        approvedByName: approvedByName,
        status: status,
        opnameDate: opnameDate,
        startedAt: startedAt,
        completedAt: completedAt,
        approvedAt: approvedAt,
        notes: notes,
        rejectReason: rejectReason,
        items: items,
        warehouse: warehouse,
      );
}
