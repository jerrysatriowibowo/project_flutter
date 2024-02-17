// pasien_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_project/app/data/models/pasien_model.dart';
import 'package:flutter_project/app/modules/pasien/controllers/pasien_controller.dart';

class PasienView extends StatelessWidget {
  final PasienController controller = Get.put(PasienController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pasien'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/tambah-pasien');
            },
          ),
        ],
      ),
body: Obx(
  () => controller.pasienList.isEmpty
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(
          itemCount: controller.pasienList.length,
          itemBuilder: (context, index) {
            var pasien = controller.pasienList[index];
            return ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(pasien.nama),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Get.toNamed('/edit-pasien', arguments: pasien);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      Get.toNamed('/detail-pasien', arguments: pasien);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDeleteConfirmation(context, pasien);
                    },
                  ),
                ],
              ),
              subtitle: Text(pasien.jenisKelamin),
              onTap: () {
                pasien.isEditable = true;
                controller.showPasienDetails(pasien);
              },
            );
          },
        ),
      ),
    );
  }
  void showDeleteConfirmation(BuildContext context, Pasien pasien) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Pasien'),
          content: Text('Are you sure you want to delete ${pasien.nama}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                controller.deletePasien(pasien);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}