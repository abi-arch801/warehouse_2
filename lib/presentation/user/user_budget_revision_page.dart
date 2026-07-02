import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/datasource/user/budget_revision_user_datasource.dart';
import 'package:warehouse/data/model/response/budget_revision_response_model.dart';
import 'package:warehouse/presentation/bloc/user/user_budget_revision/user_budget_revision_bloc.dart';
import 'package:warehouse/presentation/user/user_budget_revision_detail_page.dart';
import 'package:warehouse/presentation/user/user_budget_revision_form_page.dart';

class UserBudgetRevisionPage extends StatelessWidget {
  const UserBudgetRevisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBudgetRevisionBloc(UserBudgetRevisionDatasource())
        ..add(const UserBudgetRevisionEvent.getAll()),
      child: const _UserBudgetRevisionView(),
    );
  }
}

class _UserBudgetRevisionView extends StatefulWidget {
  const _UserBudgetRevisionView();

  @override
  State<_UserBudgetRevisionView> createState() =>
      _UserBudgetRevisionViewState();
}

class _UserBudgetRevisionViewState extends State<_UserBudgetRevisionView> {
  String? _selectedStatus;
  int _currentPage = 1;

  final _statusOptions = const [
    {'value': '', 'label': 'Semua'},
    {'value': 'pending', 'label': 'Pending'},
    {'value': 'approved', 'label': 'Approved'},
    {'value': 'approved_revisi', 'label': 'Approved Revisi'},
    {'value': 'ditolak', 'label': 'Ditolak'},
  ];

  void _reload() {
    context.read<UserBudgetRevisionBloc>().add(UserBudgetRevisionEvent.getAll(
          page: _currentPage,
          status: _selectedStatus,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Revisi Anggaran'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Ajukan Revisi',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Buka detail RAB yang sudah disetujui, lalu tekan "Ajukan Revisi" di sana.'),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Filter bar ──
          SizedBox(
            height: 44,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemCount: _statusOptions.length,
              itemBuilder: (_, i) {
                final opt = _statusOptions[i];
                final selected = _selectedStatus == opt['value'] ||
                    (_selectedStatus == null && opt['value'] == '');
                return ChoiceChip(
                  label: Text(opt['label']!),
                  selected: selected,
                  onSelected: (_) {
                    setState(() {
                      _selectedStatus =
                          opt['value']!.isEmpty ? null : opt['value'];
                      _currentPage = 1;
                    });
                    _reload();
                  },
                );
              },
            ),
          ),

          // ── List ──
          Expanded(
            child: BlocBuilder<UserBudgetRevisionBloc, UserBudgetRevisionState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (msg) => Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(msg,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.red)),
                        const SizedBox(height: 12),
                        ElevatedButton(
                            onPressed: _reload, child: const Text('Coba Lagi')),
                      ],
                    ),
                  ),
                  loaded: (data) {
                    if (data.data.isEmpty) {
                      return const Center(
                          child: Text('Belum ada revisi anggaran.'));
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
                          return _RevisionCard(
                            revision: data.data[i],
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => UserBudgetRevisionDetailPage(
                                      id: data.data[i].id),
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

class _RevisionCard extends StatelessWidget {
  final BudgetRevisionModel revision;
  final VoidCallback onTap;

  const _RevisionCard({required this.revision, required this.onTap});

  Color _statusColor(String status) {
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
    final isPlus = revision.jenisPerubahan == 'tambahan';
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
                      revision.budgetRequestNomorForm ??
                          'Revisi #${revision.id}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color:
                          _statusColor(revision.status).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      revision.statusLabel,
                      style: TextStyle(
                          color: _statusColor(revision.status),
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(revision.akunTerdampak,
                  style: const TextStyle(color: Colors.black54)),
              const SizedBox(height: 8),
              Row(
                children: [
                  _AmountChip(
                    label: 'Awal',
                    amount: revision.anggaranAwal,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  _AmountChip(
                    label: isPlus ? '+Tambahan' : '-Pengurangan',
                    amount: revision.nominalPerubahan,
                    color: isPlus ? Colors.green : Colors.red,
                  ),
                  const SizedBox(width: 8),
                  _AmountChip(
                    label: 'Baru',
                    amount: revision.anggaranBaru,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AmountChip extends StatelessWidget {
  final String label;
  final double amount;
  final Color color;

  const _AmountChip(
      {required this.label, required this.amount, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style:
                TextStyle(fontSize: 10, color: color.withValues(alpha: 0.8))),
        Text(
          'Rp ${_fmt(amount)}',
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: color),
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

class _PaginationRow extends StatelessWidget {
  final int current;
  final int last;
  final VoidCallback? onPrev;
  final VoidCallback? onNext;

  const _PaginationRow(
      {required this.current, required this.last, this.onPrev, this.onNext});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: onPrev, child: const Text('← Sebelumnya')),
        Text('$current / $last'),
        TextButton(onPressed: onNext, child: const Text('Berikutnya →')),
      ],
    );
  }
}
