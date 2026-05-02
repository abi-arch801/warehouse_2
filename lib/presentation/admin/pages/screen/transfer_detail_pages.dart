import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import '../data/mock_data.dart';
import '../theme/app_theme.dart';

class TransferDetailScreen extends StatefulWidget {
  final String transferId;
  final AppUser currentUser;
  const TransferDetailScreen({
    super.key,
    required this.transferId,
    required this.currentUser,
  });

  @override
  State<TransferDetailScreen> createState() => _TransferDetailScreenState();
}

class _TransferDetailScreenState extends State<TransferDetailScreen> {
  bool _processing = false;

  Future<bool> _confirm(String title, String msg, Color color) async {
    final v = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(title),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: color),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Konfirmasi'),
          ),
        ],
      ),
    );
    return v ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final t = db.transfers.firstWhere((x) => x.id == widget.transferId);
    final from = db.warehouseById(t.fromWarehouseId);
    final to = db.warehouseById(t.toWarehouseId);
    final isSuper = widget.currentUser.role == UserRole.superAdmin;

    return Scaffold(
      appBar: AppBar(title: Text(t.code)),
      bottomNavigationBar: _buildActions(t, isSuper),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.info, AppColors.accent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.info.withValues(alpha: 0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(t.code,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700)),
                    ),
                    _statusChip(t.status, onWhite: true),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Dari',
                              style: TextStyle(color: Colors.white70)),
                          Text(from?.name ?? '-',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_rounded,
                        color: Colors.white),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('Ke',
                              style: TextStyle(color: Colors.white70)),
                          Text(to?.name ?? '-',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(DateFormat('d MMMM yyyy').format(t.createdAt),
                    style: const TextStyle(
                        color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text('Item Transfer',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          ...t.items.map((it) {
            final p = db.productById(it.productId);
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.infoSoft,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.inventory_2_rounded,
                        color: AppColors.info, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(p?.name ?? '-',
                        style:
                            const TextStyle(fontWeight: FontWeight.w700)),
                  ),
                  Text('${it.quantity} ${p?.unit ?? ''}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: AppColors.info)),
                ],
              ),
            );
          }),
          const SizedBox(height: 20),
          _timeline(t.status),
        ],
      ),
    );
  }

  Widget? _buildActions(StockTransfer t, bool isSuper) {
    if (t.status == DocStatus.received) return null;

    Future<void> approve() async {
      if (!await _confirm('Setujui transfer?',
          'Transfer ${t.code} akan dilanjut ke pengiriman.',
          AppColors.primary)) {
        return;
      }
      setState(() => t.status = DocStatus.approved);
      HapticFeedback.heavyImpact();
    }

    Future<void> ship() async {
      if (!await _confirm('Kirim barang?',
          'Stok akan dikurangi dari gudang asal sekarang.',
          AppColors.accent)) {
        return;
      }
      setState(() => _processing = true);
      await Future.delayed(const Duration(milliseconds: 600));
      final db = MockDB.instance;
      setState(() {
        t.status = DocStatus.inTransit;
        for (final it in t.items) {
          final stock = db.stockOf(it.productId, t.fromWarehouseId);
          if (stock != null) {
            final before = stock.quantity;
            final qty = it.quantity.clamp(0, stock.quantity);
            stock.quantity -= qty;
            db.movements.add(StockMovement(
              id: 'm${DateTime.now().microsecondsSinceEpoch}',
              productId: it.productId,
              warehouseId: t.fromWarehouseId,
              type: MovementType.transfer,
              quantity: qty,
              qtyBefore: before,
              qtyAfter: stock.quantity,
              note: 'Pengiriman transfer ${t.code}',
              date: DateTime.now(),
              reference: t.code,
            ));
          }
        }
        _processing = false;
      });
      HapticFeedback.heavyImpact();
    }

    Future<void> receive() async {
      if (!await _confirm('Tandai diterima?',
          'Stok akan ditambahkan ke gudang tujuan.', AppColors.success)) {
        return;
      }
      setState(() => _processing = true);
      await Future.delayed(const Duration(milliseconds: 600));
      final db = MockDB.instance;
      setState(() {
        t.status = DocStatus.received;
        for (final it in t.items) {
          final stock = db.stockOf(it.productId, t.toWarehouseId);
          final before = stock?.quantity ?? 0;
          if (stock != null) {
            stock.quantity += it.quantity;
          } else {
            db.stocks.add(Stock(
              productId: it.productId,
              warehouseId: t.toWarehouseId,
              quantity: it.quantity,
            ));
          }
          db.movements.add(StockMovement(
            id: 'm${DateTime.now().microsecondsSinceEpoch}',
            productId: it.productId,
            warehouseId: t.toWarehouseId,
            type: MovementType.inbound,
            quantity: it.quantity,
            qtyBefore: before,
            qtyAfter: before + it.quantity,
            note: 'Penerimaan transfer ${t.code}',
            date: DateTime.now(),
            reference: t.code,
          ));
        }
        _processing = false;
      });
      HapticFeedback.heavyImpact();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Stok masuk ke gudang tujuan'),
          backgroundColor: AppColors.success,
        ),
      );
    }

    Widget btn;
    if (t.status == DocStatus.pending && isSuper) {
      btn = ElevatedButton(
        onPressed: _processing ? null : approve,
        child: const Text('Setujui Transfer'),
      );
    } else if (t.status == DocStatus.approved) {
      btn = ElevatedButton.icon(
        icon: _processing
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2.4))
            : const Icon(Icons.local_shipping_rounded),
        label: Text(_processing ? 'Mengirim...' : 'Kirim Barang'),
        onPressed: _processing ? null : ship,
      );
    } else if (t.status == DocStatus.inTransit) {
      btn = ElevatedButton.icon(
        icon: _processing
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                    color: Colors.white, strokeWidth: 2.4))
            : const Icon(Icons.inventory_rounded),
        label: Text(_processing ? 'Memproses...' : 'Tandai Diterima'),
        onPressed: _processing ? null : receive,
      );
    } else {
      return null;
    }

    return SafeArea(
      child: Padding(padding: const EdgeInsets.all(16), child: btn),
    );
  }

  Widget _timeline(DocStatus status) {
    final order = [
      DocStatus.pending,
      DocStatus.approved,
      DocStatus.inTransit,
      DocStatus.received,
    ];
    final labels = ['Diajukan', 'Disetujui', 'Dikirim', 'Diterima'];
    final activeIdx = order.indexOf(status);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Riwayat alur',
              style: TextStyle(fontWeight: FontWeight.w700)),
          const SizedBox(height: 14),
          for (int i = 0; i < labels.length; i++) ...[
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color:
                        i <= activeIdx ? AppColors.info : AppColors.border,
                    shape: BoxShape.circle,
                  ),
                  child: i <= activeIdx
                      ? const Icon(Icons.check,
                          size: 14, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 10),
                Text(labels[i],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: i <= activeIdx
                          ? AppColors.text
                          : AppColors.textMuted,
                    )),
              ],
            ),
            if (i != labels.length - 1)
              Padding(
                padding: const EdgeInsets.only(left: 11),
                child: Container(
                  width: 2,
                  height: 22,
                  color:
                      i < activeIdx ? AppColors.info : AppColors.border,
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _statusChip(DocStatus status, {bool onWhite = false}) {
    Color color;
    String label;
    switch (status) {
      case DocStatus.pending:
        color = AppColors.warning;
        label = 'Menunggu';
        break;
      case DocStatus.approved:
        color = AppColors.info;
        label = 'Disetujui';
        break;
      case DocStatus.inTransit:
        color = AppColors.accent;
        label = 'Dikirim';
        break;
      case DocStatus.received:
        color = AppColors.success;
        label = 'Diterima';
        break;
      default:
        color = AppColors.textMuted;
        label = status.name;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: onWhite ? Colors.white : color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label,
          style: TextStyle(
              color: color, fontWeight: FontWeight.w700, fontSize: 11)),
    );
  }
}
