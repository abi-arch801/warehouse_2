import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/data/model/response/stock_response_model.dart';
import 'package:warehouse/presentation/bloc/admin/activity/activity_bloc.dart';
import 'admin_activity_page.dart'; // import ActivitySectionCard & ActivityInfoRow

class ActivityDetailPage extends StatefulWidget {
  final int activityId;
  const ActivityDetailPage({super.key, required this.activityId});

  @override
  State<ActivityDetailPage> createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<ActivityBloc>()
        .add(ActivityEvent.getDetail(widget.activityId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Detail Aktivitas',
          style: TextStyle(
              color: Color(0xFF1A1D1E),
              fontWeight: FontWeight.w700,
              fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF1A1D1E)),
      ),
      body: BlocBuilder<ActivityBloc, ActivityState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
            ),
            error: (msg) => Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline,
                      color: Color(0xFFDC3545), size: 48),
                  const SizedBox(height: 12),
                  Text(msg, style: const TextStyle(color: Color(0xFF6C757D))),
                ],
              ),
            ),
            detailLoaded: (a) {
              final cfg = _typeCfg(a.type);
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildHeroCard(a, cfg),
                    const SizedBox(height: 12),
                    _buildInfoCard(a),
                    const SizedBox(height: 12),
                    if (a.referenceType != null) _buildReferenceCard(a),
                    const SizedBox(height: 12),
                    if (a.note != null && a.note!.isNotEmpty)
                      _buildNotesCard(a.note!),
                    const SizedBox(height: 24),
                  ],
                ),
              );
            },
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }

  // ── Hero card ────────────────────────────────────────────────────────────

  Widget _buildHeroCard(StockMovementModel a, Map<String, dynamic> cfg) {
    final isPositive = a.type == 'in' || a.type == 'transfer_in';
    final productName = a.product?['name'] as String? ?? '-';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            cfg['color'] as Color,
            (cfg['color'] as Color).withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: (cfg['color'] as Color).withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle),
            child: Icon(cfg['icon'] as IconData, color: Colors.white, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            '${isPositive ? '+' : '-'}${a.quantity} Unit',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800, fontSize: 28),
          ),
          const SizedBox(height: 4),
          Text(cfg['label'] as String,
              style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text(
            productName,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // ── Info card ────────────────────────────────────────────────────────────

  Widget _buildInfoCard(StockMovementModel a) {
    final productName = a.product?['name'] as String? ?? '-';
    final sku = a.product?['sku'] as String?;
    final warehouseName = a.warehouse?['name'] as String? ?? '-';
    final createdByName = a.createdBy?.toString();
    return ActivitySectionCard(
      title: 'Informasi Transaksi',
      children: [
        ActivityInfoRow(label: 'ID Transaksi', value: '#${a.id}'),
        ActivityInfoRow(label: 'Gudang', value: warehouseName),
        ActivityInfoRow(label: 'Produk', value: productName),
        if (sku != null) ActivityInfoRow(label: 'SKU', value: sku),
        ActivityInfoRow(label: 'Jumlah', value: '${a.quantity} unit'),
        ActivityInfoRow(
            label: 'Stok Sebelum', value: '${a.quantityBefore ?? '-'}'),
        ActivityInfoRow(
            label: 'Stok Sesudah', value: '${a.quantityAfter ?? '-'}'),
        ActivityInfoRow(label: 'Tanggal', value: _formatDate(a.createdAt)),
        if (createdByName != null)
          ActivityInfoRow(label: 'Dilakukan oleh', value: createdByName),
      ],
    );
  }

  // ── Reference card ───────────────────────────────────────────────────────

  Widget _buildReferenceCard(StockMovementModel a) {
    return ActivitySectionCard(
      title: 'Referensi',
      children: [
        ActivityInfoRow(label: 'Tipe', value: _refTypeLabel(a.referenceType)),
        if (a.referenceId != null)
          ActivityInfoRow(label: 'ID Referensi', value: '#${a.referenceId}'),

        // Badge khusus request
        if (a.referenceType == 'request') ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFF6C63FF).withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: const Color(0xFF6C63FF).withValues(alpha: 0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.assignment_outlined,
                    size: 14, color: Color(0xFF6C63FF)),
                SizedBox(width: 6),
                Flexible(
                  child: Text(
                    'Stok keluar dari permintaan barang user',
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6C63FF),
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  // ── Notes card ───────────────────────────────────────────────────────────

  Widget _buildNotesCard(String note) {
    return ActivitySectionCard(
      title: 'Catatan',
      children: [
        Text(note,
            style: const TextStyle(
                color: Color(0xFF495057), fontSize: 14, height: 1.5)),
      ],
    );
  }

  // ── Helpers ──────────────────────────────────────────────────────────────

  Map<String, dynamic> _typeCfg(String type) {
    switch (type) {
      case 'in':
        return {
          'icon': Icons.arrow_downward,
          'color': const Color(0xFF0E9B6A),
          'label': 'Stok Masuk'
        };
      case 'out':
        return {
          'icon': Icons.arrow_upward,
          'color': const Color(0xFFDC3545),
          'label': 'Stok Keluar'
        };
      case 'transfer_out':
        return {
          'icon': Icons.swap_horiz,
          'color': const Color(0xFF6C63FF),
          'label': 'Transfer Keluar'
        };
      case 'transfer_in':
        return {
          'icon': Icons.call_received,
          'color': const Color(0xFF0E9B6A),
          'label': 'Transfer Masuk'
        };
      case 'adjustment':
        return {
          'icon': Icons.tune,
          'color': const Color(0xFFE6A817),
          'label': 'Penyesuaian'
        };
      default:
        return {
          'icon': Icons.swap_vert,
          'color': const Color(0xFF6C757D),
          'label': type
        };
    }
  }

  String _refTypeLabel(String? type) {
    switch (type) {
      case 'purchase_order':
        return 'Purchase Order';
      case 'stock_transfer':
        return 'Transfer Stok';
      case 'stock_opname':
        return 'Stock Opname';
      case 'request':
        return 'Permintaan Barang';
      default:
        return type ?? '-';
    }
  }

  String _formatDate(String? dt) {
    if (dt == null || dt.isEmpty) return '-';
    try {
      return DateFormat('dd MMM yyyy, HH:mm').format(DateTime.parse(dt));
    } catch (_) {
      return dt;
    }
  }
}
