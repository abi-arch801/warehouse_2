// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:warehouse/data/model/response/stock_response_model.dart';
// import 'package:warehouse/presentation/admin/app_theme.dart';
// import 'package:warehouse/presentation/admin/opname_detail_page.dart';
// import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
// import 'package:warehouse/presentation/bloc/admin/opname/opname_bloc.dart';

// class OpnameListPage extends StatefulWidget {
//   const OpnameListPage({super.key});
//   @override
//   State<OpnameListPage> createState() => _OpnameListPageState();
// }

// class _OpnameListPageState extends State<OpnameListPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tab;
//   static const _statuses = [
//     null,
//     'draft',
//     'in_progress',
//     'pending_approval',
//     'approved',
//     'cancelled'
//   ];
//   static const _labels = [
//     'Semua',
//     'Draft',
//     'Berjalan',
//     'Menunggu',
//     'Disetujui',
//     'Batal'
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tab = TabController(length: _statuses.length, vsync: this);
//     _tab.addListener(() {
//       if (!_tab.indexIsChanging) {
//         context
//             .read<OpnameBloc>()
//             .add(OpnameEvent.load(status: _statuses[_tab.index]));
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _tab.dispose();
//     super.dispose();
//   }

//   SnackBar _snack(String msg, Color c) => SnackBar(
//       content: Text(msg),
//       backgroundColor: c,
//       behavior: SnackBarBehavior.floating,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bg,
//       appBar: AppBar(
//         title: const Text('Stock Opname'),
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
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () => _showCreateSheet(context),
//         backgroundColor: AppColors.primary,
//         foregroundColor: Colors.white,
//         icon: const Icon(Icons.add_rounded),
//         label: const Text('Buat Opname'),
//       ),
//       body: BlocConsumer<OpnameBloc, OpnameState>(
//         listener: (ctx, state) => state.maybeWhen(
//           actionSuccess: (msg, _) {
//             ScaffoldMessenger.of(ctx)
//                 .showSnackBar(_snack(msg, AppColors.success));
//             ctx
//                 .read<OpnameBloc>()
//                 .add(OpnameEvent.load(status: _statuses[_tab.index]));
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
//                       .read<OpnameBloc>()
//                       .add(OpnameEvent.load(status: _statuses[_tab.index])),
//                   child: ListView.separated(
//                     padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
//                     itemCount: res.data.length,
//                     separatorBuilder: (_, __) => const SizedBox(height: 10),
//                     itemBuilder: (_, i) => TweenAnimationBuilder<double>(
//                       tween: Tween(begin: 0, end: 1),
//                       duration: Duration(milliseconds: 250 + i * 60),
//                       curve: Curves.easeOut,
//                       builder: (_, v, child) => Opacity(
//                           opacity: v,
//                           child: Transform.translate(
//                               offset: Offset(0, (1 - v) * 12), child: child)),
//                       // ✅ Pass callback navigasi ke detail
//                       child: _OpnameCard(
//                         opname: res.data[i],
//                         onTap: () => _navigateToDetail(ctx, res.data[i].id),
//                       ),
//                     ),
//                   )),
//           detailLoaded: (_) => const SizedBox.shrink(),
//           actionSuccess: (_, __) =>
//               const Center(child: CircularProgressIndicator()),
//           error: (msg) => Center(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(Icons.error_outline,
//                   size: 48, color: AppColors.danger),
//               const SizedBox(height: 12),
//               Text(msg, textAlign: TextAlign.center),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                   onPressed: () =>
//                       ctx.read<OpnameBloc>().add(const OpnameEvent.load()),
//                   child: const Text('Coba Lagi')),
//             ],
//           )),
//         ),
//       ),
//     );
//   }

//   // ✅ Navigate ke OpnameDetailPage dengan BlocProvider.value
//   void _navigateToDetail(BuildContext ctx, int opnameId) {
//     Navigator.push(
//       ctx,
//       MaterialPageRoute(
//         builder: (_) => BlocProvider.value(
//           value: ctx.read<OpnameBloc>(),
//           child: OpnameDetailPage(opnameId: opnameId),
//         ),
//       ),
//     ).then((_) {
//       // Reload list saat kembali dari detail
//       if (mounted) {
//         ctx
//             .read<OpnameBloc>()
//             .add(OpnameEvent.load(status: _statuses[_tab.index]));
//       }
//     });
//   }

//   // ✅ Create sheet dengan dropdown gudang (data asli)
//   void _showCreateSheet(BuildContext ctx) {
//     int? selectedWarehouseId;
//     final dateCtrl = TextEditingController(
//         text: DateTime.now().toIso8601String().substring(0, 10));
//     final notesCtrl = TextEditingController();

//     showModalBottomSheet(
//       context: ctx,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (_) => MultiBlocProvider(
//         providers: [
//           BlocProvider.value(value: ctx.read<OpnameBloc>()),
//           BlocProvider(
//             create: (_) =>
//                 AdminWarehouseBloc()..add(const AdminWarehouseEvent.load()),
//           ),
//         ],
//         child: StatefulBuilder(
//           builder: (context, setSheetState) => Padding(
//             padding: EdgeInsets.only(
//               bottom: MediaQuery.of(ctx).viewInsets.bottom,
//             ),
//             child: Container(
//               padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
//               decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius:
//                       BorderRadius.vertical(top: Radius.circular(24))),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                       child: Container(
//                           width: 36,
//                           height: 4,
//                           margin: const EdgeInsets.only(bottom: 16),
//                           decoration: BoxDecoration(
//                               color: AppColors.border,
//                               borderRadius: BorderRadius.circular(8)))),
//                   const Text('Buat Stock Opname',
//                       style:
//                           TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
//                   const SizedBox(height: 16),

//                   // ✅ Dropdown gudang — data asli dari AdminWarehouseBloc
//                   BlocBuilder<AdminWarehouseBloc, AdminWarehouseState>(
//                     builder: (context, state) {
//                       final warehouses = state.maybeWhen(
//                         listLoaded: (result) => result.data,
//                         orElse: () => [],
//                       );
//                       return DropdownButtonFormField<int>(
//                         value: selectedWarehouseId,
//                         decoration: InputDecoration(
//                           labelText: 'Gudang *',
//                           prefixIcon: const Icon(Icons.warehouse_outlined),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide:
//                                 const BorderSide(color: AppColors.border),
//                           ),
//                         ),
//                         hint: warehouses.isEmpty
//                             ? const Text('Memuat...')
//                             : const Text('Pilih gudang'),
//                         items: warehouses
//                             .map<DropdownMenuItem<int>>((w) => DropdownMenuItem(
//                                 value: w.id, child: Text(w.name)))
//                             .toList(),
//                         onChanged: (v) =>
//                             setSheetState(() => selectedWarehouseId = v),
//                       );
//                     },
//                   ),
//                   const SizedBox(height: 12),

//                   // Date picker
//                   TextFormField(
//                     controller: dateCtrl,
//                     readOnly: true,
//                     decoration: InputDecoration(
//                       labelText: 'Tanggal Opname',
//                       prefixIcon: const Icon(Icons.calendar_today_outlined),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: AppColors.border),
//                       ),
//                     ),
//                     onTap: () async {
//                       final d = await showDatePicker(
//                         context: ctx,
//                         initialDate: DateTime.now(),
//                         firstDate: DateTime(2020),
//                         lastDate: DateTime(2030),
//                       );
//                       if (d != null) {
//                         dateCtrl.text = d.toIso8601String().substring(0, 10);
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 12),

//                   // Catatan
//                   TextFormField(
//                     controller: notesCtrl,
//                     maxLines: 2,
//                     decoration: InputDecoration(
//                       labelText: 'Catatan (opsional)',
//                       prefixIcon: const Icon(Icons.notes_rounded),
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: AppColors.border),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),

//                   ElevatedButton(
//                       onPressed: () {
//                         if (selectedWarehouseId == null) {
//                           ScaffoldMessenger.of(ctx).showSnackBar(
//                             const SnackBar(
//                               content: Text('Pilih gudang terlebih dahulu'),
//                               backgroundColor: Colors.orange,
//                             ),
//                           );
//                           return;
//                         }
//                         Navigator.pop(ctx);
//                         ctx.read<OpnameBloc>().add(OpnameEvent.store({
//                               'warehouse_id': selectedWarehouseId,
//                               'opname_date': dateCtrl.text.trim(),
//                               if (notesCtrl.text.trim().isNotEmpty)
//                                 'notes': notesCtrl.text.trim(),
//                             }));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColors.primary,
//                         foregroundColor: Colors.white,
//                         minimumSize: const Size(double.infinity, 48),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12)),
//                       ),
//                       child: const Text('Buat Opname',
//                           style: TextStyle(fontWeight: FontWeight.w700))),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _empty() => Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//               width: 70,
//               height: 70,
//               decoration: const BoxDecoration(
//                   color: AppColors.bg, shape: BoxShape.circle),
//               child: const Icon(Icons.fact_check_outlined,
//                   color: AppColors.primary, size: 32)),
//           const SizedBox(height: 14),
//           const Text('Belum ada stock opname',
//               style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
//           const SizedBox(height: 6),
//           const Text('Tekan + untuk membuat opname baru',
//               style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
//         ],
//       ));
// }

// // ── Opname Card ───────────────────────────────────────────────────────────────
// class _OpnameCard extends StatelessWidget {
//   final StockOpnameModel opname;
//   final VoidCallback? onTap; // ✅ callback navigate

//   const _OpnameCard({required this.opname, this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     final meta = _meta(opname.status);
//     final wh = opname.warehouse?['name']?.toString() ??
//         'Gudang #${opname.warehouseId}';

//     return GestureDetector(
//       onTap: () {
//         HapticFeedback.selectionClick();
//         onTap?.call(); // ✅ panggil callback navigate
//       },
//       child: Container(
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: AppColors.surface,
//           border: Border.all(color: AppColors.border),
//           borderRadius: BorderRadius.circular(14),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withValues(alpha: 0.04),
//                 blurRadius: 8,
//                 offset: const Offset(0, 2))
//           ],
//         ),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           // Header
//           Row(children: [
//             Expanded(
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                   Text(opname.opnameNumber,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.w800, fontSize: 13.5)),
//                   const SizedBox(height: 2),
//                   Row(children: [
//                     const Icon(Icons.warehouse_outlined,
//                         size: 12, color: AppColors.primary),
//                     const SizedBox(width: 4),
//                     Text(wh,
//                         style: const TextStyle(
//                             color: AppColors.textMuted, fontSize: 11.5)),
//                   ]),
//                 ])),
//             _StatusBadge(label: meta.label, color: meta.color, bg: meta.bg),
//           ]),

//           const SizedBox(height: 10),
//           Divider(height: 1, color: Colors.grey.shade100),
//           const SizedBox(height: 10),

//           // Detail
//           Row(children: [
//             _detailItem(Icons.calendar_today_outlined, 'Tanggal',
//                 _fmtDate(opname.opnameDate)),
//             _detailItem(Icons.inventory_2_outlined, 'Item',
//                 '${opname.items.length} item'),
//             if (opname.startedAt != null)
//               _detailItem(Icons.play_circle_outline, 'Mulai',
//                   _fmtDate(opname.startedAt!)),
//           ]),

//           const SizedBox(height: 10),

//           // Progress indicator
//           ClipRRect(
//             borderRadius: BorderRadius.circular(6),
//             child: LinearProgressIndicator(
//               value: _progress(opname.status),
//               minHeight: 5,
//               backgroundColor: meta.color.withValues(alpha: 0.12),
//               valueColor: AlwaysStoppedAnimation<Color>(meta.color),
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(_progressLabel(opname.status),
//               style: TextStyle(
//                   fontSize: 10.5,
//                   color: meta.color,
//                   fontWeight: FontWeight.w600)),

//           const SizedBox(height: 10),

//           // Action buttons
//           Row(children: [
//             const Spacer(),
//             if (opname.status == 'draft')
//               _actionBtn(
//                   'Mulai',
//                   Icons.play_arrow_rounded,
//                   AppColors.info,
//                   AppColors.infoSoft,
//                   () => context
//                       .read<OpnameBloc>()
//                       .add(OpnameEvent.start(opname.id))),
//             if (opname.status == 'pending_approval')
//               Row(children: [
//                 _actionBtn(
//                     'Setujui',
//                     Icons.check_rounded,
//                     AppColors.success,
//                     AppColors.successSoft,
//                     () => context
//                         .read<OpnameBloc>()
//                         .add(OpnameEvent.approve(opname.id))),
//                 const SizedBox(width: 8),
//                 _actionBtn(
//                     'Tolak',
//                     Icons.close_rounded,
//                     AppColors.danger,
//                     AppColors.dangerSoft,
//                     () => _showRejectDialog(context, opname.id)),
//               ]),
//           ]),
//         ]),
//       ),
//     );
//   }

//   void _showRejectDialog(BuildContext ctx, int id) {
//     final ctrl = TextEditingController();
//     showDialog(
//       context: ctx,
//       builder: (_) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         title: const Text('Tolak Opname?'),
//         content: TextField(
//             controller: ctrl,
//             maxLines: 2,
//             decoration: const InputDecoration(labelText: 'Alasan penolakan')),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(_), child: const Text('Batal')),
//           ElevatedButton(
//               onPressed: () {
//                 if (ctrl.text.trim().isEmpty) return;
//                 Navigator.pop(_);
//                 ctx
//                     .read<OpnameBloc>()
//                     .add(OpnameEvent.reject(id: id, reason: ctrl.text.trim()));
//               },
//               style:
//                   ElevatedButton.styleFrom(backgroundColor: AppColors.danger),
//               child: const Text('Tolak')),
//         ],
//       ),
//     );
//   }

//   Widget _detailItem(IconData icon, String label, String val) => Expanded(
//           child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         Icon(icon, size: 12, color: AppColors.primary),
//         const SizedBox(width: 4),
//         Expanded(
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text(label,
//               style: const TextStyle(
//                   fontSize: 9,
//                   color: AppColors.textMuted,
//                   fontWeight: FontWeight.w600)),
//           Text(val,
//               style: const TextStyle(
//                   fontSize: 11.5,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.text),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis),
//         ])),
//       ]));

//   Widget _actionBtn(
//           String label, IconData icon, Color c, Color bg, VoidCallback fn) =>
//       GestureDetector(
//         onTap: () {
//           HapticFeedback.lightImpact();
//           fn();
//         },
//         child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//             decoration: BoxDecoration(
//                 color: bg,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: c.withValues(alpha: 0.3))),
//             child: Row(children: [
//               Icon(icon, color: c, size: 13),
//               const SizedBox(width: 4),
//               Text(label,
//                   style: TextStyle(
//                       color: c, fontWeight: FontWeight.w700, fontSize: 11.5)),
//             ])),
//       );

//   double _progress(String s) {
//     switch (s) {
//       case 'draft':
//         return .1;
//       case 'in_progress':
//         return .4;
//       case 'pending_approval':
//         return .7;
//       case 'approved':
//         return 1.0;
//       case 'cancelled':
//         return 0;
//       default:
//         return 0;
//     }
//   }

//   String _progressLabel(String s) {
//     switch (s) {
//       case 'draft':
//         return 'Menunggu dimulai...';
//       case 'in_progress':
//         return 'Sedang penghitungan fisik...';
//       case 'pending_approval':
//         return 'Menunggu persetujuan super admin...';
//       case 'approved':
//         return 'Selesai & disetujui';
//       case 'cancelled':
//         return 'Dibatalkan';
//       default:
//         return s;
//     }
//   }

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
//       case 'draft':
//         return _M('Draft', AppColors.textMuted, AppColors.bg);
//       case 'in_progress':
//         return _M('Berjalan', AppColors.info, AppColors.infoSoft);
//       case 'pending_approval':
//         return _M('Menunggu', AppColors.warning, AppColors.warningSoft);
//       case 'approved':
//         return _M('Disetujui', AppColors.success, AppColors.successSoft);
//       case 'cancelled':
//         return _M('Batal', AppColors.danger, AppColors.dangerSoft);
//       default:
//         return _M(s, AppColors.textMuted, AppColors.bg);
//     }
//   }
// }

// class _StatusBadge extends StatelessWidget {
//   final String label;
//   final Color color, bg;
//   const _StatusBadge(
//       {required this.label, required this.color, required this.bg});
//   @override
//   Widget build(BuildContext context) => Container(
//       padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
//       decoration:
//           BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
//       child: Text(label,
//           style: TextStyle(
//               fontSize: 10, fontWeight: FontWeight.w700, color: color)));
// }

// class _M {
//   final String label;
//   final Color color, bg;
//   const _M(this.label, this.color, this.bg);
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/data/model/response/stock_response_model.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/admin/opname_create_page.dart';
import 'package:warehouse/presentation/admin/opname_detail_page.dart';
import 'package:warehouse/presentation/bloc/admin/opname/opname_bloc.dart';

class OpnameListPage extends StatefulWidget {
  const OpnameListPage({super.key});

  @override
  State<OpnameListPage> createState() => _OpnameListPageState();
}

class _OpnameListPageState extends State<OpnameListPage> {
  String? _filterStatus;

  static const _tabs = [
    (label: 'Semua', value: null),
    (label: 'Draft', value: 'draft'),
    (label: 'Berjalan', value: 'in_progress'),
    (label: 'Menunggu', value: 'pending_approval'),
    (label: 'Selesai', value: 'approved'),
  ];

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    context.read<OpnameBloc>().add(OpnameEvent.load(status: _filterStatus));
  }

  // Navigasi ke halaman buat opname baru
  void _goToCreate() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<OpnameBloc>(),
          child: const OpnameCreatePage(),
        ),
      ),
    ).then((created) {
      if (created == true) _load();
    });
  }

  // Navigasi ke detail/worksheet
  void _goToDetail(StockOpnameModel opname) {
    HapticFeedback.selectionClick();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: context.read<OpnameBloc>(),
          child: OpnameDetailPage(opnameId: opname.id),
        ),
      ),
    ).then((_) => _load());
  }

  // Approve (dari list card)
  void _approve(StockOpnameModel opname) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        title: const Text('Setujui Opname?',
            style: TextStyle(fontWeight: FontWeight.w700)),
        content: Text(
          'Stok untuk ${opname.itemsWithDifference.length} item akan disesuaikan sesuai hasil hitung fisik.',
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: const Text('Batal')),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<OpnameBloc>().add(OpnameEvent.approve(opname.id));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: const Text('Setujui', style: TextStyle(color: Colors.white)),
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
        title: const Text('Stock Opname'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.text,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _goToCreate,
            tooltip: 'Buat Opname Baru',
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(44),
          child: _buildFilterTabs(),
        ),
      ),
      body: BlocConsumer<OpnameBloc, OpnameState>(
        listener: (ctx, state) {
          state.maybeWhen(
            actionSuccess: (msg, _) {
              _load();
              ScaffoldMessenger.of(ctx).showSnackBar(
                SnackBar(
                    content: Text(msg), backgroundColor: Colors.green.shade600),
              );
            },
            error: (msg) {
              ScaffoldMessenger.of(ctx).showSnackBar(
                SnackBar(content: Text(msg), backgroundColor: Colors.red),
              );
            },
            orElse: () {},
          );
        },
        builder: (ctx, state) => state.maybeWhen(
          loading: () => const Center(child: CircularProgressIndicator()),
          listLoaded: (res) => res.data.isEmpty
              ? _buildEmpty()
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: res.data.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (_, i) => _OpnameCard(
                    opname: res.data[i],
                    onTap: () => _goToDetail(res.data[i]),
                    onApprove: res.data[i].status == 'pending_approval'
                        ? () => _approve(res.data[i])
                        : null,
                  ),
                ),
          error: (msg) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline,
                    size: 40, color: AppColors.textMuted),
                const SizedBox(height: 8),
                Text(msg, style: const TextStyle(color: AppColors.textMuted)),
                const SizedBox(height: 12),
                TextButton(onPressed: _load, child: const Text('Coba Lagi')),
              ],
            ),
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        children: _tabs.map((tab) {
          final active = _filterStatus == tab.value;
          return GestureDetector(
            onTap: () {
              setState(() => _filterStatus = tab.value);
              _load();
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: active ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: active ? AppColors.primary : AppColors.border,
                ),
              ),
              child: Text(
                tab.label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: active ? Colors.white : AppColors.textMuted,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.assignment_outlined,
              size: 56, color: AppColors.textMuted.withOpacity(0.3)),
          const SizedBox(height: 12),
          const Text('Belum ada opname',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted)),
          const SizedBox(height: 6),
          const Text(
            'Tap tombol + untuk buat opname baru',
            style: TextStyle(fontSize: 13, color: AppColors.textMuted),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _goToCreate,
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Buat Opname'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────
// Card opname di list
// ─────────────────────────────────────────────────────────────────────────
class _OpnameCard extends StatelessWidget {
  final StockOpnameModel opname;
  final VoidCallback onTap;
  final VoidCallback? onApprove;

  const _OpnameCard({
    required this.opname,
    required this.onTap,
    this.onApprove,
  });

  @override
  Widget build(BuildContext context) {
    final fmt = DateFormat('dd MMM yyyy');
    String dateStr = opname.opnameDate;
    try {
      dateStr = fmt.format(DateTime.parse(opname.opnameDate));
    } catch (_) {}

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        padding: const EdgeInsets.all(14),
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
                        opname.opnameNumber,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                      Text(
                        opname.warehouseName,
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
                _StatusBadge(status: opname.status),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.calendar_today_outlined,
                    size: 13, color: AppColors.textMuted),
                const SizedBox(width: 4),
                Text(dateStr,
                    style: const TextStyle(
                        fontSize: 12, color: AppColors.textMuted)),
                const SizedBox(width: 12),
                const Icon(Icons.inventory_2_outlined,
                    size: 13, color: AppColors.textMuted),
                const SizedBox(width: 4),
                Text(
                  '${opname.totalCount} item',
                  style:
                      const TextStyle(fontSize: 12, color: AppColors.textMuted),
                ),
                if (opname.status == 'in_progress') ...[
                  const SizedBox(width: 12),
                  Text(
                    '${opname.filledCount}/${opname.totalCount} diisi',
                    style:
                        const TextStyle(fontSize: 12, color: AppColors.primary),
                  ),
                ],
              ],
            ),
            // Progress bar untuk in_progress
            if (opname.status == 'in_progress') ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: opname.fillProgress,
                  backgroundColor: AppColors.border,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  minHeight: 4,
                ),
              ),
            ],
            // Tombol approve
            if (onApprove != null) ...[
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onApprove,
                  icon: const Icon(Icons.check_circle_outline, size: 16),
                  label: Text(
                    opname.itemsWithDifference.isEmpty
                        ? 'Setujui Opname'
                        : 'Setujui (${opname.itemsWithDifference.length} item berubah)',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade600,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String label;
    switch (status) {
      case 'draft':
        color = Colors.grey.shade600;
        label = 'Draft';
        break;
      case 'in_progress':
        color = Colors.blue.shade600;
        label = 'Berjalan';
        break;
      case 'pending_approval':
        color = Colors.orange.shade700;
        label = 'Menunggu';
        break;
      case 'approved':
        color = Colors.green.shade600;
        label = 'Selesai';
        break;
      case 'cancelled':
        color = Colors.red.shade600;
        label = 'Batal';
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
      ),
      child: Text(
        label,
        style:
            TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700),
      ),
    );
  }
}
