import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/datasource/admin/admin_budget_revision_datasource.dart';
import 'package:warehouse/data/model/response/budget_revision_response_model.dart';
import 'package:warehouse/presentation/admin/admin_budget_revision_detail_page.dart';
import 'package:warehouse/presentation/bloc/admin/admin_budget_revision/admin_budget_revision_bloc.dart';

class AdminBudgetRevisionPage extends StatelessWidget {
  const AdminBudgetRevisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminBudgetRevisionBloc(AdminBudgetRevisionDatasource())
        ..add(const AdminBudgetRevisionEvent.getAll()),
      child: const _AdminBudgetRevisionView(),
    );
  }
}

class _AdminBudgetRevisionView extends StatefulWidget {
  const _AdminBudgetRevisionView();

  @override
  State<_AdminBudgetRevisionView> createState() =>
      _AdminBudgetRevisionViewState();
}

class _AdminBudgetRevisionViewState extends State<_AdminBudgetRevisionView> {
  String? _selectedStatus;
  int _currentPage = 1;

  void _reload() {
    context.read<AdminBudgetRevisionBloc>().add(
          AdminBudgetRevisionEvent.getAll(
              page: _currentPage, status: _selectedStatus),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Revisi Anggaran')),
      body: Column(
        children: [
          // Filter
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              children: [
                for (final opt in [
                  {'value': '', 'label': 'Semua'},
                  {'value': 'pending', 'label': 'Pending'},
                  {'value': 'approved', 'label': 'Approved'},
                  {'value': 'ditolak', 'label': 'Ditolak'},
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
            child:
                BlocConsumer<AdminBudgetRevisionBloc, AdminBudgetRevisionState>(
              listener: (context, state) {
                state.maybeWhen(
                  success: (msg) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(msg)));
                    _reload();
                  },
                  error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(msg), backgroundColor: Colors.red)),
                  orElse: () {},
                );
              },
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
                          final r = data.data[i];
                          return _AdminRevisionCard(
                            revision: r,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      AdminBudgetRevisionDetailPage(id: r.id),
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

class _AdminRevisionCard extends StatelessWidget {
  final BudgetRevisionModel revision;
  final VoidCallback onTap;

  const _AdminRevisionCard({required this.revision, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isPending = revision.status == 'pending';
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      revision.budgetRequestNomorForm ??
                          'Revisi #${revision.id}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(revision.akunTerdampak,
                        style: const TextStyle(color: Colors.black54)),
                    Text(
                      revision.createdByName ?? '-',
                      style:
                          const TextStyle(fontSize: 12, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _StatusBadge(revision.status, revision.statusLabel),
                  const SizedBox(height: 4),
                  if (isPending)
                    const Text('Butuh Review',
                        style: TextStyle(fontSize: 11, color: Colors.orange)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  final String label;

  const _StatusBadge(this.status, this.label);

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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _color.withOpacity(0.4)),
      ),
      child: Text(label,
          style: TextStyle(
              color: _color, fontSize: 12, fontWeight: FontWeight.w600)),
    );
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
