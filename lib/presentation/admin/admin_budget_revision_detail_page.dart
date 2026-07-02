import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/datasource/admin/admin_budget_revision_datasource.dart';
import 'package:warehouse/data/model/request/budget_revision_request_model.dart';
import 'package:warehouse/data/model/response/budget_revision_response_model.dart';
import 'package:warehouse/presentation/bloc/admin/admin_budget_revision/admin_budget_revision_bloc.dart';

class AdminBudgetRevisionDetailPage extends StatelessWidget {
  final int id;

  const AdminBudgetRevisionDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminBudgetRevisionBloc(AdminBudgetRevisionDatasource())
        ..add(AdminBudgetRevisionEvent.getDetail(id)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Detail Revisi')),
        body: BlocConsumer<AdminBudgetRevisionBloc, AdminBudgetRevisionState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (msg) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(msg)));
                Navigator.pop(context, true);
              },
              error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(msg), backgroundColor: Colors.red)),
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(
                  child: Text(msg, style: const TextStyle(color: Colors.red))),
              detail: (revision) =>
                  _AdminRevisionDetailBody(revision: revision),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}

class _AdminRevisionDetailBody extends StatelessWidget {
  final BudgetRevisionModel revision;

  const _AdminRevisionDetailBody({required this.revision});

  void _showApproveDialog(BuildContext context) {
    final ctrl = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Setujui Revisi'),
        content: TextField(
          controller: ctrl,
          maxLines: 3,
          decoration: const InputDecoration(
              labelText: 'Catatan (opsional)', border: OutlineInputBorder()),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              Navigator.pop(context);
              context.read<AdminBudgetRevisionBloc>().add(
                    AdminBudgetRevisionEvent.approve(
                      id: revision.id,
                      request: ApproveRejectRevisionModel(
                          catatan: ctrl.text.trim().isEmpty
                              ? null
                              : ctrl.text.trim()),
                    ),
                  );
            },
            child: const Text('Setujui', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showRejectDialog(BuildContext context) {
    final ctrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Tolak Revisi'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: ctrl,
            maxLines: 3,
            validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
            decoration: const InputDecoration(
                labelText: 'Alasan Penolakan *', border: OutlineInputBorder()),
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              Navigator.pop(context);
              context.read<AdminBudgetRevisionBloc>().add(
                    AdminBudgetRevisionEvent.reject(
                      id: revision.id,
                      request:
                          ApproveRejectRevisionModel(catatan: ctrl.text.trim()),
                    ),
                  );
            },
            child: const Text('Tolak', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPending = revision.status == 'pending';
    final isPlus = revision.jenisPerubahan == 'tambahan';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatusBanner(status: revision.status, label: revision.statusLabel),
          const SizedBox(height: 16),

          // Anggaran visual
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Perubahan Anggaran',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          child: _AmountTile(
                              label: 'Awal',
                              amount: revision.anggaranAwal,
                              color: Colors.grey.shade700)),
                      const Icon(Icons.arrow_forward, color: Colors.grey),
                      Expanded(
                          child: _AmountTile(
                              label: isPlus ? '+ Tambahan' : '- Pengurangan',
                              amount: revision.nominalPerubahan,
                              color: isPlus ? Colors.green : Colors.red)),
                      const Icon(Icons.arrow_forward, color: Colors.grey),
                      Expanded(
                          child: _AmountTile(
                              label: 'Baru',
                              amount: revision.anggaranBaru,
                              color: Colors.blue.shade700)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (revision.budgetRequestNomorForm != null)
                    _InfoRow('No. Pengajuan', revision.budgetRequestNomorForm!),
                  _InfoRow('Akun Terdampak', revision.akunTerdampak),
                  if (revision.kodeAkun != null)
                    _InfoRow('Kode Akun', revision.kodeAkun!),
                  _InfoRow('Jenis', isPlus ? 'Tambahan' : 'Pengurangan'),
                  _InfoRow('Pengaju', revision.createdByName ?? '-'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Alasan Revisi',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(revision.alasanRevisi),
                ],
              ),
            ),
          ),

          if (revision.catatanApprover != null) ...[
            const SizedBox(height: 12),
            Card(
              color: Colors.amber.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Catatan ${revision.approvedByName ?? "Reviewer"}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(revision.catatanApprover!),
                  ],
                ),
              ),
            ),
          ],

          if (isPending) ...[
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red)),
                    onPressed: () => _showRejectDialog(context),
                    child: const Text('Tolak'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    onPressed: () => _showApproveDialog(context),
                    child: const Text('Setujui',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _StatusBanner extends StatelessWidget {
  final String status;
  final String label;
  const _StatusBanner({required this.status, required this.label});

  Color get _color {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'approved':
      case 'approved_revisi':
        return Colors.green;
      case 'ditolak':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData get _icon {
    switch (status) {
      case 'pending':
        return Icons.hourglass_empty;
      case 'approved':
      case 'approved_revisi':
        return Icons.check_circle;
      case 'ditolak':
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _color.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Icon(_icon, color: _color),
          const SizedBox(width: 8),
          Text('Status: $label',
              style: TextStyle(
                  color: _color, fontWeight: FontWeight.bold, fontSize: 15)),
        ],
      ),
    );
  }
}

class _AmountTile extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;
  const _AmountTile(
      {required this.label, required this.amount, required this.color});

  String _fmt(double v) {
    final s = v.abs().toStringAsFixed(0);
    final buf = StringBuffer();
    int c = 0;
    for (int i = s.length - 1; i >= 0; i--) {
      if (c > 0 && c % 3 == 0) buf.write('.');
      buf.write(s[i]);
      c++;
    }
    return buf.toString().split('').reversed.join();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 11, color: color)),
        const SizedBox(height: 4),
        Text('Rp ${_fmt(amount)}',
            style: TextStyle(
                fontSize: 13, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(label,
                style: const TextStyle(fontSize: 13, color: Colors.black54)),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
