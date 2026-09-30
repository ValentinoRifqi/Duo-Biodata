import 'package:flutter/material.dart';
import 'package:alone/models/msiswa.dart';

class SiswaForm extends StatefulWidget {
  final SiswaModel? initial;
  final String submitLabel;
  final Future<void> Function(SiswaModel siswa) onSubmit;

  const SiswaForm({
    super.key,
    this.initial,
    required this.submitLabel,
    required this.onSubmit,
  });

  @override
  State<SiswaForm> createState() => _SiswaFormState();
}

class _SiswaFormState extends State<SiswaForm> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nisCtrl;
  late TextEditingController _namaCtrl;
  late TextEditingController _tplahirCtrl;
  late TextEditingController _tglahirCtrl;
  late TextEditingController _alamatCtrl;

  String _kelamin = 'laki laki';
  String _agama = 'islam';
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    final s = widget.initial;
    _nisCtrl = TextEditingController(text: s?.nis ?? '');
    _namaCtrl = TextEditingController(text: s?.nama ?? '');
    _tplahirCtrl = TextEditingController(text: s?.tplahir ?? '');
    _tglahirCtrl = TextEditingController(text: s?.tglahir ?? '');
    _alamatCtrl = TextEditingController(text: s?.alamat ?? '');
    if (s != null) {
      _kelamin = s.kelamin;
      _agama = s.agama;
    }
  }

  @override
  void dispose() {
    _nisCtrl.dispose();
    _namaCtrl.dispose();
    _tplahirCtrl.dispose();
    _tglahirCtrl.dispose();
    _alamatCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickTanggal() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate:
          DateTime.tryParse(_tglahirCtrl.text) ?? DateTime(now.year - 15),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      final formatted =
          '${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      setState(() => _tglahirCtrl.text = formatted);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _submitting = true);
    try {
      final siswa = SiswaModel(
        id: widget.initial?.id,
        nis: _nisCtrl.text.trim(),
        nama: _namaCtrl.text.trim(),
        tplahir: _tplahirCtrl.text.trim(),
        tglahir: _tglahirCtrl.text.trim(),
        kelamin: _kelamin,
        agama: _agama,
        alamat: _alamatCtrl.text.trim(),
      );
      await widget.onSubmit(siswa);
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  String? _required(String? v) =>
      (v == null || v.trim().isEmpty) ? 'Wajib diisi' : null;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextFormField(
            controller: _nisCtrl,
            decoration: const InputDecoration(labelText: 'NIS'),
            validator: _required,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _namaCtrl,
            decoration: const InputDecoration(labelText: 'Nama'),
            validator: _required,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _tplahirCtrl,
            decoration: const InputDecoration(labelText: 'Tempat Lahir'),
            validator: _required,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _tglahirCtrl,
            readOnly: true,
            decoration: const InputDecoration(
              labelText: 'Tanggal Lahir (yyyy-MM-dd)',
              suffixIcon: Icon(Icons.calendar_today),
            ),
            onTap: _pickTanggal,
            validator: _required,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _kelamin,
            decoration: const InputDecoration(labelText: 'Jenis Kelamin'),
            items: const [
              DropdownMenuItem(value: 'laki laki', child: Text('Laki-laki')),
              DropdownMenuItem(value: 'perempuan', child: Text('Perempuan')),
            ],
            onChanged: (v) => setState(() => _kelamin = v ?? _kelamin),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _agama,
            decoration: const InputDecoration(labelText: 'Agama'),
            items: const [
              DropdownMenuItem(value: 'islam', child: Text('Islam')),
              DropdownMenuItem(value: 'kristen', child: Text('Kristen')),
              DropdownMenuItem(value: 'katolik', child: Text('Katolik')),
              DropdownMenuItem(value: 'hindu', child: Text('Hindu')),
              DropdownMenuItem(value: 'buddha', child: Text('Buddha')),
              DropdownMenuItem(value: 'konghucu', child: Text('Konghucu')),
            ],
            onChanged: (v) => setState(() => _agama = v ?? _agama),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _alamatCtrl,
            decoration: const InputDecoration(labelText: 'Alamat'),
            maxLines: 3,
            validator: _required,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: _submitting ? null : _submit,
            child: _submitting
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(widget.submitLabel),
          ),
        ],
      ),
    );
  }
}