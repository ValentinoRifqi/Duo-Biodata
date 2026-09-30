import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alone/models/api.dart';
import 'package:alone/models/msiswa.dart';
import 'package:alone/views/edit.dart';

class Details extends StatelessWidget {
  final SiswaModel sw;

  const Details({super.key, required this.sw});

  Future<void> _hapus(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus data?'),
        content: Text('Yakin ingin menghapus data "${sw.nama}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    final response = await http.post(
      Uri.parse(BaseUrl.hapus),
      body: {'id': sw.id ?? ''},
    );

    Map<String, dynamic> decoded = {};
    try {
      decoded = json.decode(response.body);
    } catch (_) {}
    final success = decoded['success'] == true;

    if (!context.mounted) return;

    if (success) {
      Navigator.pop(context, true); // beri tahu Home untuk refresh
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menghapus data: ${response.body}')),
      );
    }
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Text(': '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Siswa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final changed = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Edit(sw: sw)),
              );
              if (changed == true && context.mounted) {
                Navigator.pop(context, true);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _hapus(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _row('NIS', sw.nis),
            _row('Nama', sw.nama),
            _row('Tempat Lahir', sw.tplahir),
            _row('Tanggal Lahir', sw.tglahir),
            _row('Kelamin', sw.kelamin),
            _row('Agama', sw.agama),
            _row('Alamat', sw.alamat),
          ],
        ),
      ),
    );
  }
}