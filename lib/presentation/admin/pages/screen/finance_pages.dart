import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class FinanceSyncScreen extends StatefulWidget {
  final AppUser currentUser;
  const FinanceSyncScreen({super.key, required this.currentUser});

  @override
  State<FinanceSyncScreen> createState() => _FinanceSyncScreenState();
}

class _FinanceSyncScreenState extends State<FinanceSyncScreen>
    with SingleTickerProviderStateMixin {
  FinanceSyncStatus? _filter;
  bool _syncing = false;
  late final AnimationController _spin;
  final _rupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );
  final _date = DateFormat('d MMM yyyy · HH:mm');

  @override
  void initState() {
    super.initState();
    _spin = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _spin.dispose();
    super.dispose();
  }

  Future<void> _runSync() async {
    HapticFeedback.heavyImpact();
    setState(() => _syncing = true);
    _spin.repeat();
    await Future.delayed(const Duration(milliseconds: 1400));
    final db = MockDB.instance;
    int retried = 0;
    for (final log in db.financeSyncLogs) {
      if (log.status != FinanceSyncStatus.synced) {
        log.status = FinanceSyncStatus.synced;
        retried++;
      }
    }
    _spin.stop();
    _spin.reset();
    if (!mounted) return;
    setState(() => _syncing = false);
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.success,
        content: Text(retried == 0
            ? 'Semua jurnal sudah tersinkron'
            : '$retried entri berhasil disinkronkan ulang'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final all = [...db.financeSyncLogs]
      ..sort((a, b) => b.syncedAt.compareTo(a.syncedAt));
    final filtered =
        _filter == null ? all : all.where((l) => l.status == _filter).toList();

    final totalAmount = all.fold<double>(0, (s, l) => s + l.amount);
    final pending =
        all.where((l) => l.status == FinanceSyncStatus.pending).length;
    final failed =
        all.where((l) => l.status == FinanceSyncStatus.failed).length;
    final synced =
        all.where((l) => l.status == FinanceSyncStatus.synced).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sinkron Keuangan'),
        actions: [
          IconButton(
            tooltip: 'Sinkron ulang',
            onPressed: _syncing ? null : _runSync,
            icon: RotationTransition(
              turns: _spin,
              child: const Icon(Icons.refresh_rounded),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.accent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total nilai jurnal periode ini',
                  style: TextStyle(color: Colors.white70, fontSize: 12.5),
                ),
                const SizedBox(height: 6),
                Text(
                  _rupiah.format(totalAmount),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                        child: _stat('Tersinkron', synced.toString(),
                            Icons.check_circle_rounded)),
                    const SizedBox(width: 8),
                    Expanded(
                        child: _stat('Menunggu', pending.toString(),
                            Icons.hourglass_top_rounded)),
                    const SizedBox(width: 8),
                    Expanded(
                        child: _stat('Gagal', failed.toString(),
                            Icons.error_outline_rounded)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 36,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _chip('Semua', null),
                const SizedBox(width: 8),
                _chip('Tersinkron', FinanceSyncStatus.synced),
                const SizedBox(width: 8),
                _chip('Menunggu', FinanceSyncStatus.pending),
                const SizedBox(width: 8),
                _chip('Gagal', FinanceSyncStatus.failed),
              ],
            ),
          ),
          const SizedBox(height: 12),
          if (filtered.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Column(
                children: [
                  Icon(Icons.receipt_long_rounded,
                      size: 56,
                      color: AppColors.textMuted.withValues(alpha: 0.6)),
                  const SizedBox(height: 12),
                  const Text('Belum ada jurnal pada filter ini',
                      style: TextStyle(color: AppColors.textMuted)),
                ],
              ),
            )
          else
            ...filtered.asMap().entries.map((e) {
              final i = e.key;
              final log = e.value;
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration:
                    Duration(milliseconds: 250 + (i * 60).clamp(0, 600)),
                curve: Curves.easeOut,
                builder: (_, v, child) => Opacity(
                  opacity: v,
                  child: Transform.translate(
                    offset: Offset(0, (1 - v) * 12),
                    child: child,
                  ),
                ),
                child: _logCard(log),
              );
            }),
        ],
      ),
    );
  }

  Widget _stat(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 18),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 16)),
          Text(label,
              style: const TextStyle(
                  color: Colors.white70, fontSize: 11)),
        ],
      ),
    );
  }

  Widget _chip(String label, FinanceSyncStatus? status) {
    final selected = _filter == status;
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        setState(() => _filter = status);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surface,
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.text,
            fontWeight: FontWeight.w700,
            fontSize: 12.5,
          ),
        ),
      ),
    );
  }

  Widget _logCard(FinanceSyncLog log) {
    Color color;
    Color soft;
    IconData icon;
    switch (log.status) {
      case FinanceSyncStatus.synced:
        color = AppColors.success;
        soft = AppColors.successSoft;
        icon = Icons.check_circle_rounded;
        break;
      case FinanceSyncStatus.pending:
        color = AppColors.warning;
        soft = AppColors.warningSoft;
        icon = Icons.hourglass_top_rounded;
        break;
      case FinanceSyncStatus.failed:
        color = AppColors.danger;
        soft = AppColors.dangerSoft;
        icon = Icons.error_outline_rounded;
        break;
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: soft,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(log.reference,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14)),
                    const SizedBox(height: 2),
                    Text(log.movementType.label,
                        style: const TextStyle(
                            color: AppColors.textMuted, fontSize: 12)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(log.status.label,
                    style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w700,
                        fontSize: 11)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.bg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Nilai jurnal',
                        style: TextStyle(
                            color: AppColors.textMuted, fontSize: 12)),
                    const Spacer(),
                    Text(_rupiah.format(log.amount),
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 13.5)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text('Sinkron',
                        style: TextStyle(
                            color: AppColors.textMuted, fontSize: 12)),
                    const Spacer(),
                    Text(_date.format(log.syncedAt),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12.5)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(log.note,
                    style: const TextStyle(
                        color: AppColors.textMuted, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
