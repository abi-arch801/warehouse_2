import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/data/datasource/user/user_budget_request_datasource.dart';
import 'package:warehouse/presentation/bloc/user/user_budget_request/user_budget_request_bloc.dart';
import 'user_budget_request_form_page.dart';
import 'user_budget_request_detail_page.dart';
import 'user_budget_revision_page.dart';

class UserBudgetRequestPage extends StatelessWidget {
  const UserBudgetRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBudgetRequestBloc(UserBudgetRequestDatasource())
        ..add(const UserBudgetRequestEvent.getAll()),
      child: const _UserBudgetRequestView(),
    );
  }
}

class _UserBudgetRequestView extends StatefulWidget {
  const _UserBudgetRequestView();

  @override
  State<_UserBudgetRequestView> createState() => _UserBudgetRequestViewState();
}

class _UserBudgetRequestViewState extends State<_UserBudgetRequestView> {
  String? _selectedStatus;

  final _statusOptions = const [
    {'value': null, 'label': 'Semua'},
    {'value': 'draft', 'label': 'Draft'},
    {'value': 'pending', 'label': 'Menunggu Admin'},
    {'value': 'pending_sa', 'label': 'Menunggu SA'},
    {'value': 'approved', 'label': 'Disetujui'},
    {'value': 'ditolak', 'label': 'Ditolak'},
    {'value': 'ditunda', 'label': 'Ditunda'},
  ];

  void _reload() {
    context.read<UserBudgetRequestBloc>().add(
          UserBudgetRequestEvent.getAll(status: _selectedStatus),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengajuan RAB'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reload,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'fab_budget_request',
        onPressed: () async {
          final refresh = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
                builder: (_) => const UserBudgetRequestFormPage()),
          );
          if (refresh == true) _reload();
        },
        icon: const Icon(Icons.add),
        label: const Text('Buat RAB'),
        backgroundColor: const Color(0xFF1565C0),
      ),
      body: Column(
        children: [
          // ── Filter status ──────────────────────────────────
          // ── Filter status ──────────────────────────────────
          Container(
            color: Colors.grey.shade100,
            height: 44,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: _statusOptions.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final opt = _statusOptions[i];
                final selected = _selectedStatus == opt['value'];
                return FilterChip(
                  label: Text(opt['label'] as String),
                  selected: selected,
                  onSelected: (_) {
                    setState(() => _selectedStatus = opt['value'] as String?);
                    _reload();
                  },
                  selectedColor: const Color(0xFF1565C0),
                  labelStyle: TextStyle(
                      color: selected ? Colors.white : Colors.black87),
                );
              },
            ),
          ),

          // ── Quick Access: Revisi Anggaran ───────────────────
          const _RevisiAccessBanner(),

          // ── List ──────────────────────────────────────────
          Expanded(
            child: BlocConsumer<UserBudgetRequestBloc, UserBudgetRequestState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: (msg) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(msg)));
                    _reload();
                  },
                  error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(msg), backgroundColor: Colors.red)),
                );
              },
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  loaded: (resp) {
                    if (resp.data.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.inbox_outlined,
                                size: 64, color: Colors.grey),
                            SizedBox(height: 12),
                            Text('Belum ada pengajuan RAB.',
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () async => _reload(),
                      child: ListView.separated(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
                        itemCount: resp.data.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (_, i) =>
                            _BudgetRequestCard(item: resp.data[i]),
                      ),
                    );
                  },
                  detail: (_) => const SizedBox(),
                  success: (_) => const SizedBox(),
                  error: (msg) => Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error_outline,
                            color: Colors.red, size: 48),
                        const SizedBox(height: 8),
                        Text(msg, textAlign: TextAlign.center),
                        const SizedBox(height: 8),
                        ElevatedButton(
                            onPressed: _reload, child: const Text('Coba lagi')),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────
//  Card satu item RAB
// ─────────────────────────────────────────────────────────────
class _BudgetRequestCard extends StatelessWidget {
  final dynamic item; // BudgetRequestModel

  const _BudgetRequestCard({required this.item});

  Color _statusColor(String status) {
    switch (status) {
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
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  UserBudgetRequestDetailPage(budgetRequestId: item.id),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(item.nomorForm,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: _statusColor(item.status).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(item.statusLabel,
                        style: TextStyle(
                            color: _statusColor(item.status),
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(item.perihal,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 6),
              Row(
                children: [
                  _InfoChip(icon: Icons.category_outlined, label: item.jenis),
                  const SizedBox(width: 6),
                  _InfoChip(
                      icon: Icons.warning_amber_rounded,
                      label: item.urgensi,
                      color: item.urgensi == 'sangat_mendesak'
                          ? Colors.red
                          : item.urgensi == 'mendesak'
                              ? Colors.orange
                              : Colors.blueGrey),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Estimasi',
                      style:
                          TextStyle(fontSize: 11, color: Colors.grey.shade600)),
                  Text('Rp ${fmt.format(item.totalEstimasi)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFF1565C0))),
                ],
              ),
              // Tombol submit jika masih draft
              if (item.status == 'draft') ...[
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1565C0),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      _showSubmitConfirm(context, item.id);
                    },
                    icon: const Icon(Icons.send, size: 16),
                    label: const Text('Kirim ke Admin'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showSubmitConfirm(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Kirim Pengajuan'),
        content: const Text(
            'Apakah kamu yakin ingin mengirim RAB ini ke Admin untuk direview?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1565C0)),
            onPressed: () {
              Navigator.pop(context);
              context
                  .read<UserBudgetRequestBloc>()
                  .add(UserBudgetRequestEvent.submit(id));
            },
            child: const Text('Kirim', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  const _InfoChip({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? Colors.blueGrey;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 12, color: c),
        const SizedBox(width: 3),
        Text(label, style: TextStyle(fontSize: 11, color: c)),
      ]),
    );
  }
}

class _RevisiAccessBanner extends StatelessWidget {
  const _RevisiAccessBanner();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const UserBudgetRevisionPage(),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFEF6C00).withValues(alpha: 0.10),
                  const Color(0xFFEF6C00).withValues(alpha: 0.03),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: const Color(0xFFEF6C00).withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF6C00).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.published_with_changes_outlined,
                      color: Color(0xFFEF6C00), size: 20),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Revisi Anggaran',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Color(0xFFEF6C00),
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Lihat riwayat & status revisi RAB kamu',
                        style: TextStyle(fontSize: 11, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded,
                    size: 14, color: Color(0xFFEF6C00)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







