import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alone/models/api.dart';
import 'package:alone/models/msiswa.dart';
import 'package:alone/views/form.dart';

class Edit extends StatelessWidget {
  final SiswaModel sw;

  const Edit({super.key, required this.sw});

  Future<void> _update(BuildContext context, SiswaModel siswa) async {
    final response = await http.post(
      Uri.parse(BaseUrl.edit),
      body: {
        'id': sw.id ?? '',
        'nis': siswa.nis,
        'nama': siswa.nama,
        'tplahir': siswa.tplahir,
        'tglahir': siswa.tglahir,
        'kelamin': siswa.kelamin,
        'agama': siswa.agama,
        'alamat': siswa.alamat,
      },
    );

    Map<String, dynamic> decoded = {};
    try {
      decoded = json.decode(response.body);
    } catch (_) {}
    final success = decoded['success'] == true;

    if (!context.mounted) return;

    if (success) {
      Navigator.pop(context, true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengubah data: ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Siswa')),
      body: SiswaForm(
        initial: sw,
        submitLabel: 'Update',
        onSubmit: (siswa) => _update(context, siswa),
      ),
    );
  }
}