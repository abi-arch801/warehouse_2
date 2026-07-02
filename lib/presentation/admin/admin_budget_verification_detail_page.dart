import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:warehouse/data/datasource/admin/admin_budget_verification_datasource.dart';
import 'package:warehouse/data/model/response/budget_verification_response_model.dart';
import 'package:warehouse/presentation/admin/admin_budget_verification_form_page.dart';
import 'package:warehouse/presentation/bloc/admin/admin_budget_verification/admin_budget_verification_bloc.dart';

class AdminBudgetVerificationDetailPage extends StatelessWidget {
  final int id;

  const AdminBudgetVerificationDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AdminBudgetVerificationBloc(AdminBudgetVerificationDatasource())
            ..add(AdminBudgetVerificationEvent.getDetail(id)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Detail Verifikasi')),
        body: BlocBuilder<AdminBudgetVerificationBloc,
            AdminBudgetVerificationState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (msg) => Center(
                  child: Text(msg, style: const TextStyle(color: Colors.red))),
              detail: (verif) => _VerifDetailBody(verification: verif),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ),
    );
  }
}

class _VerifDetailBody extends StatelessWidget {
  final BudgetVerificationModel verification;

  const _VerifDetailBody({required this.verification});

  Color _rekColor(String rek) {
    switch (rek) {
      case 'setuju':
        return Colors.green;
      case 'tunda':
        return Colors.orange;
      case 'tolak':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final rekColor = _rekColor(verification.rekomendasi);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Rekomendasi banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: rekColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: rekColor.withOpacity(0.4)),
            ),
            child: Row(
              children: [
                Icon(
                  verification.rekomendasi == 'setuju'
                      ? Icons.check_circle
                      : verification.rekomendasi == 'tunda'
                          ? Icons.pause_circle
                          : Icons.cancel,
                  color: rekColor,
                ),
                const SizedBox(width: 8),
                Text(
                  'Rekomendasi: ${verification.rekomendasiLabel}',
                  style: TextStyle(
                      color: rekColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Info pengajuan
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  if (verification.budgetRequestNomorForm != null)
                    _InfoRow(
                        'No. Pengajuan', verification.budgetRequestNomorForm!),
                  if (verification.budgetRequestTotalEstimasi != null)
                    _InfoRow('Total Estimasi',
                        'Rp ${_fmt(verification.budgetRequestTotalEstimasi!)}'),
                  if (verification.nominalRekomendasi != null)
                    _InfoRow('Nominal Rekomendasikan',
                        'Rp ${_fmt(verification.nominalRekomendasi!)}'),
                  _InfoRow('Verifikator', verification.verifiedByName ?? '-'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Checklist dokumen
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kelengkapan Dokumen',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _DocRow('Form pengajuan', verification.docFormLengkap),
                  _DocRow(
                      'Surat justifikasi', verification.docSuratJustifikasi),
                  _DocRow('Estimasi vendor', verification.docEstimasiVendor),
                  _DocRow(
                      'Spesifikasi teknis', verification.docSpesifikasiTeknis),
                  if (verification.docLainnya != null) ...[
                    const Divider(),
                    Text('Lainnya: ${verification.docLainnya}',
                        style: const TextStyle(
                            fontSize: 13, color: Colors.black87)),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Analisa
          if (verification.cekAnggaran != null ||
              verification.analisaCashflow != null ||
              verification.catatanFinance != null)
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Analisa Finance',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    if (verification.cekAnggaran != null) ...[
                      const SizedBox(height: 8),
                      const Text('Cek Anggaran',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54)),
                      Text(verification.cekAnggaran!),
                    ],
                    if (verification.analisaCashflow != null) ...[
                      const SizedBox(height: 8),
                      const Text('Analisa Cashflow',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54)),
                      Text(verification.analisaCashflow!),
                    ],
                    if (verification.catatanFinance != null) ...[
                      const SizedBox(height: 8),
                      const Text('Catatan Finance',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54)),
                      Text(verification.catatanFinance!),
                    ],
                  ],
                ),
              ),
            ),

          const SizedBox(height: 12),
          // Tombol edit
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('Edit Verifikasi'),
              onPressed: () async {
                final ok = await Navigator.push<bool>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AdminBudgetVerificationFormPage(
                      editId: verification.id,
                      existing: verification,
                    ),
                  ),
                );
                if (ok == true && context.mounted) {
                  context.read<AdminBudgetVerificationBloc>().add(
                        AdminBudgetVerificationEvent.getDetail(verification.id),
                      );
                }
              },
            ),
          ),

          const SizedBox(height: 16),
          // Info lanjutan
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, size: 16, color: Colors.blueGrey),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Keputusan final (Approve / Tolak RAB) dilakukan oleh Super Admin di panel web.',
                    style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _DocRow(String label, bool checked) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(
            checked ? Icons.check_circle : Icons.cancel,
            size: 18,
            color: checked ? Colors.green : Colors.grey.shade300,
          ),
          const SizedBox(width: 8),
          Text(label,
              style: TextStyle(color: checked ? Colors.black87 : Colors.grey)),
        ],
      ),
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
