import 'package:flutter/material.dart';
import 'package:warehouse/data/model/response/notification_response_model.dart';

class NotificationDetailPage extends StatelessWidget {
  final NotificationModel notification;

  const NotificationDetailPage({super.key, required this.notification});

  static const _primary = Color(0xFF0288D1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F9FF),
      appBar: AppBar(
        title: const Text('Detail Notifikasi'),
        backgroundColor: _primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header: icon + judul + tanggal lengkap ─────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: _iconColor(notification.type).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(_iconData(notification.type),
                      color: _iconColor(notification.type), size: 28),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _formatFullDate(notification.createdAt),
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── Isi lengkap (gak dipotong) ──────────────────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2)),
                ],
              ),
              child: Text(
                notification.body,
                style: const TextStyle(fontSize: 14, height: 1.6),
              ),
            ),

            // ── Data tambahan (request_id, reason, dll) ─────────────
            if (notification.data != null &&
                notification.data!.isNotEmpty) ...[
              const SizedBox(height: 20),
              const Text(
                'Informasi Tambahan',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2)),
                  ],
                ),
                child: Column(
                  children: notification.data!.entries
                      .map((e) =>
                          _DetailRow(label: _labelFor(e.key), value: '${e.value}'))
                      .toList(),
                ),
              ),
            ],

            const SizedBox(height: 24),
            Row(
              children: [
                Icon(
                  notification.isRead
                      ? Icons.mark_email_read_outlined
                      : Icons.mark_email_unread_outlined,
                  size: 16,
                  color: notification.isRead ? Colors.grey : _primary,
                ),
                const SizedBox(width: 6),
                Text(
                  notification.isRead ? 'Sudah dibaca' : 'Belum dibaca',
                  style: TextStyle(
                      fontSize: 12,
                      color: notification.isRead ? Colors.grey : _primary,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _labelFor(String key) {
    switch (key) {
      case 'request_id':
        return 'ID Permintaan';
      case 'reason':
        return 'Alasan';
      case 'warehouse_id':
        return 'ID Gudang';
      default:
        return key;
    }
  }

  IconData _iconData(String type) {
    switch (type) {
      case 'request_approved':
        return Icons.check_circle_outline;
      case 'request_rejected':
        return Icons.cancel_outlined;
      case 'request_completed':
        return Icons.done_all;
      case 'request_created':
        return Icons.assignment_outlined;
      case 'request_cancelled':
        return Icons.block_outlined;
      default:
        return Icons.notifications_outlined;
    }
  }

  Color _iconColor(String type) {
    switch (type) {
      case 'request_approved':
        return Colors.green;
      case 'request_rejected':
        return Colors.red;
      case 'request_completed':
        return Colors.blue;
      case 'request_created':
        return Colors.orange;
      case 'request_cancelled':
        return Colors.grey;
      default:
        return Colors.orange;
    }
  }

  String _formatFullDate(String raw) {
    try {
      final dt = DateTime.parse(raw).toLocal();
      const bulan = [
        'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
        'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
      ];
      final jam = dt.hour.toString().padLeft(2, '0');
      final menit = dt.minute.toString().padLeft(2, '0');
      return '${dt.day} ${bulan[dt.month - 1]} ${dt.year}, $jam:$menit';
    } catch (_) {
      return raw;
    }
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(label,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
          ),
          Expanded(
            child: Text(value,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}