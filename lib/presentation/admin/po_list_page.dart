// lib/presentation/admin/pages/po/po_list_page.dart
// Perubahan: _showCreateSheet → navigasi ke PoFormPage

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/model/response/po_response_model.dart';
import 'package:warehouse/presentation/admin/app_theme.dart';
import 'package:warehouse/presentation/admin/po_form_page.dart';
import 'package:warehouse/presentation/bloc/admin/po/po_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/supplier/supplier_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_warehouse/admin_warehouse_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_product/admin_product_bloc.dart';
import 'package:warehouse/data/model/response/po_response_model.dart';
import 'package:warehouse/data/datasource/admin/purchase_order_datasource.dart';

class PoListPage extends StatefulWidget {
  const PoListPage({super.key});
  @override
  State<PoListPage> createState() => _PoListPageState();
}

class _PoListPageState extends State<PoListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tab;
  static const _statuses = [
    null,
    'pending',
    'approved',
    'received',
    'cancelled'
  ];
  static const _labels = ['Semua', 'Pending', 'Disetujui', 'Diterima', 'Batal'];

  // void _showReceiveSheet(BuildContext ctx, PurchaseOrderModel po) {

  //   // Buat controller qty per item
  //   final controllers = {
  //     for (final item in po.items)
  //       item.id: TextEditingController(
  //         text: item.remainingQty.toString(),
  //       )
  //   };

  //   showModalBottomSheet(
  //     context: ctx,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (_) => BlocProvider.value(
  //       value: ctx.read<PoBloc>(),
  //       child: _ReceiveSheet(po: po, controllers: controllers),
  //     ),
  //   ).whenComplete(() {
  //     for (final c in controllers.values) c.dispose();
  //   });
  // }

  void _showReceiveSheet(BuildContext ctx, PurchaseOrderModel po) async {
    // Tampilkan loading dulu
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    // Ambil detail PO (yang sudah include items)
    final ds = PurchaseOrderDatasource();
    final result = await ds.getDetail(po.id);

    if (!ctx.mounted) return;
    Navigator.pop(ctx); // tutup loading

    result.fold(
      (err) => ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text(err), backgroundColor: Colors.red),
      ),
      (res) {
        final poDetail = res.data;
        if (poDetail == null || poDetail.items.isEmpty) {
          ScaffoldMessenger.of(ctx).showSnackBar(
            const SnackBar(
              content: Text('Tidak ada item pada PO ini.'),
              backgroundColor: Colors.orange,
            ),
          );
          return;
        }

        final controllers = {
          for (final item in poDetail.items)
            item.id: TextEditingController(text: item.remainingQty.toString())
        };

        showModalBottomSheet(
          context: ctx,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => BlocProvider.value(
            value: ctx.read<PoBloc>(),
            child: _ReceiveSheet(po: poDetail, controllers: controllers),
          ),
        ).whenComplete(() {
          for (final c in controllers.values) c.dispose();
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: _statuses.length, vsync: this);
    _tab.addListener(() {
      if (!_tab.indexIsChanging) {
        context.read<PoBloc>().add(PoEvent.filter(_statuses[_tab.index]));
      }
    });
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        title: const Text('Purchase Order'),
        backgroundColor: AppColors.surface,
        bottom: TabBar(
          controller: _tab,
          isScrollable: true,
          indicatorColor: AppColors.primary,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textMuted,
          labelStyle:
              const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
          tabAlignment: TabAlignment.start,
          tabs: _labels.map((l) => Tab(text: l)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openForm(context),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Buat PO'),
      ),
      body: BlocConsumer<PoBloc, PoState>(
        listener: (ctx, state) => state.maybeWhen(
          actionSuccess: (msg, _) {
            ScaffoldMessenger.of(ctx)
                .showSnackBar(_snack(msg, AppColors.success));
            ctx.read<PoBloc>().add(PoEvent.filter(_statuses[_tab.index]));
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
                      .read<PoBloc>()
                      .add(PoEvent.filter(_statuses[_tab.index])),
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
                              offset: Offset(0, (1 - v) * 12), child: child)),
                      child: _PoCard(
                        po: res.data[i],
                        onReceive: () => _showReceiveSheet(ctx, res.data[i]),
                      ),
                    ),
                  ),
                ),
          detailLoaded: (_) => const SizedBox.shrink(),
          actionSuccess: (_, __) =>
              const Center(child: CircularProgressIndicator()),
          error: (msg) => _errorState(ctx, msg),
        ),
      ),
    );
  }

  // ── Navigasi ke form ──────────────────────────────────────────────────────
  // Future<void> _openForm(BuildContext ctx) async {
  //   final bloc = ctx.read<PoBloc>();
  //   final result = await Navigator.push<bool>(
  //     ctx,
  //     MaterialPageRoute(
  //       builder: (_) => BlocProvider.value(
  //         value: bloc,
  //         child: const PoFormPage(),
  //       ),
  //     ),
  //   );
  //   // Jika form submit sukses, reload list
  //   if (result == true && mounted) {
  //     bloc.add(PoEvent.filter(_statuses[_tab.index]));
  //   }
  // }

  Future<void> _openForm(BuildContext ctx) async {
    final bloc = ctx.read<PoBloc>();
    final result = await Navigator.push<bool>(
      ctx,
      MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: bloc),
            BlocProvider(
              create: (_) =>
                  SupplierBloc()..add(const SupplierEvent.loadSuppliers()),
            ),
            BlocProvider(
              create: (_) =>
                  AdminWarehouseBloc()..add(const AdminWarehouseEvent.load()),
            ),
            BlocProvider(
              create: (_) =>
                  AdminProductBloc()..add(const AdminProductEvent.load()),
            ),
          ],
          child: const PoFormPage(),
        ),
      ),
    );
    if (result == true && mounted) {
      bloc.add(PoEvent.filter(_statuses[_tab.index]));
    }
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
              child: const Icon(Icons.receipt_long_outlined,
                  color: AppColors.primary, size: 32)),
          const SizedBox(height: 14),
          const Text('Belum ada Purchase Order',
              style: TextStyle(color: AppColors.textMuted, fontSize: 14)),
        ],
      ));

  Widget _errorState(BuildContext ctx, String msg) => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: AppColors.danger),
          const SizedBox(height: 12),
          Text(msg, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () => ctx.read<PoBloc>().add(const PoEvent.load()),
              child: const Text('Coba Lagi')),
        ],
      ));

  SnackBar _snack(String msg, Color color) => SnackBar(
      content: Text(msg),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
}

// ── PO Card (tidak berubah) ───────────────────────────────────────────────────
class _PoCard extends StatelessWidget {
  final PurchaseOrderModel po;
  final VoidCallback? onReceive;
  const _PoCard({required this.po, this.onReceive});

  @override
  Widget build(BuildContext context) {
    final meta = _statusMeta(po.status);
    final supp =
        po.supplier?['name']?.toString() ?? 'Supplier #${po.supplierId}';
    final wh = po.warehouse?['name']?.toString() ?? 'Gudang #${po.warehouseId}';

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
                offset: const Offset(0, 2))
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(po.poNumber,
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 14)),
                  const SizedBox(height: 2),
                  Text(supp,
                      style: const TextStyle(
                          color: AppColors.textMuted, fontSize: 12)),
                ])),
            _StatusBadge(label: meta.label, color: meta.color, bg: meta.bg),
          ]),
          const SizedBox(height: 10),
          Divider(height: 1, color: Colors.grey.shade100),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(child: _detail(Icons.warehouse_outlined, 'Gudang', wh)),
            Expanded(
                child: _detail(Icons.calendar_today_outlined, 'Tanggal',
                    _fmtDate(po.orderDate))),
            Expanded(
                child: _detail(Icons.inventory_2_outlined, 'Item',
                    '${po.items.length} item')),
          ]),
          const SizedBox(height: 10),
          Row(children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                    color: AppColors.primarySoft,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(po.formattedTotal,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                        fontSize: 13))),
            const Spacer(),
            if (po.status == 'pending')
              GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    context.read<PoBloc>().add(PoEvent.approve(po.id));
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          color: AppColors.successSoft,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppColors.success.withOpacity(.3))),
                      child: const Row(children: [
                        Icon(Icons.check_rounded,
                            color: AppColors.success, size: 14),
                        SizedBox(width: 4),
                        Text('Setujui',
                            style: TextStyle(
                                color: AppColors.success,
                                fontWeight: FontWeight.w700,
                                fontSize: 12)),
                      ]))),
            if (po.status == 'approved')
              GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    onReceive?.call(); // ← ganti ini
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          color: AppColors.infoSoft,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              color: AppColors.info.withOpacity(.3))),
                      child: const Row(children: [
                        Icon(Icons.download_rounded,
                            color: AppColors.info, size: 14),
                        SizedBox(width: 4),
                        Text('Terima',
                            style: TextStyle(
                                color: AppColors.info,
                                fontWeight: FontWeight.w700,
                                fontSize: 12)),
                      ]))),
          ]),
        ]),
      ),
    );
  }

  Widget _detail(IconData icon, String label, String val) =>
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, size: 12, color: AppColors.primary),
        const SizedBox(width: 4),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 9,
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w600)),
          Text(val,
              style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ])),
      ]);

  String _fmtDate(String raw) {
    try {
      final dt = DateTime.parse(raw).toLocal();
      return '${dt.day}/${dt.month}/${dt.year}';
    } catch (_) {
      return raw;
    }
  }

  _Meta _statusMeta(String s) {
    switch (s) {
      case 'pending':
        return _Meta('Pending', AppColors.warning, AppColors.warningSoft);
      case 'approved':
        return _Meta('Disetujui', AppColors.info, AppColors.infoSoft);
      case 'received':
        return _Meta('Diterima', AppColors.success, AppColors.successSoft);
      case 'cancelled':
        return _Meta('Batal', AppColors.danger, AppColors.dangerSoft);
      case 'partial':
        return _Meta('Sebagian', AppColors.accent, AppColors.accentSoft);
      default:
        return _Meta(s, AppColors.textMuted, AppColors.bg);
    }
  }
}

class _ReceiveSheet extends StatefulWidget {
  final PurchaseOrderModel po;
  final Map<int, TextEditingController> controllers;
  const _ReceiveSheet({required this.po, required this.controllers});

  @override
  State<_ReceiveSheet> createState() => _ReceiveSheetState();
}

class _ReceiveSheetState extends State<_ReceiveSheet> {
  void _submit() {
    final items = <Map<String, dynamic>>[];
    for (final item in widget.po.items) {
      final qty = int.tryParse(widget.controllers[item.id]?.text ?? '0') ?? 0;
      if (qty > 0) {
        items.add({
          'purchase_order_item_id': item.id,
          'quantity_received': qty,
        });
      }
    }

    if (items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Masukkan minimal 1 item dengan qty > 0'),
        backgroundColor: Colors.red,
      ));
      return;
    }

    context.read<PoBloc>().add(PoEvent.receive(id: widget.po.id, items: items));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(
          20, 16, 20, MediaQuery.of(context).viewInsets.bottom + 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle
          Center(
            child: Container(
              width: 36,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),

          Text('Terima Barang — ${widget.po.poNumber}',
              style:
                  const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
          const SizedBox(height: 4),
          const Text(
            'Masukkan jumlah barang yang benar-benar diterima.',
            style: TextStyle(color: AppColors.textMuted, fontSize: 12),
          ),
          const SizedBox(height: 16),

          // List item
          ...widget.po.items.map((item) {
            final productName = item.product?['name']?.toString() ??
                'Produk #${item.productId}';
            final remaining = item.remainingQty;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(productName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 13),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        Text(
                          'Sisa: $remaining dari ${item.quantityOrdered}',
                          style: const TextStyle(
                              fontSize: 11, color: AppColors.textMuted),
                        ),
                      ]),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  width: 80,
                  child: TextFormField(
                    controller: widget.controllers[item.id],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.border),
                      ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
              ]),
            );
          }),

          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.info,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Text('Konfirmasi Penerimaan',
                style: TextStyle(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color, bg;
  const _StatusBadge(
      {required this.label, required this.color, required this.bg});

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(label,
          style: TextStyle(
              fontSize: 10, fontWeight: FontWeight.w700, color: color)));
}

class _Meta {
  final String label;
  final Color color, bg;
  const _Meta(this.label, this.color, this.bg);
}
