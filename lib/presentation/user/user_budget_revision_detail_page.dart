
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/datasource/user/budget_revision_user_datasource.dart';
import 'package:warehouse/data/model/response/budget_revision_response_model.dart';
import 'package:warehouse/presentation/bloc/user/user_budget_revision/user_budget_revision_bloc.dart';

class UserBudgetRevisionDetailPage extends StatelessWidget {
  final int id;
 
  const UserBudgetRevisionDetailPage({super.key, required this.id});
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBudgetRevisionBloc(UserBudgetRevisionDatasource())
        ..add(UserBudgetRevisionEvent.getDetail(id)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Detail Revisi')),
        body: BlocBuilder<UserBudgetRevisionBloc, UserBudgetRevisionState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(
                  child: Text(msg,
                      style: const TextStyle(color: Colors.red))),
              detail: (revision) => _RevisionDetailBody(revision: revision),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}
 
class _RevisionDetailBody extends StatelessWidget {
  final BudgetRevisionModel revision;
 
  const _RevisionDetailBody({required this.revision});
 
  @override
  Widget build(BuildContext context) {
    final isPlus = revision.jenisPerubahan == 'tambahan';
 
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status banner
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
                              label:
                                  isPlus ? '+ Tambahan' : '- Pengurangan',
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
 
          // Info
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _InfoRow('Akun Terdampak', revision.akunTerdampak),
                  if (revision.kodeAkun != null)
                    _InfoRow('Kode Akun', revision.kodeAkun!),
                  _InfoRow('Jenis', isPlus ? 'Tambahan' : 'Pengurangan'),
                  _InfoRow(
                      'Pengaju', revision.createdByName ?? '-'),
                  if (revision.createdAt != null)
                    _InfoRow('Dibuat',
                        revision.createdAt!.substring(0, 10)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
 
          // Alasan
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
 
          // Catatan approver jika sudah diproses
          if (revision.catatanApprover != null) ...[
            const SizedBox(height: 12),
            Card(
              color: Colors.amber.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Catatan ${revision.approvedByName ?? "Reviewer"}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(revision.catatanApprover!),
                  ],
                ),
              ),
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
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _color.withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
            color: _color, fontWeight: FontWeight.bold, fontSize: 15),
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
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label,
            style: TextStyle(fontSize: 11, color: color.withOpacity(0.8))),
        const SizedBox(height: 4),
        Text(
          'Rp ${_fmt(amount)}',
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, color: color),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
 
  String _fmt(double v) {
    final s = v.toStringAsFixed(0);
    final buf = StringBuffer();
    int c = 0;
    for (int i = s.length - 1; i >= 0; i--) {
      if (c > 0 && c % 3 == 0) buf.write('.');
      buf.write(s[i]);
      c++;
    }
    return buf.toString().split('').reversed.join();
  }
}
 
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
 
  const _InfoRow(this.label, this.value);
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(label,
                style: const TextStyle(color: Colors.black54)),
          ),
          Expanded(
              child: Text(value,
                  style:
                      const TextStyle(fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}


