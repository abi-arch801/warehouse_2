import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/data/datasource/user/budget_revision_user_datasource.dart';
import 'package:warehouse/data/model/request/budget_revision_request_model.dart';
import 'package:warehouse/presentation/bloc/user/user_budget_revision/user_budget_revision_bloc.dart';

class UserBudgetRevisionFormPage extends StatelessWidget {
  final int budgetRequestId;
  final String? nomorForm; // untuk tampilan, opsional

  const UserBudgetRevisionFormPage({
    super.key,
    required this.budgetRequestId,
    this.nomorForm,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBudgetRevisionBloc(UserBudgetRevisionDatasource()),
      child: _FormView(
        budgetRequestId: budgetRequestId,
        nomorForm: nomorForm,
      ),
    );
  }
}

class _FormView extends StatefulWidget {
  final int budgetRequestId;
  final String? nomorForm;

  const _FormView({required this.budgetRequestId, this.nomorForm});

  @override
  State<_FormView> createState() => _FormViewState();
}

class _FormViewState extends State<_FormView> {
  final _formKey = GlobalKey<FormState>();
  final _akunCtrl = TextEditingController();
  final _kodeCtrl = TextEditingController();
  final _anggaranAwalCtrl = TextEditingController();
  final _realisasiCtrl = TextEditingController();
  final _nominalCtrl = TextEditingController();
  final _alasanCtrl = TextEditingController();
  String _jenis = 'tambahan';

  double get _anggaranBaru {
    final awal = double.tryParse(_anggaranAwalCtrl.text) ?? 0;
    final nominal = double.tryParse(_nominalCtrl.text) ?? 0;
    return _jenis == 'tambahan' ? awal + nominal : awal - nominal;
  }

  @override
  void dispose() {
    _akunCtrl.dispose();
    _kodeCtrl.dispose();
    _anggaranAwalCtrl.dispose();
    _realisasiCtrl.dispose();
    _nominalCtrl.dispose();
    _alasanCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<UserBudgetRevisionBloc>().add(
          UserBudgetRevisionEvent.store(
            StoreBudgetRevisionModel(
              budgetRequestId: widget.budgetRequestId,
              akunTerdampak: _akunCtrl.text.trim(),
              kodeAkun: _kodeCtrl.text.trim().isEmpty
                  ? null
                  : _kodeCtrl.text.trim(),
              anggaranAwal: double.parse(_anggaranAwalCtrl.text),
              realisasi: double.parse(_realisasiCtrl.text),
              jenisPerubahan: _jenis,
              nominalPerubahan: double.parse(_nominalCtrl.text),
              alasanRevisi: _alasanCtrl.text.trim(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBudgetRevisionBloc, UserBudgetRevisionState>(
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
        final loading =
            state.maybeWhen(loading: () => true, orElse: () => false);
        return Scaffold(
          appBar: AppBar(title: const Text('Ajukan Revisi Anggaran')),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Info RAB terkait (read-only) ──
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.indigo.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.description_outlined,
                            color: Colors.indigo.shade400, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Revisi untuk: ${widget.nomorForm ?? "RAB #${widget.budgetRequestId}"}',
                            style: TextStyle(
                                fontSize: 12.5,
                                color: Colors.indigo.shade700,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  const _SectionHeader('Informasi Akun'),
                  _Field(
                    controller: _akunCtrl,
                    label: 'Akun Terdampak',
                    validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
                  ),
                  _Field(
                    controller: _kodeCtrl,
                    label: 'Kode Akun (opsional)',
                  ),
                  const SizedBox(height: 16),
                  const _SectionHeader('Perubahan Anggaran'),
                  _Field(
                    controller: _anggaranAwalCtrl,
                    label: 'Anggaran Awal',
                    keyboardType: TextInputType.number,
                    validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
                    onChanged: (_) => setState(() {}),
                  ),
                  _Field(
                    controller: _realisasiCtrl,
                    label: 'Realisasi',
                    keyboardType: TextInputType.number,
                    validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
                  ),
                  const SizedBox(height: 8),
                  const Text('Jenis Perubahan',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 4),
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(
                          value: 'tambahan',
                          label: Text('Tambahan'),
                          icon: Icon(Icons.add)),
                      ButtonSegment(
                          value: 'pengurangan',
                          label: Text('Pengurangan'),
                          icon: Icon(Icons.remove)),
                    ],
                    selected: {_jenis},
                    onSelectionChanged: (v) =>
                        setState(() => _jenis = v.first),
                  ),
                  const SizedBox(height: 8),
                  _Field(
                    controller: _nominalCtrl,
                    label: 'Nominal Perubahan',
                    keyboardType: TextInputType.number,
                    validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
                    onChanged: (_) => setState(() {}),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Anggaran Baru (estimasi)',
                            style: TextStyle(
                                fontSize: 12, color: Colors.blueGrey)),
                        Text(
                          'Rp ${_fmt(_anggaranBaru)}',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const _SectionHeader('Alasan Revisi'),
                  TextFormField(
                    controller: _alasanCtrl,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      labelText: 'Alasan Revisi',
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(),
                    ),
                    validator: (v) => v!.isEmpty ? 'Wajib diisi' : null,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: loading ? null : _submit,
                      child: loading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                  strokeWidth: 2, color: Colors.white))
                          : const Text('Ajukan Revisi'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _fmt(double v) {
    final s = v.abs().toStringAsFixed(0);
    final buf = StringBuffer();
    int c = 0;
    for (int i = s.length - 1; i >= 0; i--) {
      if (c > 0 && c % 3 == 0) buf.write('.');
      buf.write(s[i]);
      c++;
    }
    return (v < 0 ? '-' : '') + buf.toString().split('').reversed.join();
  }
}

class _Field extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const _Field({
    required this.controller,
    required this.label,
    this.keyboardType,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
        decoration: InputDecoration(
            labelText: label, border: const OutlineInputBorder()),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.indigo)),
    );
  }
}