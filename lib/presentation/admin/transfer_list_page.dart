// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:warehouse/data/datasource/admin/stock_transfer_datasource.dart';
// // import 'package:warehouse/presentation/admin/app_theme.dart';
// // import 'package:warehouse/presentation/admin/transfer_form_page.dart';
// // import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';
// // import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
// // import 'package:warehouse/presentation/bloc/admin/transfer/transfer_bloc.dart';

// // class TransferListPage extends StatefulWidget {
// //   const TransferListPage({super.key});
// //   @override
// //   State<TransferListPage> createState() => _TransferListPageState();
// // }

// // class _TransferListPageState extends State<TransferListPage>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tab;
// //   static const _statuses = [null, 'pending', 'approved', 'sent', 'received', 'cancelled'];
// //   static const _labels   = ['Semua', 'Pending', 'Disetujui', 'Dikirim', 'Diterima', 'Batal'];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _tab = TabController(length: _statuses.length, vsync: this);
// //     _tab.addListener(() {
// //       if (!_tab.indexIsChanging)
// //         context.read<TransferBloc>().add(TransferEvent.filter(_statuses[_tab.index]));
// //     });
// //   }

// //   @override
// //   void dispose() { _tab.dispose(); super.dispose(); }

// //   SnackBar _snack(String msg, Color c) => SnackBar(
// //     content: Text(msg), backgroundColor: c,
// //     behavior: SnackBarBehavior.floating,
// //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: AppColors.bg,
// //       appBar: AppBar(
// //         title: const Text('Transfer Antar Gudang'),
// //         backgroundColor: AppColors.surface,
// //         bottom: TabBar(
// //           controller: _tab, isScrollable: true,
// //           tabAlignment: TabAlignment.start,
// //           indicatorColor: AppColors.primary,
// //           labelColor: AppColors.primary,
// //           unselectedLabelColor: AppColors.textMuted,
// //           labelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
// //           tabs: _labels.map((l) => Tab(text: l)).toList(),
// //         ),
// //       ),
// // floatingActionButton: FloatingActionButton.extended(
// //   onPressed: () async {
// //     final result = await Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (_) => MultiBlocProvider(
// //           providers: [
// //             BlocProvider(create: (_) => TransferBloc()), // ← buat instance baru, jangan .value
// //             BlocProvider(create: (_) => AdminWarehouseBloc()
// //               ..add(const AdminWarehouseEvent.load())),
// //             BlocProvider(create: (_) => AdminProductBloc()
// //               ..add(const AdminProductEvent.load())),
// //           ],
// //           child: const TransferFormPage(),
// //         ),
// //       ),
// //     );
// //     if (result == true) {
// //       // Refresh list di halaman sebelumnya
// //       context.read<TransferBloc>().add(TransferEvent.filter(_statuses[_tab.index]));
// //     }
// //   },
// //   backgroundColor: AppColors.primary,
// //   foregroundColor: Colors.white,
// //   icon: const Icon(Icons.add_rounded),
// //   label: const Text('Transfer Baru'),
// // ),
// //       body: BlocConsumer<TransferBloc, TransferState>(
// //         listener: (ctx, state) => state.maybeWhen(
// //           actionSuccess: (msg, _) {
// //             ScaffoldMessenger.of(ctx).showSnackBar(_snack(msg, AppColors.success));
// //             ctx.read<TransferBloc>().add(TransferEvent.filter(_statuses[_tab.index]));
// //           },
// //           error: (msg) => ScaffoldMessenger.of(ctx).showSnackBar(_snack(msg, AppColors.danger)),
// //           orElse: () {},
// //         ),
// //         builder: (ctx, state) => state.when(
// //           initial: () => const SizedBox.shrink(),
// //           loading: () => const Center(child: CircularProgressIndicator()),
// //           actionLoading: () => const Center(child: CircularProgressIndicator()),
// //           listLoaded: (res) => res.data.isEmpty
// //               ? _empty()
// //               : RefreshIndicator(
// //                   color: AppColors.primary,
// //                   onRefresh: () async => ctx.read<TransferBloc>()
// //                       .add(TransferEvent.filter(_statuses[_tab.index])),
// //                   child: ListView.separated(
// //                     padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
// //                     itemCount: res.data.length,
// //                     separatorBuilder: (_, __) => const SizedBox(height: 10),
// //                     itemBuilder: (_, i) => TweenAnimationBuilder<double>(
// //                       tween: Tween(begin: 0, end: 1),
// //                       duration: Duration(milliseconds: 250 + i * 60),
// //                       curve: Curves.easeOut,
// //                       builder: (_, v, child) => Opacity(opacity: v,
// //                         child: Transform.translate(offset: Offset(0, (1-v)*12), child: child)),
// //                       child: _TransferCard(transfer: res.data[i]),
// //                     ),
// //                   )),
// //           detailLoaded: (_) => const SizedBox.shrink(),
// //           actionSuccess: (_, __) => const Center(child: CircularProgressIndicator()),
// //           error: (msg) => Center(child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               const Icon(Icons.error_outline, size: 48, color: AppColors.danger),
// //               const SizedBox(height: 12),
// //               Text(msg, textAlign: TextAlign.center),
// //               const SizedBox(height: 16),
// //               ElevatedButton(
// //                 onPressed: () => ctx.read<TransferBloc>().add(const TransferEvent.load()),
// //                 child: const Text('Coba Lagi')),
// //             ])),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _empty() => Center(child: Column(
// //     mainAxisAlignment: MainAxisAlignment.center,
// //     children: [
// //       Container(width: 70, height: 70,
// //         decoration: const BoxDecoration(color: AppColors.bg, shape: BoxShape.circle),
// //         child: const Icon(Icons.swap_horiz_outlined, color: AppColors.primary, size: 32)),
// //       const SizedBox(height: 14),
// //       const Text('Belum ada transfer di kategori ini',
// //         style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
// //     ],
// //   ));
// // }

// // class _TransferCard extends StatelessWidget {
// //   final StockTransferModel transfer;
// //   const _TransferCard({required this.transfer});

// //   @override
// //   Widget build(BuildContext context) {
// //     final meta = _meta(transfer.status);
// //     final from = transfer.fromWarehouse?['name']?.toString()
// //         ?? 'Gudang #${transfer.fromWarehouseId}';
// //     final to   = transfer.toWarehouse?['name']?.toString()
// //         ?? 'Gudang #${transfer.toWarehouseId}';

// //     return GestureDetector(
// //       onTap: () => HapticFeedback.selectionClick(),
// //       child: Container(
// //         padding: const EdgeInsets.all(14),
// //         decoration: BoxDecoration(
// //           color: AppColors.surface,
// //           border: Border.all(color: AppColors.border),
// //           borderRadius: BorderRadius.circular(14),
// //           boxShadow: [BoxShadow(color: Colors.black.withOpacity(.04),
// //             blurRadius: 8, offset: const Offset(0, 2))],
// //         ),
// //         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //           Row(children: [
// //             Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //               Text(transfer.transferNumber, style: const TextStyle(
// //                 fontWeight: FontWeight.w800, fontSize: 13.5)),
// //               const SizedBox(height: 2),
// //               Text('${transfer.items.length} item',
// //                 style: const TextStyle(color: AppColors.textMuted, fontSize: 11.5)),
// //             ])),
// //             _Badge(label: meta.label, color: meta.color, bg: meta.bg),
// //           ]),
// //           const SizedBox(height: 10),
// //           // From → To
// //           Container(
// //             padding: const EdgeInsets.all(10),
// //             decoration: BoxDecoration(
// //               color: AppColors.bg, borderRadius: BorderRadius.circular(10)),
// //             child: Row(children: [
// //               _whChip(from, Icons.warehouse_rounded, AppColors.primary),
// //               const Padding(padding: EdgeInsets.symmetric(horizontal: 8),
// //                 child: Icon(Icons.arrow_forward_rounded,
// //                   color: AppColors.textMuted, size: 16)),
// //               _whChip(to, Icons.warehouse_rounded, AppColors.accent),
// //             ]),
// //           ),
// //           const SizedBox(height: 10),
// //           // Action buttons
// //           Row(children: [
// //             Text(_fmtDate(transfer.createdAt),
// //               style: const TextStyle(color: AppColors.textMuted, fontSize: 11)),
// //             const Spacer(),
// //             if (transfer.status == 'pending')
// //               _actionBtn('Setujui', Icons.check_rounded, AppColors.success,
// //                 AppColors.successSoft, () =>
// //                   context.read<TransferBloc>().add(TransferEvent.approve(transfer.id))),
// //             if (transfer.status == 'approved')
// //               _actionBtn('Kirim', Icons.send_rounded, AppColors.info,
// //                 AppColors.infoSoft, () =>
// //                   context.read<TransferBloc>().add(TransferEvent.send(transfer.id))),
// //           ]),
// //         ]),
// //       ),
// //     );
// //   }

// //   Widget _whChip(String name, IconData icon, Color color) => Expanded(
// //     child: Row(children: [
// //       Icon(icon, color: color, size: 14),
// //       const SizedBox(width: 5),
// //       Expanded(child: Text(name,
// //         style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
// //         maxLines: 1, overflow: TextOverflow.ellipsis)),
// //     ]));

// //   Widget _actionBtn(String label, IconData icon, Color color, Color bg,
// //       VoidCallback onTap) =>
// //     GestureDetector(
// //       onTap: () { HapticFeedback.lightImpact(); onTap(); },
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
// //         decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8),
// //           border: Border.all(color: color.withOpacity(.3))),
// //         child: Row(children: [
// //           Icon(icon, color: color, size: 13),
// //           const SizedBox(width: 4),
// //           Text(label, style: TextStyle(color: color,
// //             fontWeight: FontWeight.w700, fontSize: 11.5)),
// //         ])));

// //   String _fmtDate(String raw) {
// //     try { final d = DateTime.parse(raw).toLocal(); return '${d.day}/${d.month}/${d.year}'; }
// //     catch (_) { return raw; }
// //   }

// //   _M _meta(String s) {
// //     switch (s) {
// //       case 'pending':   return _M('Pending',   AppColors.warning, AppColors.warningSoft);
// //       case 'approved':  return _M('Disetujui', AppColors.info,    AppColors.infoSoft);
// //       case 'sent':      return _M('Dikirim',   AppColors.primary, AppColors.primarySoft);
// //       case 'received':  return _M('Diterima',  AppColors.success, AppColors.successSoft);
// //       case 'cancelled': return _M('Batal',     AppColors.danger,  AppColors.dangerSoft);
// //       default: return _M(s, AppColors.textMuted, AppColors.bg);
// //     }
// //   }
// // }

// // class _Badge extends StatelessWidget {
// //   final String label; final Color color, bg;
// //   const _Badge({required this.label, required this.color, required this.bg});
// //   @override
// //   Widget build(BuildContext context) => Container(
// //     padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
// //     decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
// //     child: Text(label, style: TextStyle(
// //       fontSize: 10, fontWeight: FontWeight.w700, color: color)));
// // }

// // class _M {
// //   final String label; final Color color, bg;
// //   const _M(this.label, this.color, this.bg);
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:warehouse/data/datasource/admin/stock_transfer_datasource.dart';
// import 'package:warehouse/presentation/admin/app_theme.dart';
// import 'package:warehouse/presentation/admin/transfer_form_page.dart';
// import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';
// import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
// import 'package:warehouse/presentation/bloc/admin/transfer/transfer_bloc.dart';

// class TransferListPage extends StatefulWidget {
//   const TransferListPage({super.key});
//   @override
//   State<TransferListPage> createState() => _TransferListPageState();
// }

// class _TransferListPageState extends State<TransferListPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tab;

//   static const _statuses = [
//     null,
//     'pending',
//     'approved',
//     'sent',
//     'received',
//     'cancelled'
//   ];
//   static const _labels = [
//     'Semua',
//     'Pending',
//     'Disetujui',
//     'Dikirim',
//     'Diterima',
//     'Batal'
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // TransferBloc sudah di-provide dari main.dart (AdminHomeShell level),
//     // dan sudah di-load saat create. Cukup attach listener tab saja.
//     _tab = TabController(length: _statuses.length, vsync: this);
//     _tab.addListener(() {
//       if (!_tab.indexIsChanging) {
//         context
//             .read<TransferBloc>()
//             .add(TransferEvent.filter(_statuses[_tab.index]));
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _tab.dispose();
//     super.dispose();
//   }

//   SnackBar _snack(String msg, Color c) => SnackBar(
//         content: Text(msg),
//         backgroundColor: c,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bg,
//       appBar: AppBar(
//         title: const Text('Transfer Antar Gudang'),
//         backgroundColor: AppColors.surface,
//         bottom: TabBar(
//           controller: _tab,
//           isScrollable: true,
//           tabAlignment: TabAlignment.start,
//           indicatorColor: AppColors.primary,
//           labelColor: AppColors.primary,
//           unselectedLabelColor: AppColors.textMuted,
//           labelStyle:
//               const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
//           tabs: _labels.map((l) => Tab(text: l)).toList(),
//         ),
//       ),

//       // ── FAB ─────────────────────────────────────────────────────────────
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (_) => MultiBlocProvider(
//                 providers: [
//                   // Pakai .value karena TransferBloc sudah ada di root admin.
//                   // TransferFormPage akan dispatch ke instance yang sama,
//                   // sehingga saat pop kita tinggal refresh list-nya.
//                   BlocProvider.value(value: context.read<TransferBloc>()),

//                   // AdminWarehouseBloc & AdminProductBloc dibuat baru
//                   // karena belum tentu ada di scope ini.
//                   BlocProvider(
//                     create: (_) => AdminWarehouseBloc()
//                       ..add(const AdminWarehouseEvent.load()),
//                   ),
//                   BlocProvider(
//                     create: (_) =>
//                         AdminProductBloc()..add(const AdminProductEvent.load()),
//                   ),
//                 ],
//                 child: const TransferFormPage(),
//               ),
//             ),
//           );

//           if (result == true && mounted) {
//             context
//                 .read<TransferBloc>()
//                 .add(TransferEvent.filter(_statuses[_tab.index]));
//           }
//         },
//         backgroundColor: AppColors.primary,
//         foregroundColor: Colors.white,
//         icon: const Icon(Icons.add_rounded),
//         label: const Text('Transfer Baru'),
//       ),

//       // ── Body ─────────────────────────────────────────────────────────────
//       body: BlocConsumer<TransferBloc, TransferState>(
//         listener: (ctx, state) => state.maybeWhen(
//           actionSuccess: (msg, _) {
//             ScaffoldMessenger.of(ctx)
//                 .showSnackBar(_snack(msg, AppColors.success));
//             ctx
//                 .read<TransferBloc>()
//                 .add(TransferEvent.filter(_statuses[_tab.index]));
//           },
//           error: (msg) => ScaffoldMessenger.of(ctx)
//               .showSnackBar(_snack(msg, AppColors.danger)),
//           orElse: () {},
//         ),
//         builder: (ctx, state) => state.when(
//           initial: () => const SizedBox.shrink(),
//           loading: () => const Center(child: CircularProgressIndicator()),
//           actionLoading: () => const Center(child: CircularProgressIndicator()),
//           listLoaded: (res) => res.data.isEmpty
//               ? _empty()
//               : RefreshIndicator(
//                   color: AppColors.primary,
//                   onRefresh: () async => ctx
//                       .read<TransferBloc>()
//                       .add(TransferEvent.filter(_statuses[_tab.index])),
//                   child: ListView.separated(
//                     padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
//                     itemCount: res.data.length,
//                     separatorBuilder: (_, __) => const SizedBox(height: 10),
//                     itemBuilder: (_, i) => TweenAnimationBuilder<double>(
//                       tween: Tween(begin: 0, end: 1),
//                       duration: Duration(milliseconds: 250 + i * 60),
//                       curve: Curves.easeOut,
//                       builder: (_, v, child) => Opacity(
//                         opacity: v,
//                         child: Transform.translate(
//                           offset: Offset(0, (1 - v) * 12),
//                           child: child,
//                         ),
//                       ),
//                       child: _TransferCard(transfer: res.data[i]),
//                     ),
//                   ),
//                 ),
//           detailLoaded: (_) => const SizedBox.shrink(),
//           actionSuccess: (_, __) =>
//               const Center(child: CircularProgressIndicator()),
//           error: (msg) => Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.error_outline,
//                     size: 48, color: AppColors.danger),
//                 const SizedBox(height: 12),
//                 Text(msg, textAlign: TextAlign.center),
//                 const SizedBox(height: 16),
//                 ElevatedButton(
//                   onPressed: () =>
//                       ctx.read<TransferBloc>().add(const TransferEvent.load()),
//                   child: const Text('Coba Lagi'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _empty() => Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 70,
//               height: 70,
//               decoration: const BoxDecoration(
//                   color: AppColors.bg, shape: BoxShape.circle),
//               child: const Icon(Icons.swap_horiz_outlined,
//                   color: AppColors.primary, size: 32),
//             ),
//             const SizedBox(height: 14),
//             const Text(
//               'Belum ada transfer di kategori ini',
//               style: TextStyle(color: AppColors.textMuted, fontSize: 14),
//             ),
//           ],
//         ),
//       );
// }

// // ── Transfer Card ─────────────────────────────────────────────────────────
// class _TransferCard extends StatelessWidget {
//   final StockTransferModel transfer;
//   const _TransferCard({required this.transfer});

//   @override
//   Widget build(BuildContext context) {
//     final meta = _meta(transfer.status);
//     final from = transfer.fromWarehouse?['name']?.toString() ??
//         'Gudang #${transfer.fromWarehouseId}';
//     final to = transfer.toWarehouse?['name']?.toString() ??
//         'Gudang #${transfer.toWarehouseId}';

//     return GestureDetector(
//       onTap: () => HapticFeedback.selectionClick(),
//       child: Container(
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: AppColors.surface,
//           border: Border.all(color: AppColors.border),
//           borderRadius: BorderRadius.circular(14),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.04),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             )
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(transfer.transferNumber,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.w800, fontSize: 13.5)),
//                     const SizedBox(height: 2),
//                     Text('${transfer.items.length} item',
//                         style: const TextStyle(
//                             color: AppColors.textMuted, fontSize: 11.5)),
//                   ],
//                 ),
//               ),
//               _Badge(label: meta.label, color: meta.color, bg: meta.bg),
//             ]),
//             const SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: AppColors.bg,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(children: [
//                 _whChip(from, Icons.warehouse_rounded, AppColors.primary),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: Icon(Icons.arrow_forward_rounded,
//                       color: AppColors.textMuted, size: 16),
//                 ),
//                 _whChip(to, Icons.warehouse_rounded, AppColors.accent),
//               ]),
//             ),
//             const SizedBox(height: 10),
//             Row(children: [
//               Text(_fmtDate(transfer.createdAt),
//                   style: const TextStyle(
//                       color: AppColors.textMuted, fontSize: 11)),
//               const Spacer(),
//               if (transfer.status == 'pending')
//                 _actionBtn(
//                   'Setujui',
//                   Icons.check_rounded,
//                   AppColors.success,
//                   AppColors.successSoft,
//                   () => context
//                       .read<TransferBloc>()
//                       .add(TransferEvent.approve(transfer.id)),
//                 ),
//               if (transfer.status == 'approved')
//                 _actionBtn(
//                   'Kirim',
//                   Icons.send_rounded,
//                   AppColors.info,
//                   AppColors.infoSoft,
//                   () => context
//                       .read<TransferBloc>()
//                       .add(TransferEvent.send(transfer.id)),
//                 ),
//             ]),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _whChip(String name, IconData icon, Color color) => Expanded(
//         child: Row(children: [
//           Icon(icon, color: color, size: 14),
//           const SizedBox(width: 5),
//           Expanded(
//             child: Text(
//               name,
//               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ]),
//       );

//   Widget _actionBtn(String label, IconData icon, Color color, Color bg,
//           VoidCallback onTap) =>
//       GestureDetector(
//         onTap: () {
//           HapticFeedback.lightImpact();
//           onTap();
//         },
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//           decoration: BoxDecoration(
//             color: bg,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: color.withOpacity(.3)),
//           ),
//           child: Row(children: [
//             Icon(icon, color: color, size: 13),
//             const SizedBox(width: 4),
//             Text(label,
//                 style: TextStyle(
//                     color: color, fontWeight: FontWeight.w700, fontSize: 11.5)),
//           ]),
//         ),
//       );

//   String _fmtDate(String raw) {
//     try {
//       final d = DateTime.parse(raw).toLocal();
//       return '${d.day}/${d.month}/${d.year}';
//     } catch (_) {
//       return raw;
//     }
//   }

//   _M _meta(String s) {
//     switch (s) {
//       case 'pending':
//         return _M('Pending', AppColors.warning, AppColors.warningSoft);
//       case 'approved':
//         return _M('Disetujui', AppColors.info, AppColors.infoSoft);
//       case 'sent':
//         return _M('Dikirim', AppColors.primary, AppColors.primarySoft);
//       case 'received':
//         return _M('Diterima', AppColors.success, AppColors.successSoft);
//       case 'cancelled':
//         return _M('Batal', AppColors.danger, AppColors.dangerSoft);
//       default:
//         return _M(s, AppColors.textMuted, AppColors.bg);
//     }
//   }
// }

// class _Badge extends StatelessWidget {
//   final String label;
//   final Color color, bg;
//   const _Badge({required this.label, required this.color, required this.bg});

//   @override
//   Widget build(BuildContext context) => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
//         decoration:
//             BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
//         child: Text(label,
//             style: TextStyle(
//                 fontSize: 10, fontWeight: FontWeight.w700, color: color)),
//       );
// }

// class _M {
//   final String label;
//   final Color color, bg;
//   const _M(this.label, this.color, this.bg);
// }




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/datasource/admin/stock_transfer_datasource.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/admin/transfer_form_page.dart';
import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/transfer/transfer_bloc.dart';

class TransferListPage extends StatefulWidget {
  const TransferListPage({super.key});

  @override
  State<TransferListPage> createState() => _TransferListPageState();
}

class _TransferListPageState extends State<TransferListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tab;

  // PENTING: status harus cocok dengan enum Laravel
  // "sent" → "in_transit" di DB Laravel
  static const _statuses = <String?>[
    null,
    'pending',
    'approved',
    'in_transit', // ← FIX: bukan 'sent'
    'received',
    'rejected',   // ← FIX: tambah rejected (berbeda dari cancelled)
    'cancelled',
  ];

  static const _labels = [
    'Semua',
    'Pending',
    'Disetujui',
    'Dikirim',   // label UI tetap "Dikirim" meski status DB "in_transit"
    'Diterima',
    'Ditolak',
    'Batal',
  ];

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: _statuses.length, vsync: this);
    _tab.addListener(() {
      if (!_tab.indexIsChanging) {
        context
            .read<TransferBloc>()
            .add(TransferEvent.filter(_statuses[_tab.index]));
      }
    });
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  SnackBar _snack(String msg, Color c) => SnackBar(
        content: Text(msg),
        backgroundColor: c,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Transfer Antar Gudang'),
        backgroundColor: AppColors.surface,
        bottom: TabBar(
          controller: _tab,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorColor: AppColors.primary,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textMuted,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
          tabs: _labels.map((l) => Tab(text: l)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.read<TransferBloc>()),
                  BlocProvider(
                    create: (_) => AdminWarehouseBloc()
                      ..add(const AdminWarehouseEvent.load()),
                  ),
                  BlocProvider(
                    create: (_) => AdminProductBloc()
                      ..add(const AdminProductEvent.load()),
                  ),
                ],
                child: const TransferFormPage(),
              ),
            ),
          );
          if (result == true && mounted) {
            context
                .read<TransferBloc>()
                .add(TransferEvent.filter(_statuses[_tab.index]));
          }
        },
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Transfer Baru'),
      ),
      body: BlocConsumer<TransferBloc, TransferState>(
        listener: (ctx, state) => state.maybeWhen(
          actionSuccess: (msg, _) {
            ScaffoldMessenger.of(ctx)
                .showSnackBar(_snack(msg, AppColors.success));
            ctx
                .read<TransferBloc>()
                .add(TransferEvent.filter(_statuses[_tab.index]));
          },
          error: (msg) => ScaffoldMessenger.of(ctx)
              .showSnackBar(_snack(msg, AppColors.danger)),
          orElse: () {},
        ),
        builder: (ctx, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          actionLoading: () => const Center(child: CircularProgressIndicator()),
          listLoaded: (res) => res.data.isEmpty
              ? _empty()
              : RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () async => ctx
                      .read<TransferBloc>()
                      .add(TransferEvent.filter(_statuses[_tab.index])),
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
                    itemCount: res.data.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, i) => TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: Duration(milliseconds: 250 + i * 60),
                      curve: Curves.easeOut,
                      builder: (_, v, child) => Opacity(
                        opacity: v,
                        child: Transform.translate(
                          offset: Offset(0, (1 - v) * 12),
                          child: child,
                        ),
                      ),
                      child: _TransferCard(transfer: res.data[i]),
                    ),
                  ),
                ),
          detailLoaded: (_) => const SizedBox.shrink(),
          actionSuccess: (_, __) =>
              const Center(child: CircularProgressIndicator()),
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
                  onPressed: () =>
                      ctx.read<TransferBloc>().add(const TransferEvent.load()),
                  child: const Text('Coba Lagi'),
                ),
              ],
            ),
          ),
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
              child: const Icon(Icons.swap_horiz_outlined,
                  color: AppColors.primary, size: 32),
            ),
            const SizedBox(height: 14),
            const Text(
              'Belum ada transfer di kategori ini',
              style: TextStyle(color: AppColors.textMuted, fontSize: 14),
            ),
          ],
        ),
      );
}

// ── Transfer Card ─────────────────────────────────────────────────────────

class _TransferCard extends StatelessWidget {
  final StockTransferModel transfer;
  const _TransferCard({required this.transfer});

  @override
  Widget build(BuildContext context) {
    final meta = _meta(transfer.status);
    final from = transfer.fromWarehouse?['name']?.toString() ??
        'Gudang #${transfer.fromWarehouseId}';
    final to = transfer.toWarehouse?['name']?.toString() ??
        'Gudang #${transfer.toWarehouseId}';

    return GestureDetector(
      onTap: () => HapticFeedback.selectionClick(),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(transfer.transferNumber,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 13.5)),
                    const SizedBox(height: 2),
                    Text('${transfer.items.length} item',
                        style: const TextStyle(
                            color: AppColors.textMuted, fontSize: 11.5)),
                  ],
                ),
              ),
              _Badge(label: meta.label, color: meta.color, bg: meta.bg),
            ]),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(children: [
                _whChip(from, Icons.warehouse_rounded, AppColors.primary),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Icon(Icons.arrow_forward_rounded,
                      color: AppColors.textMuted, size: 16),
                ),
                _whChip(to, Icons.warehouse_rounded, AppColors.accent),
              ]),
            ),
            const SizedBox(height: 10),
            Row(children: [
              Text(_fmtDate(transfer.createdAt),
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 11)),
              const Spacer(),

              // Approve — hanya ketika pending
              if (transfer.status == 'pending')
                _actionBtn(
                  'Setujui',
                  Icons.check_rounded,
                  AppColors.success,
                  AppColors.successSoft,
                  () => context
                      .read<TransferBloc>()
                      .add(TransferEvent.approve(transfer.id)),
                ),

              // Kirim — hanya ketika approved
              // Membuka bottom sheet untuk input quantity per item
              if (transfer.status == 'approved')
                _actionBtn(
                  'Kirim',
                  Icons.send_rounded,
                  AppColors.info,
                  AppColors.infoSoft,
                  () => _showSendSheet(context, transfer),
                ),

              // Terima — hanya ketika in_transit (bukan 'sent')
              if (transfer.status == 'in_transit')
                _actionBtn(
                  'Terima',
                  Icons.done_all_rounded,
                  AppColors.success,
                  AppColors.successSoft,
                  () => _showReceiveSheet(context, transfer),
                ),

              // Tolak — hanya ketika pending
              if (transfer.status == 'pending') ...[
                const SizedBox(width: 8),
                _actionBtn(
                  'Tolak',
                  Icons.close_rounded,
                  AppColors.danger,
                  AppColors.dangerSoft,
                  () => _showRejectDialog(context, transfer.id),
                ),
              ],
            ]),
          ],
        ),
      ),
    );
  }

  // ── Bottom sheet: konfirmasi pengiriman ──────────────────────────────────
  void _showSendSheet(BuildContext context, StockTransferModel transfer) {
    // Buat controller qty per item
    final controllers = {
      for (final item in transfer.items)
        item.id: TextEditingController(
          text: '${item.quantityRequested}',
        ),
    };

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Konfirmasi Pengiriman',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            const SizedBox(height: 4),
            Text('Masukkan jumlah aktual yang dikirim per produk',
                style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
            const SizedBox(height: 16),
            ...transfer.items.map((item) {
              final name = item.product?['name']?.toString() ??
                  'Produk #${item.productId}';
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(children: [
                  Expanded(
                    child: Text(name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13)),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: controllers[item.id],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'Kirim',
                        helperText: 'Maks ${item.quantityRequested}',
                      ),
                    ),
                  ),
                ]),
              );
            }),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Validasi dan bangun payload items
                  final items = <Map<String, dynamic>>[];
                  for (final item in transfer.items) {
                    final qty =
                        int.tryParse(controllers[item.id]?.text.trim() ?? '');
                    if (qty == null || qty <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Jumlah harus > 0 untuk semua item'),
                          backgroundColor: AppColors.danger,
                        ),
                      );
                      return;
                    }
                    items.add({
                      'stock_transfer_item_id': item.id, // ← key yg benar
                      'quantity_sent': qty,
                    });
                  }
                  Navigator.pop(context);
                  context.read<TransferBloc>().add(TransferEvent.send(
                        id: transfer.id,
                        items: items,
                      ));
                },
                child: const Text('Kirim Sekarang'),
              ),
            ),
          ],
        ),
      ),
    ).whenComplete(() {
      for (final c in controllers.values) {
        c.dispose();
      }
    });
  }

  // ── Bottom sheet: konfirmasi penerimaan ──────────────────────────────────
  void _showReceiveSheet(BuildContext context, StockTransferModel transfer) {
    final controllers = {
      for (final item in transfer.items)
        item.id: TextEditingController(
          text: '${item.quantitySent}',
        ),
    };

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Konfirmasi Penerimaan',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            const SizedBox(height: 4),
            Text('Masukkan jumlah aktual yang diterima per produk',
                style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
            const SizedBox(height: 16),
            ...transfer.items.map((item) {
              final name = item.product?['name']?.toString() ??
                  'Produk #${item.productId}';
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 13)),
                        Text('Dikirim: ${item.quantitySent}',
                            style: TextStyle(
                                color: AppColors.textMuted, fontSize: 11)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 80,
                    child: TextField(
                      controller: controllers[item.id],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        labelText: 'Terima',
                        helperText: 'Maks ${item.quantitySent}',
                      ),
                    ),
                  ),
                ]),
              );
            }),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final items = <Map<String, dynamic>>[];
                  for (final item in transfer.items) {
                    final qty =
                        int.tryParse(controllers[item.id]?.text.trim() ?? '');
                    if (qty == null || qty <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Jumlah harus > 0 untuk semua item'),
                          backgroundColor: AppColors.danger,
                        ),
                      );
                      return;
                    }
                    items.add({
                      'stock_transfer_item_id': item.id, // ← key yg benar
                      'quantity_received': qty,
                    });
                  }
                  Navigator.pop(context);
                  context.read<TransferBloc>().add(TransferEvent.receive(
                        id: transfer.id,
                        items: items,
                      ));
                },
                child: const Text('Konfirmasi Diterima'),
              ),
            ),
          ],
        ),
      ),
    ).whenComplete(() {
      for (final c in controllers.values) {
        c.dispose();
      }
    });
  }

  // ── Dialog: reject ────────────────────────────────────────────────────────
  void _showRejectDialog(BuildContext context, int transferId) {
    final ctrl = TextEditingController();
    showDialog(
      context: context,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Tolak Transfer'),
        content: TextField(
          controller: ctrl,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Alasan penolakan *',
            hintText: 'Tuliskan alasan...',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogCtx),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
            onPressed: () {
              final reason = ctrl.text.trim();
              if (reason.isEmpty) return;
              Navigator.pop(dialogCtx);
              context.read<TransferBloc>().add(TransferEvent.reject(
                    id: transferId,
                    reason: reason,
                  ));
            },
            child: const Text('Tolak'),
          ),
        ],
      ),
    ).then((_) => ctrl.dispose());
  }

  Widget _whChip(String name, IconData icon, Color color) => Expanded(
        child: Row(children: [
          Icon(icon, color: color, size: 14),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              name,
              style:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ]),
      );

  Widget _actionBtn(String label, IconData icon, Color color, Color bg,
          VoidCallback onTap) =>
      GestureDetector(
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: color.withOpacity(.3)),
          ),
          child: Row(children: [
            Icon(icon, color: color, size: 13),
            const SizedBox(width: 4),
            Text(label,
                style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.5)),
          ]),
        ),
      );

  String _fmtDate(String raw) {
    try {
      final d = DateTime.parse(raw).toLocal();
      return '${d.day}/${d.month}/${d.year}';
    } catch (_) {
      return raw;
    }
  }

  _M _meta(String s) {
    switch (s) {
      case 'pending':
        return _M('Pending', AppColors.warning, AppColors.warningSoft);
      case 'approved':
        return _M('Disetujui', AppColors.info, AppColors.infoSoft);
      case 'in_transit':            // ← FIX: cocokkan dengan status Laravel
        return _M('Dikirim', AppColors.primary, AppColors.primarySoft);
      case 'received':
        return _M('Diterima', AppColors.success, AppColors.successSoft);
      case 'rejected':              // ← FIX: tambah rejected
        return _M('Ditolak', AppColors.danger, AppColors.dangerSoft);
      case 'cancelled':
        return _M('Batal', AppColors.danger, AppColors.dangerSoft);
      default:
        return _M(s, AppColors.textMuted, AppColors.bg);
    }
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color, bg;
  const _Badge({required this.label, required this.color, required this.bg});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
        decoration:
            BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
        child: Text(label,
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w700, color: color)),
      );
}

class _M {
  final String label;
  final Color color, bg;
  const _M(this.label, this.color, this.bg);
}