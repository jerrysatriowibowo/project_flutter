import 'package:flutter/material.dart';
import 'package:flutter_project/app/data/models/pasien_model.dart';

class DetailPasienView extends StatelessWidget {
  final Pasien pasien;

  DetailPasienView({required this.pasien});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pasien'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: ${pasien.nama}'),
            Text('Jenis Kelamin: ${pasien.jenisKelamin}'),
            Text('Alamat: ${pasien.alamat}'),
            Text('Tanggal Lahir: ${pasien.tglLahir}'),
            Text('No. Telp: ${pasien.noTelp}'),
          ],
        ),
      ),
    );
  }
}