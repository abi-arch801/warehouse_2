import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/presentation/admin/pages/data/mock_data.dart';
import 'package:warehouse/presentation/admin/pages/data/models/models.dart';
import 'package:warehouse/presentation/admin/pages/theme/app_theme.dart';

class RoleRequestScreen extends StatefulWidget {
  final AppUser currentUser;
  const RoleRequestScreen({super.key, required this.currentUser});

  @override
  State<RoleRequestScreen> createState() => _RoleRequestScreenState();
}

class _RoleRequestScreenState extends State<RoleRequestScreen> {
  DocStatus? _filter;
  final _date = DateFormat('d MMM yyyy');

  void _openCreate() {
    final name = TextEditingController();
    final email = TextEditingController();
    final reason = TextEditingController();
    UserRole role = UserRole.admin;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => StatefulBuilder(builder: (ctx, setSt) {
        final mq = MediaQuery.of(ctx);
        return Padding(
          padding: EdgeInsets.only(
            left: 22,
            right: 22,
            top: 16,
            bottom: 24 + mq.viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 36,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const Text('Ajukan Role Baru',
                    style: TextStyle(
                        fontSize: 17, fontWeight: FontWeight.w700)),
                const SizedBox(height: 4),
                const Text(
                  'Pengajuan akan ditinjau oleh super admin.',
                  style: TextStyle(
                      color: AppColors.textMuted, fontSize: 12.5),
                ),
                const SizedBox(height: 14),
                TextField(
                  controller: name,
                  decoration:
                      const InputDecoration(labelText: 'Nama Lengkap'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      const InputDecoration(labelText: 'Email Kerja'),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<UserRole>(
                  initialValue: role,
                  items: UserRole.values
                      .map((r) => DropdownMenuItem(
                          value: r, child: Text(r.label)))
                      .toList(),
                  onChanged: (v) =>
                      setSt(() => role = v ?? UserRole.admin),
                  decoration: const InputDecoration(
                      labelText: 'Role yang diajukan'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: reason,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Alasan / Justifikasi',
                    hintText:
                        'Contoh: Mengelola operasional Gudang Cabang B...',
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    if (name.text.isEmpty ||
                        email.text.isEmpty ||
                        reason.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Semua field wajib diisi')),
                      );
                      return;
                    }
                    setState(() {
                      MockDB.instance.roleRequests.add(RoleRequest(
                        id: 'rr${DateTime.now().millisecondsSinceEpoch}',
                        name: name.text.trim(),
                        email: email.text.trim(),
                        reason: reason.text.trim(),
                        requestedRole: role,
                        status: DocStatus.pending,
                        createdAt: DateTime.now(),
                      ));
                    });
                    Navigator.pop(ctx);
                    HapticFeedback.heavyImpact();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: AppColors.success,
                        content: Text('Pengajuan terkirim'),
                      ),
                    );
                  },
                  child: const Text('Kirim Pengajuan'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void _decide(RoleRequest r, bool approve) {
    HapticFeedback.heavyImpact();
    setState(() {
      r.status = approve ? DocStatus.approved : DocStatus.rejected;
      if (approve) r.approvedBy = widget.currentUser.id;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
            approve ? AppColors.success : AppColors.danger,
        content: Text(approve
            ? 'Pengajuan ${r.name} disetujui'
            : 'Pengajuan ${r.name} ditolak'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final db = MockDB.instance;
    final canApprove = widget.currentUser.role == UserRole.superAdmin;
    final all = [...db.roleRequests]
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    final filtered =
        _filter == null ? all : all.where((r) => r.status == _filter).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Pengajuan Role')),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: _openCreate,
        icon: const Icon(Icons.add),
        label: const Text('Pengajuan Baru'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
            child: SizedBox(
              height: 36,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _chip('Semua', null),
                  const SizedBox(width: 8),
                  _chip('Menunggu', DocStatus.pending),
                  const SizedBox(width: 8),
                  _chip('Disetujui', DocStatus.approved),
                  const SizedBox(width: 8),
                  _chip('Ditolak', DocStatus.rejected),
                ],
              ),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.admin_panel_settings_rounded,
                            size: 56,
                            color: AppColors.textMuted
                                .withValues(alpha: 0.5)),
                        const SizedBox(height: 12),
                        const Text('Belum ada pengajuan',
                            style:
                                TextStyle(color: AppColors.textMuted)),
                      ],
                    ),
                  )
                : ListView.separated(
                    padding:
                        const EdgeInsets.fromLTRB(20, 8, 20, 90),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: 10),
                    itemBuilder: (_, i) {
                      final r = filtered[i];
                      return TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration: Duration(
                            milliseconds:
                                250 + (i * 60).clamp(0, 600)),
                        curve: Curves.easeOut,
                        builder: (_, v, child) => Opacity(
                          opacity: v,
                          child: Transform.translate(
                            offset: Offset(0, (1 - v) * 12),
                            child: child,
                          ),
                        ),
                        child: _card(r, canApprove),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label, DocStatus? status) {
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
        child: Text(label,
            style: TextStyle(
              color: selected ? Colors.white : AppColors.text,
              fontWeight: FontWeight.w700,
              fontSize: 12.5,
            )),
      ),
    );
  }

  Widget _card(RoleRequest r, bool canApprove) {
    Color color;
    Color soft;
    switch (r.status) {
      case DocStatus.pending:
        color = AppColors.warning;
        soft = AppColors.warningSoft;
        break;
      case DocStatus.approved:
        color = AppColors.success;
        soft = AppColors.successSoft;
        break;
      case DocStatus.rejected:
        color = AppColors.danger;
        soft = AppColors.dangerSoft;
        break;
      default:
        color = AppColors.textMuted;
        soft = AppColors.bg;
    }
    final approver = r.approvedBy == null
        ? null
        : MockDB.instance.userById(r.approvedBy!);
    return Container(
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
              CircleAvatar(
                radius: 20,
                backgroundColor: soft,
                child: Text(
                  r.name.substring(0, 1),
                  style: TextStyle(
                      color: color, fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(r.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14)),
                    const SizedBox(height: 2),
                    Text(r.email,
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
                child: Text(r.status.label,
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
                    const Icon(Icons.shield_moon_rounded,
                        size: 14, color: AppColors.textMuted),
                    const SizedBox(width: 6),
                    Text('Role: ${r.requestedRole.label}',
                        style: const TextStyle(
                            fontSize: 12.5, fontWeight: FontWeight.w600)),
                    const Spacer(),
                    Text(_date.format(r.createdAt),
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.textMuted)),
                  ],
                ),
                const SizedBox(height: 6),
                Text(r.reason,
                    style: const TextStyle(fontSize: 13, height: 1.4)),
                if (approver != null) ...[
                  const SizedBox(height: 6),
                  Text('Disetujui oleh ${approver.name}',
                      style: const TextStyle(
                          fontSize: 11.5,
                          color: AppColors.textMuted,
                          fontStyle: FontStyle.italic)),
                ],
              ],
            ),
          ),
          if (r.status == DocStatus.pending && canApprove) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.danger,
                      side: const BorderSide(color: AppColors.danger),
                    ),
                    onPressed: () => _decide(r, false),
                    icon: const Icon(Icons.close_rounded, size: 18),
                    label: const Text('Tolak'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.success),
                    onPressed: () => _decide(r, true),
                    icon: const Icon(Icons.check_rounded, size: 18),
                    label: const Text('Setujui'),
                  ),
                ),
              ],
            ),
          ],
          if (r.status == DocStatus.pending && !canApprove) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.infoSoft,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline_rounded,
                      size: 14, color: AppColors.info),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'Hanya super admin yang dapat menyetujui.',
                      style: TextStyle(
                          color: AppColors.info,
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
