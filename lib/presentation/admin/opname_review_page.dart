import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/model/response/stock_response_model.dart';
import 'package:warehouse/presentation/admin/app_theme.dart' show AppColors;
import 'package:warehouse/presentation/bloc/admin/opname/opname_bloc.dart';

// ─────────────────────────────────────────────────────────────────────────
// Review page: tampilkan tabel selisih, admin konfirmasi sebelum submit
// ─────────────────────────────────────────────────────────────────────────
class OpnameReviewPage extends StatelessWidget {
  final StockOpnameModel opname;
  const OpnameReviewPage({super.key, required this.opname});

  // Item yang sudah diisi
  List<StockOpnameItemModel> get _filledItems =>
      opname.items.where((i) => i.isFilledIn).toList();

  // Item yang ada selisih
  List<StockOpnameItemModel> get _diffItems => _filledItems
      .where((i) => i.difference != null && i.difference != 0)
      .toList();

  // Total nilai penyesuaian (positif = stok kurang, negatif = stok lebih)
  int get _totalAdjustment =>
      _diffItems.fold(0, (sum, i) => sum + (i.difference ?? 0));

  void _confirm(BuildContext ctx) {
    final items = _filledItems
        .map((i) => {
              'product_id': i.productId,
              'physical_stock': i.physicalStock!,
            })
        .toList();

    ctx.read<OpnameBloc>().add(
          OpnameEvent.complete(id: opname.id, items: items),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OpnameBloc, OpnameState>(
      listener: (ctx, state) {
        state.maybeWhen(
          actionSuccess: (msg, data) {
            Navigator.pop(ctx, true);
            ScaffoldMessenger.of(ctx).showSnackBar(
              SnackBar(
                  content: Text(msg), backgroundColor: Colors.green.shade600),
            );
          },
          error: (msg) {
            ScaffoldMessenger.of(ctx).showSnackBar(
              SnackBar(content: Text(msg), backgroundColor: Colors.red),
            );
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.bg,
        appBar: AppBar(
          title: const Text('Review Opname'),
          backgroundColor: Colors.white,
          foregroundColor: AppColors.text,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSummaryCards(context),
                    const SizedBox(height: 12),
                    _buildTable(context),
                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  // ── Kartu ringkasan ───────────────────────────────────────────────────────
  Widget _buildSummaryCards(BuildContext context) {
    final total = opname.items.length;
    final filled = _filledItems.length;
    final withDiff = _diffItems.length;
    final noDiff = filled - withDiff;
    final unFilled = total - filled;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            opname.opnameNumber,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          Text(
            '${opname.warehouseName}  •  ${opname.opnameDate}',
            style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
          ),
          const SizedBox(height: 14),
          // 4 summary chips
          Row(
            children: [
              _summaryChip(
                  label: 'Total Item',
                  value: '$total',
                  color: Colors.grey.shade600),
              const SizedBox(width: 8),
              _summaryChip(
                  label: 'Sudah Diisi',
                  value: '$filled',
                  color: Colors.blue.shade600),
              const SizedBox(width: 8),
              _summaryChip(
                  label: 'Ada Selisih',
                  value: '$withDiff',
                  color: withDiff > 0
                      ? Colors.orange.shade700
                      : Colors.green.shade600),
              const SizedBox(width: 8),
              _summaryChip(
                  label: 'Belum Diisi',
                  value: '$unFilled',
                  color: unFilled > 0
                      ? Colors.red.shade600
                      : Colors.green.shade600),
            ],
          ),
          if (_diffItems.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.swap_vert,
                      color: Colors.orange.shade700, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Ada $_withDiff item dengan selisih. '
                      'Setelah disetujui, stok akan disesuaikan otomatis.',
                      style: TextStyle(
                          fontSize: 12, color: Colors.orange.shade800),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  int get _withDiff => _diffItems.length;

  Widget _summaryChip(
      {required String label, required String value, required Color color}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                  fontWeight: FontWeight.w800, fontSize: 18, color: color),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 10, color: AppColors.textMuted),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // ── Tabel: semua item dengan selisih ─────────────────────────────────────
  Widget _buildTable(BuildContext context) {
    final items = _filledItems;
    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Text('Belum ada item yang diisi.',
              style: TextStyle(color: AppColors.textMuted)),
        ),
      );
    }

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 14, 16, 10),
            child: Text(
              'Detail Item',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ),
          // Header tabel
          Container(
            color: AppColors.bg,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Expanded(
                    flex: 4,
                    child: Text('Produk',
                        style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textMuted))),
                _colHeader('Sistem', flex: 2),
                _colHeader('Fisik', flex: 2),
                _colHeader('Selisih', flex: 2),
              ],
            ),
          ),
          const Divider(height: 1),
          ...items.asMap().entries.map((entry) {
            final i = entry.key;
            final item = entry.value;
            final diff = item.difference ?? 0;

            Color diffColor;
            if (diff == 0) {
              diffColor = Colors.green.shade600;
            } else if (diff > 0) {
              diffColor = Colors.blue.shade600;
            } else {
              diffColor = Colors.red.shade600;
            }

            return Column(
              children: [
                Container(
                  color: i.isOdd ? AppColors.bg.withOpacity(0.5) : Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.productName,
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              item.productSku,
                              style: const TextStyle(
                                  fontSize: 10, color: AppColors.textMuted),
                            ),
                          ],
                        ),
                      ),
                      _colCell('${item.systemStock}', flex: 2),
                      _colCell('${item.physicalStock}',
                          flex: 2,
                          bold: item.physicalStock != item.systemStock),
                      Expanded(
                        flex: 2,
                        child: Text(
                          diff == 0
                              ? '—'
                              : diff > 0
                                  ? '+$diff'
                                  : '$diff',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: diffColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, thickness: 0.5),
              ],
            );
          }),
          // Baris total
          if (_diffItems.isNotEmpty)
            Container(
              color: AppColors.primary.withOpacity(0.04),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Expanded(
                    flex: 4,
                    child: Text('Total Penyesuaian',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 12)),
                  ),
                  const Expanded(flex: 2, child: SizedBox()),
                  const Expanded(flex: 2, child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: Text(
                      _totalAdjustment > 0
                          ? '+$_totalAdjustment'
                          : '$_totalAdjustment',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: _totalAdjustment == 0
                            ? Colors.green.shade600
                            : Colors.orange.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _colHeader(String text, {int flex = 2}) => Expanded(
        flex: flex,
        child: Text(
          text,
          textAlign: TextAlign.right,
          style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted),
        ),
      );

  Widget _colCell(String text, {int flex = 2, bool bold = false}) => Expanded(
        flex: flex,
        child: Text(
          text,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 13,
            fontWeight: bold ? FontWeight.w700 : FontWeight.normal,
          ),
        ),
      );

  // ── Bottom bar ───────────────────────────────────────────────────────────
  Widget _buildBottomBar(BuildContext context) {
    return BlocBuilder<OpnameBloc, OpnameState>(
      builder: (ctx, state) {
        final loading = state.maybeWhen(
          actionLoading: () => true,
          orElse: () => false,
        );

        final unfilled = opname.items.length - _filledItems.length;

        return Container(
          padding: EdgeInsets.fromLTRB(
              16, 12, 16, 12 + MediaQuery.of(context).padding.bottom),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, -2))
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (unfilled > 0)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.warning_amber_rounded,
                          color: Colors.orange.shade700, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '$unfilled item belum diisi dan tidak akan diikutkan dalam penyesuaian stok.',
                          style: TextStyle(
                              fontSize: 12, color: Colors.orange.shade800),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: loading || _filledItems.isEmpty
                      ? null
                      : () => _confirm(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: loading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, color: Colors.white),
                        )
                      : Text(
                          _diffItems.isEmpty
                              ? 'Selesaikan Opname (Tidak Ada Selisih)'
                              : 'Selesaikan & Ajukan Approval (${_diffItems.length} item berubah)',
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 13),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
