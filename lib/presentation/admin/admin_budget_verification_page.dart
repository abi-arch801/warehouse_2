import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/datasource/admin/admin_budget_verification_datasource.dart';
import 'package:warehouse/data/model/response/budget_verification_response_model.dart';
import 'package:warehouse/presentation/admin/admin_budget_verification_detail_page.dart';
import 'package:warehouse/presentation/admin/admin_budget_verification_form_page.dart';
import 'package:warehouse/presentation/bloc/admin/admin_budget_verification/admin_budget_verification_bloc.dart';

class AdminBudgetVerificationPage extends StatelessWidget {
  const AdminBudgetVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AdminBudgetVerificationBloc(AdminBudgetVerificationDatasource())
            ..add(const AdminBudgetVerificationEvent.getAll()),
      child: const _AdminBudgetVerificationView(),
    );
  }
}

class _AdminBudgetVerificationView extends StatefulWidget {
  const _AdminBudgetVerificationView();

  @override
  State<_AdminBudgetVerificationView> createState() =>
      _AdminBudgetVerificationViewState();
}

class _AdminBudgetVerificationViewState
    extends State<_AdminBudgetVerificationView> {
  String? _selectedStatus;
  int _currentPage = 1;

  void _reload() {
    context.read<AdminBudgetVerificationBloc>().add(
          AdminBudgetVerificationEvent.getAll(
              page: _currentPage, status: _selectedStatus),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifikasi Anggaran'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Buat Verifikasi',
            onPressed: () async {
              final ok = await Navigator.push<bool>(
                context,
                MaterialPageRoute(
                    builder: (_) => const AdminBudgetVerificationFormPage()),
              );
              if (ok == true && mounted) _reload();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              children: [
                for (final opt in [
                  {'value': '', 'label': 'Semua'},
                  {'value': 'setuju', 'label': 'Setuju'},
                  {'value': 'tunda', 'label': 'Tunda'},
                  {'value': 'tolak', 'label': 'Tolak'},
                ]) ...[
                  ChoiceChip(
                    label: Text(opt['label']!),
                    selected: (_selectedStatus ?? '') == opt['value'],
                    onSelected: (_) {
                      setState(() {
                        _selectedStatus =
                            opt['value']!.isEmpty ? null : opt['value'];
                        _currentPage = 1;
                      });
                      _reload();
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<AdminBudgetVerificationBloc,
                AdminBudgetVerificationState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (msg) => Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(msg, style: const TextStyle(color: Colors.red)),
                        const SizedBox(height: 12),
                        ElevatedButton(
                            onPressed: _reload, child: const Text('Coba Lagi')),
                      ],
                    ),
                  ),
                  loaded: (data) {
                    if (data.data.isEmpty) {
                      return const Center(child: Text('Belum ada verifikasi.'));
                    }
                    return RefreshIndicator(
                      onRefresh: () async => _reload(),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemCount:
                            data.data.length + (data.lastPage > 1 ? 1 : 0),
                        itemBuilder: (_, i) {
                          if (i == data.data.length) {
                            return _PaginationRow(
                              current: data.currentPage,
                              last: data.lastPage,
                              onPrev: data.currentPage > 1
                                  ? () {
                                      setState(() => _currentPage--);
                                      _reload();
                                    }
                                  : null,
                              onNext: data.currentPage < data.lastPage
                                  ? () {
                                      setState(() => _currentPage++);
                                      _reload();
                                    }
                                  : null,
                            );
                          }
                          final v = data.data[i];
                          return _VerificationCard(
                            verification: v,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      AdminBudgetVerificationDetailPage(
                                          id: v.id),
                                ),
                              );
                              _reload();
                            },
                          );
                        },
                      ),
                    );
                  },
                  orElse: () => const SizedBox(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _VerificationCard extends StatelessWidget {
  final BudgetVerificationModel verification;
  final VoidCallback onTap;

  const _VerificationCard({required this.verification, required this.onTap});

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

  int get _docCount => [
        verification.docFormLengkap,
        verification.docSuratJustifikasi,
        verification.docEstimasiVendor,
        verification.docSpesifikasiTeknis,
      ].where((b) => b).length;

  @override
  Widget build(BuildContext context) {
    final color = _rekColor(verification.rekomendasi);
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      verification.budgetRequestNomorForm ??
                          'Verif #${verification.id}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: color.withOpacity(0.4)),
                    ),
                    child: Text(verification.rekomendasiLabel,
                        style: TextStyle(
                            color: color,
                            fontSize: 12,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.check_circle_outline,
                      size: 14, color: Colors.green),
                  const SizedBox(width: 4),
                  Text('$_docCount/4 dokumen lengkap',
                      style:
                          const TextStyle(fontSize: 12, color: Colors.black54)),
                  const Spacer(),
                  if (verification.budgetRequestTotalEstimasi != null)
                    Text(
                      'Rp ${_fmt(verification.budgetRequestTotalEstimasi!)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                ],
              ),
            ],
          ),
        ),
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

class _PaginationRow extends StatelessWidget {
  final int current;
  final int last;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  const _PaginationRow({
    required this.current,
    required this.last,
    required this.onPrev,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: onPrev, icon: const Icon(Icons.chevron_left)),
          Text('Halaman $current dari $last'),
          IconButton(onPressed: onNext, icon: const Icon(Icons.chevron_right)),
        ],
      ),
    );
  }
}
