import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:warehouse/data/model/response/stock_response_model.dart';
import 'package:warehouse/presentation/bloc/admin/activity/activity_bloc.dart';
import 'activity_detail_page.dart';

// ═══════════════════════════════════════════════════════════════════════════════
// ACTIVITY LIST PAGE
// ═══════════════════════════════════════════════════════════════════════════════

class ActivityListPage extends StatefulWidget {
  const ActivityListPage({super.key});

  @override
  State<ActivityListPage> createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  DateTimeRange? _dateRange;

  final _tabs = ['Semua', 'Masuk', 'Keluar', 'Transfer', 'Adjustment'];
  // final _typeKeys = [null, 'in', 'out', 'transfer_in', 'adjustment'];

  final _typeKeys = [null, 'in', 'out', 'null', 'adjustment'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) _loadData();
    });
    _loadData();
  }

  void _loadData() {
    context.read<ActivityBloc>().add(ActivityEvent.loadAll(
          type: _typeKeys[_tabController.index],
          startDate: _dateRange?.start.toIso8601String(),
          endDate: _dateRange?.end.toIso8601String(),
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Aktivitas Stok',
          style: TextStyle(
              color: Color(0xFF1A1D1E),
              fontWeight: FontWeight.w700,
              fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF1A1D1E)),
        actions: [
          IconButton(
            onPressed: _pickDateRange,
            icon: Icon(
              Icons.date_range_outlined,
              color: _dateRange != null
                  ? const Color(0xFF6C63FF)
                  : const Color(0xFF6C757D),
            ),
          ),
          if (_dateRange != null)
            IconButton(
              onPressed: () {
                setState(() => _dateRange = null);
                _loadData();
              },
              icon: const Icon(Icons.filter_alt_off_outlined,
                  color: Color(0xFFDC3545)),
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: (v) => setState(() => _searchQuery = v),
                  decoration: InputDecoration(
                    hintText: 'Cari aktivitas, produk...',
                    hintStyle:
                        const TextStyle(color: Color(0xFFADB5BD), fontSize: 14),
                    prefixIcon: const Icon(Icons.search,
                        color: Color(0xFFADB5BD), size: 20),
                    filled: true,
                    fillColor: const Color(0xFFF5F6FA),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: const Color(0xFF6C63FF),
                unselectedLabelColor: const Color(0xFF6C757D),
                indicatorColor: const Color(0xFF6C63FF),
                indicatorWeight: 2.5,
                labelStyle:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                tabs: _tabs.map((t) => Tab(text: t)).toList(),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          if (_dateRange != null) _buildDateFilterChip(),
          Expanded(
            child: BlocBuilder<ActivityBloc, ActivityState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: Color(0xFF6C63FF)),
                  ),
                  error: (msg) => _buildError(msg),
                  // loaded: (activities, hasMore) {
                  //   final filtered = _searchQuery.isEmpty
                  //       ? activities
                  //       : activities.where((a) {
                  //           final name = (a.product?['name'] as String? ?? '')
                  //               .toLowerCase();
                  //           return name.contains(_searchQuery.toLowerCase());
                  //         }).toList();

                  //   if (filtered.isEmpty) return _buildEmpty();
                  //   return RefreshIndicator(
                  //     color: const Color(0xFF6C63FF),
                  //     onRefresh: () async => _loadData(),
                  //     child: ListView.builder(
                  //       padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  //       itemCount: filtered.length,
                  //       itemBuilder: (_, i) =>
                  //           _ActivityCard(activity: filtered[i]),
                  //     ),
                  //   );
                  // },

                  loaded: (activities, hasMore) {
                    var filtered = activities;

                    // Filter khusus tab Transfer (index 3)
                    if (_tabController.index == 3) {
                      filtered = filtered
                          .where((a) =>
                              a.type == 'transfer_in' ||
                              a.type == 'transfer_out')
                          .toList();
                    }

                    // Filter search query
                    if (_searchQuery.isNotEmpty) {
                      filtered = filtered.where((a) {
                        final name =
                            (a.product?['name'] as String? ?? '').toLowerCase();
                        return name.contains(_searchQuery.toLowerCase());
                      }).toList();
                    }

                    if (filtered.isEmpty) return _buildEmpty();
                    return RefreshIndicator(
                      color: const Color(0xFF6C63FF),
                      onRefresh: () async => _loadData(),
                      child: ListView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                        itemCount: filtered.length,
                        itemBuilder: (_, i) =>
                            _ActivityCard(activity: filtered[i]),
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

  Widget _buildDateFilterChip() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Row(
        children: [
          const Icon(Icons.filter_list, size: 16, color: Color(0xFF6C63FF)),
          const SizedBox(width: 6),
          Text(
            '${DateFormat('dd MMM').format(_dateRange!.start)} - '
            '${DateFormat('dd MMM yyyy').format(_dateRange!.end)}',
            style: const TextStyle(
                color: Color(0xFF6C63FF),
                fontSize: 13,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildError(String msg) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Color(0xFFDC3545), size: 48),
            const SizedBox(height: 12),
            Text(msg, style: const TextStyle(color: Color(0xFF6C757D))),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadData,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF)),
              child: const Text('Coba lagi'),
            ),
          ],
        ),
      );

  Widget _buildEmpty() => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF).withValues(alpha: 0.08),
                  shape: BoxShape.circle),
              child: const Icon(Icons.swap_vert,
                  size: 48, color: Color(0xFF6C63FF)),
            ),
            const SizedBox(height: 16),
            const Text('Belum ada aktivitas',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF1A1D1E))),
            const SizedBox(height: 6),
            const Text('Aktivitas stok akan muncul di sini',
                style: TextStyle(color: Color(0xFF6C757D), fontSize: 13)),
          ],
        ),
      );

  Future<void> _pickDateRange() async {
    final result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: _dateRange,
      builder: (context, child) => Theme(
        data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF6C63FF))),
        child: child!,
      ),
    );
    if (result != null) {
      setState(() => _dateRange = result);
      _loadData();
    }
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// ACTIVITY CARD
// ═══════════════════════════════════════════════════════════════════════════════

class _ActivityCard extends StatelessWidget {
  final StockMovementModel activity;
  const _ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    final a = activity;
    final cfg = _typeCfg(a.type);
    final productName = a.product?['name'] as String? ?? '-';
    final warehouseName = a.warehouse?['name'] as String? ?? '-';
    final isPositive = a.type == 'in' || a.type == 'transfer_in';

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ActivityDetailPage(activityId: a.id),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 6,
                offset: const Offset(0, 2)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              // ── Ikon type ──────────────────────────────────────────
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: (cfg['color'] as Color).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(cfg['icon'] as IconData,
                    color: cfg['color'] as Color, size: 20),
              ),
              const SizedBox(width: 12),

              // ── Info produk ────────────────────────────────────────
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(productName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xFF1A1D1E))),
                    const SizedBox(height: 2),
                    Text(warehouseName,
                        style: const TextStyle(
                            color: Color(0xFF6C757D), fontSize: 12)),

                    // Badge "dari request"
                    if (a.referenceType == 'request') ...[
                      const SizedBox(height: 3),
                      Row(
                        children: [
                          const Icon(Icons.assignment_outlined,
                              size: 11, color: Color(0xFF6C63FF)),
                          const SizedBox(width: 3),
                          Text(
                            'Request #${a.referenceId ?? '-'}',
                            style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF6C63FF),
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 4),
                    Text(
                      _formatDate(a.createdAt),
                      style: const TextStyle(
                          color: Color(0xFFADB5BD), fontSize: 11),
                    ),
                  ],
                ),
              ),

              // ── Jumlah & label ─────────────────────────────────────
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${isPositive ? '+' : '-'}${a.quantity}',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: isPositive
                          ? const Color(0xFF0E9B6A)
                          : const Color(0xFFDC3545),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                        color: (cfg['color'] as Color).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(cfg['label'] as String,
                        style: TextStyle(
                            color: cfg['color'] as Color,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, dynamic> _typeCfg(String type) {
    switch (type) {
      case 'in':
        return {
          'icon': Icons.arrow_downward,
          'color': const Color(0xFF0E9B6A),
          'label': 'Masuk'
        };
      case 'out':
        return {
          'icon': Icons.arrow_upward,
          'color': const Color(0xFFDC3545),
          'label': 'Keluar'
        };
      case 'transfer_out':
        return {
          'icon': Icons.swap_horiz,
          'color': const Color(0xFF6C63FF),
          'label': 'Transfer'
        };
      case 'transfer_in':
        return {
          'icon': Icons.call_received,
          'color': const Color(0xFF0E9B6A),
          'label': 'Transfer Masuk'
        };
      case 'adjustment':
        return {
          'icon': Icons.tune,
          'color': const Color(0xFFE6A817),
          'label': 'Adjustment'
        };
      default:
        return {
          'icon': Icons.swap_vert,
          'color': const Color(0xFF6C757D),
          'label': type
        };
    }
  }

  String _formatDate(String dt) {
    try {
      return DateFormat('dd MMM yyyy, HH:mm').format(DateTime.parse(dt));
    } catch (_) {
      return dt;
    }
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// SHARED HELPER WIDGETS  (dipakai di file ini & bisa dipakai activity_detail)
// ═══════════════════════════════════════════════════════════════════════════════

class ActivitySectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ActivitySectionCard(
      {super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Color(0xFF1A1D1E))),
          const SizedBox(height: 4),
          const Divider(color: Color(0xFFF0F0F0)),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}

class ActivityInfoRow extends StatelessWidget {
  final String label;
  final String value;
  const ActivityInfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 120,
              child: Text(label,
                  style:
                      const TextStyle(color: Color(0xFF6C757D), fontSize: 13))),
          const Text(':',
              style: TextStyle(color: Color(0xFF6C757D), fontSize: 13)),
          const SizedBox(width: 8),
          Expanded(
              child: Text(value,
                  style: const TextStyle(
                      color: Color(0xFF1A1D1E),
                      fontSize: 13,
                      fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}
