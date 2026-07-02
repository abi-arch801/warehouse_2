import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/data/datasource/admin/admin_budget_request_datasource.dart';
import 'package:warehouse/data/model/request/budget_request_request_model.dart';
import 'package:warehouse/data/model/response/budget_request_response_model.dart';
import 'package:warehouse/presentation/bloc/admin/admin_budget_request/admin_budget_request_bloc.dart';
import 'package:warehouse/presentation/bloc/admin/admin_budget_request/admin_budget_request_event.dart';
import 'package:warehouse/presentation/bloc/admin/admin_budget_request/admin_budget_request_state.dart';
import 'package:warehouse/presentation/admin/admin_budget_verification_page.dart';
import 'package:warehouse/presentation/admin/admin_budget_revision_page.dart';
import 'package:warehouse/presentation/admin/admin_budget_verification_form_page.dart';

class AdminBudgetRequestPage extends StatelessWidget {
  const AdminBudgetRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AdminBudgetRequestBloc(AdminBudgetRequestDatasource())
        ..add(const AdminBudgetRequestEvent.getAll()),
      child: const _AdminBudgetRequestView(),
    );
  }
}

class _AdminBudgetRequestView extends StatefulWidget {
  const _AdminBudgetRequestView();

  @override
  State<_AdminBudgetRequestView> createState() =>
      _AdminBudgetRequestViewState();
}

class _AdminBudgetRequestViewState extends State<_AdminBudgetRequestView> {
  String? _status;
  String? _urgensi;

  final _statusOptions = const [
    {'value': null, 'label': 'Semua'},
    {'value': 'pending', 'label': 'Menunggu Review'},
    {'value': 'pending_sa', 'label': 'Diteruskan SA'},
    {'value': 'approved', 'label': 'Disetujui'},
    {'value': 'ditolak', 'label': 'Ditolak'},
    {'value': 'ditunda', 'label': 'Ditunda'},
  ];

  void _reload() {
    context.read<AdminBudgetRequestBloc>().add(AdminBudgetRequestEvent.getAll(
          status: _status,
          urgensi: _urgensi,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Pengajuan RAB'),
        backgroundColor: const Color(0xFF1565C0),
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _reload),
        ],
      ),
      body: Column(
        children: [
          // ── Filter ────────────────────────────────────────
          // ── Filter ────────────────────────────────────────
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
                final sel = _status == opt['value'];
                return FilterChip(
                  label: Text(opt['label'] as String),
                  selected: sel,
                  onSelected: (_) {
                    setState(() => _status = opt['value'] as String?);
                    _reload();
                  },
                  selectedColor: const Color(0xFF1565C0),
                  labelStyle:
                      TextStyle(color: sel ? Colors.white : Colors.black87),
                );
              },
            ),
          ),

          // ── Quick Access: Verifikasi & Revisi ──────────────
          const _QuickAccessRow(),

          // ── List ──────────────────────────────────────────
          Expanded(
            child:
                BlocConsumer<AdminBudgetRequestBloc, AdminBudgetRequestState>(
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
                  detail: (_) => const SizedBox(),
                  success: (_) => const SizedBox(),
                  error: (msg) => Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      const Icon(Icons.error_outline,
                          color: Colors.red, size: 48),
                      const SizedBox(height: 8),
                      Text(msg),
                      ElevatedButton(
                          onPressed: _reload, child: const Text('Coba lagi')),
                    ]),
                  ),
                  loaded: (resp) {
                    if (resp.data.isEmpty) {
                      return const Center(
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Icon(Icons.inbox_outlined,
                              size: 64, color: Colors.grey),
                          SizedBox(height: 12),
                          Text('Tidak ada pengajuan RAB.',
                              style: TextStyle(color: Colors.grey)),
                        ]),
                      );
                    }
                    return RefreshIndicator(
                      onRefresh: () async => _reload(),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(12),
                        itemCount: resp.data.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (_, i) =>
                            _AdminBudgetCard(item: resp.data[i]),
                      ),
                    );
                  },
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
//  Admin Card — tampilkan detail + action buttons
// ─────────────────────────────────────────────────────────────
class _AdminBudgetCard extends StatelessWidget {
  final BudgetRequestModel item;
  const _AdminBudgetCard({required this.item});

  Color _urgensiColor(String u) {
    switch (u) {
      case 'mendesak':
        return Colors.orange;
      default:
        return Colors.blueGrey;
    }
  }

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
    final sc = _statusColor(item.status);
    final uc = _urgensiColor(item.urgensi);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.nomorForm,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black54)),
                      const SizedBox(height: 2),
                      Text(item.perihal,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 14)),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: sc.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(item.statusLabel,
                      style: TextStyle(
                          color: sc,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Info chips
            Wrap(
              spacing: 6,
              runSpacing: 4,
              children: [
                _chip(Icons.person_outline, item.userName ?? '-',
                    Colors.blueGrey),
                _chip(Icons.business_outlined, item.divisi, Colors.blueGrey),
                _chip(
                    Icons.category_outlined, item.jenisLabel, Colors.blueGrey),
                _chip(Icons.warning_amber_rounded,
                    item.urgensi == 'mendesak' ? 'Mendesak' : 'Normal', uc),
                _chip(Icons.list_alt_outlined, '${item.items.length} item',
                    Colors.blueGrey),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Estimasi',
                    style: TextStyle(fontSize: 12, color: Colors.black54)),
                Text('Rp ${fmt.format(item.totalEstimasi)}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color(0xFF1565C0))),
              ],
            ),

            // Aksi hanya untuk status pending
            if (item.status == 'pending') ...[
              const Divider(height: 16),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        foregroundColor: Colors.red,
                      ),
                      onPressed: () => _showRejectDialog(context, item.id),
                      child: const Text('Tolak'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.purple),
                        foregroundColor: Colors.purple,
                      ),
                      onPressed: () => _showTundaDialog(context, item.id),
                      child: const Text('Tunda'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        final ok = await Navigator.push<bool>(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AdminBudgetVerificationFormPage(
                              budgetRequestId: item.id,
                              nomorForm: item.nomorForm,
                            ),
                          ),
                        );
                        if (ok == true && context.mounted) {
                          context.read<AdminBudgetRequestBloc>().add(
                                const AdminBudgetRequestEvent.getAll(),
                              );
                        }
                      },
                      child: const Text('Setujui'),
                    ),
                  ),
                ],
              ),
            ],

            // Catatan penundaan
            if (item.status == 'ditunda' &&
                item.catatanAdmin != null &&
                item.catatanAdmin!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: Text('Catatan: ${item.catatanAdmin}',
                    style: const TextStyle(fontSize: 12)),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _chip(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Icon(icon, size: 12, color: color),
        const SizedBox(width: 3),
        Text(label, style: TextStyle(fontSize: 11, color: color)),
      ]),
    );
  }

  void _showApproveDialog(BuildContext context, int id) {
    final ctrl = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Setujui & Teruskan ke Super Admin'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
                'RAB akan diteruskan ke Super Admin untuk persetujuan final.'),
            const SizedBox(height: 12),
            TextField(
              controller: ctrl,
              decoration: const InputDecoration(
                labelText: 'Catatan untuk Super Admin (opsional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1565C0)),
            onPressed: () {
              Navigator.pop(context);
              context.read<AdminBudgetRequestBloc>().add(
                    AdminBudgetRequestEvent.approve(
                      id: id,
                      request:
                          ApproveBudgetRequestModel(catatan: ctrl.text.trim()),
                    ),
                  );
            },
            child: const Text('Setujui', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showRejectDialog(BuildContext context, int id) {
    final ctrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Tolak Pengajuan'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: ctrl,
            decoration: const InputDecoration(
              labelText: 'Alasan penolakan *',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            validator: (v) => v == null || v.isEmpty ? 'Wajib diisi' : null,
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
              context.read<AdminBudgetRequestBloc>().add(
                    AdminBudgetRequestEvent.reject(
                      id: id,
                      request:
                          RejectBudgetRequestModel(catatan: ctrl.text.trim()),
                    ),
                  );
            },
            child: const Text('Tolak', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showTundaDialog(BuildContext context, int id) {
    final ctrl = TextEditingController();
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Tunda Pengajuan'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: ctrl,
            decoration: const InputDecoration(
              labelText: 'Alasan penundaan *',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            validator: (v) => v == null || v.isEmpty ? 'Wajib diisi' : null,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              Navigator.pop(context);
              context.read<AdminBudgetRequestBloc>().add(
                    AdminBudgetRequestEvent.tunda(
                      id: id,
                      request:
                          TundaBudgetRequestModel(catatan: ctrl.text.trim()),
                    ),
                  );
            },
            child: const Text('Tunda', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class _QuickAccessRow extends StatelessWidget {
  const _QuickAccessRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 4),
      child: Row(
        children: [
          Expanded(
            child: _QuickAccessCard(
              icon: Icons.fact_check_outlined,
              label: 'Verifikasi Finance',
              color: const Color(0xFF00897B),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AdminBudgetVerificationPage(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _QuickAccessCard(
              icon: Icons.published_with_changes_outlined,
              label: 'Revisi Anggaran',
              color: const Color(0xFFEF6C00),
              onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AdminBudgetRevisionPage(),
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

class _QuickAccessCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickAccessCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.5,
                  ),
                  maxLines: 2,
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, size: 12, color: color),
            ],
          ),
        ),
      ),
    );
  }
}
