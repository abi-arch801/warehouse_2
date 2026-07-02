import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/data/datasource/user/user_budget_request_datasource.dart';
import 'package:warehouse/data/model/response/budget_request_response_model.dart';
import 'package:warehouse/presentation/bloc/user/user_budget_request/user_budget_request_bloc.dart';
import 'user_budget_request_form_page.dart';
import 'user_budget_revision_form_page.dart';

class UserBudgetRequestDetailPage extends StatelessWidget {
  final int budgetRequestId;
  const UserBudgetRequestDetailPage({super.key, required this.budgetRequestId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBudgetRequestBloc(UserBudgetRequestDatasource())
        ..add(UserBudgetRequestEvent.getDetail(budgetRequestId)),
      child: const _DetailView(),
    );
  }
}

class _DetailView extends StatelessWidget {
  const _DetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail RAB'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
      ),
      body: BlocConsumer<UserBudgetRequestBloc, UserBudgetRequestState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (msg) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(msg)));
              context.read<UserBudgetRequestBloc>().state.whenOrNull(
                    detail: (data) => context
                        .read<UserBudgetRequestBloc>()
                        .add(UserBudgetRequestEvent.getDetail(data.id)),
                  );
            },
            error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg), backgroundColor: Colors.red)),
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (_) => const SizedBox(),
            success: (_) => const SizedBox(),
            error: (msg) => Center(child: Text(msg)),
            detail: (data) => _DetailBody(data: data),
          );
        },
      ),
    );
  }
}

class _DetailBody extends StatelessWidget {
  final BudgetRequestModel data;
  const _DetailBody({required this.data});

  Color _statusColor(String s) {
    switch (s) {
      case 'approved':
        return Colors.green;
      case 'ditolak':
        return Colors.red;
      case 'pending_sa':
        return Colors.orange;
      case 'pending':
        return Colors.blue;
      case 'ditunda':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fmt = NumberFormat('#,##0', 'id_ID');
    final sc = _statusColor(data.status);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Status banner ─────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: sc.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: sc.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.circle, color: sc, size: 12),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(data.statusLabel,
                      style: TextStyle(
                          color: sc,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ),
                Text(data.nomorForm,
                    style:
                        const TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ── Info header ───────────────────────────────────
          _InfoCard(children: [
            _Row('Divisi', data.divisi),
            _Row('Jenis', data.jenisLabel),
            _Row('Urgensi', data.urgensi == 'mendesak' ? 'Mendesak' : 'Normal'),
            if (data.kodeAkun != null && data.kodeAkun!.isNotEmpty)
              _Row('Kode Akun', data.kodeAkun!),
            if (data.namaAkun != null && data.namaAkun!.isNotEmpty)
              _Row('Nama Akun', data.namaAkun!),
            if (data.keterangan != null && data.keterangan!.isNotEmpty)
              _Row('Keterangan', data.keterangan!),
            if (data.alasanLuarRab != null && data.alasanLuarRab!.isNotEmpty)
              _Row('Alasan Luar RAB', data.alasanLuarRab!),
            if (data.sumberDana != null && data.sumberDana!.isNotEmpty)
              _Row('Sumber Dana', data.sumberDana!),
            if (data.dampakJikaTidak != null &&
                data.dampakJikaTidak!.isNotEmpty)
              _Row('Dampak Jika Tidak', data.dampakJikaTidak!),
            if (data.tanggalPengajuan != null)
              _Row('Tgl Pengajuan', data.tanggalPengajuan!),
          ]),
          const SizedBox(height: 12),

          // ── Items ─────────────────────────────────────────
          const _SectionTitle('Rincian Item'),
          const SizedBox(height: 8),
          ...data.items.map((item) => Card(
                margin: const EdgeInsets.only(bottom: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.namaItem,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      if (item.keterangan != null &&
                          item.keterangan!.isNotEmpty)
                        Text(item.keterangan!,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black54)),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              '${item.qty.toStringAsFixed(item.qty == item.qty.roundToDouble() ? 0 : 2)} ${item.satuan ?? ""} × Rp ${fmt.format(item.estimasiBiaya)}',
                              style: const TextStyle(fontSize: 13)),
                          Text('Rp ${fmt.format(item.total)}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1565C0))),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          const SizedBox(height: 8),

          // ── Total ─────────────────────────────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF1565C0).withOpacity(0.07),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                _TotalRow(
                    'Total Estimasi', 'Rp ${fmt.format(data.totalEstimasi)}'),
                if (data.status == 'approved') ...[
                  const SizedBox(height: 4),
                  _TotalRow('Total Realisasi',
                      'Rp ${fmt.format(data.totalRealisasi)}',
                      color: Colors.red),
                  const Divider(height: 12),
                  _TotalRow(
                      'Sisa Anggaran', 'Rp ${fmt.format(data.sisaAnggaran)}',
                      color: Colors.green, bold: true),
                ],
              ],
            ),
          ),
          const SizedBox(height: 12),

          // ── Approval timeline ─────────────────────────────
          const _SectionTitle('Status Approval'),
          const SizedBox(height: 8),
          _ApprovalTimeline(data: data),
          const SizedBox(height: 24),

          // ── Actions ───────────────────────────────────────
          if (data.status == 'draft') ...[
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () async {
                  final refresh = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UserBudgetRequestFormPage(existing: data),
                    ),
                  );
                  if (refresh == true && context.mounted) {
                    context
                        .read<UserBudgetRequestBloc>()
                        .add(UserBudgetRequestEvent.getDetail(data.id));
                  }
                },
                icon: const Icon(Icons.edit_outlined),
                label: const Text('Edit RAB'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1565C0),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  context
                      .read<UserBudgetRequestBloc>()
                      .add(UserBudgetRequestEvent.submit(data.id));
                },
                icon: const Icon(Icons.send),
                label: const Text('Kirim ke Admin'),
              ),
            ),
          ],

          if (data.status == 'approved') ...[
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFEF6C00),
                  side: const BorderSide(color: Color(0xFFEF6C00)),
                ),
                onPressed: () async {
                  final ok = await Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UserBudgetRevisionFormPage(
                        budgetRequestId: data.id,
                        nomorForm: data.nomorForm,
                      ),
                    ),
                  );
                  if (ok == true && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Revisi berhasil diajukan.')),
                    );
                  }
                },
                icon: const Icon(Icons.published_with_changes_outlined),
                label: const Text('Ajukan Revisi Anggaran'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Helpers UI
// ─────────────────────────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  final List<Widget> children;
  const _InfoCard({required this.children});
  @override
  Widget build(BuildContext context) => Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: children),
        ),
      );
}

class _Row extends StatelessWidget {
  final String label, value;
  const _Row(this.label, this.value);
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 110,
                child: Text(label,
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 13))),
            const Text(': ', style: TextStyle(color: Colors.black54)),
            Expanded(child: Text(value, style: const TextStyle(fontSize: 13))),
          ],
        ),
      );
}

class _TotalRow extends StatelessWidget {
  final String label, value;
  final Color? color;
  final bool bold;
  const _TotalRow(this.label, this.value, {this.color, this.bold = false});
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                  color: color ?? Colors.black87)),
        ],
      );
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);
  @override
  Widget build(BuildContext context) => Text(text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15));
}

class _ApprovalTimeline extends StatelessWidget {
  final BudgetRequestModel data;
  const _ApprovalTimeline({required this.data});

  @override
  Widget build(BuildContext context) {
    final steps = [
      _Step('Pengajuan User', true, null),
      _Step(
        'Admin Review',
        data.adminApproverName != null,
        data.adminApproverName,
        catatan: data.catatanAdmin,
      ),
      _Step(
        'Super Admin Approval',
        data.superAdminApproverName != null,
        data.superAdminApproverName,
      ),
    ];

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: List.generate(steps.length, (i) {
            final s = steps[i];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: s.done
                          ? const Color(0xFF1565C0)
                          : Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                    child: s.done
                        ? const Icon(Icons.check, size: 12, color: Colors.white)
                        : null,
                  ),
                  if (i < steps.length - 1)
                    Container(
                        width: 2,
                        height: 32,
                        color: s.done
                            ? const Color(0xFF1565C0)
                            : Colors.grey.shade200),
                ]),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(s.title,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color:
                                    s.done ? Colors.black87 : Colors.black38)),
                        if (s.subtitle != null)
                          Text(s.subtitle!,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                        if (s.catatan != null)
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.amber.shade50,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(s.catatan!,
                                style: const TextStyle(fontSize: 12)),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _Step {
  final String title;
  final bool done;
  final String? subtitle;
  final String? catatan;
  const _Step(this.title, this.done, this.subtitle, {this.catatan});
}
