import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alone/models/api.dart';
import 'package:alone/models/msiswa.dart';
import 'package:alone/views/form.dart';

class Create extends StatelessWidget {
  const Create({super.key});

  Future<void> _simpan(BuildContext context, SiswaModel siswa) async {
    final response = await http.post(
      Uri.parse(BaseUrl.simpan),
      body: {
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
        SnackBar(content: Text('Gagal menyimpan data: ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Siswa')),
      body: SiswaForm(
        submitLabel: 'Simpan',
        onSubmit: (siswa) => _simpan(context, siswa),
      ),
    );
  }
}