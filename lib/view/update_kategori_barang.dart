import 'package:flutter/material.dart';

import '../controller/kategori_barang_controller.dart';
import 'kategori_barang.dart';

class UpdateKategoriBarang extends StatefulWidget {
  final int? id;
  final String? nama;

  const UpdateKategoriBarang({
    Key? key,
    this.nama,
    this.id,
  }) : super(key: key);

  @override
  State<UpdateKategoriBarang> createState() => _UpdateKategoriBarangState();
}

class _UpdateKategoriBarangState extends State<UpdateKategoriBarang> {
  final kategoriBarangController = KategoriBarangController();
  String? name;

  void updateKategoriBarang(int id, String nama) async {
    await kategoriBarangController.updateKategoriBarang(id, nama);
  }

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Kategori Barang'),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Update Kategori Barang',
                labelText: 'Nama Kategori Barang',
              ),
              onChanged: (value) {
                name = value;
              },
              initialValue: widget.nama,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama Kategori is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  kategoriBarangController.updateKategoriBarang(
                      widget.id!, name!);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const KategoriBarang()));

                  var snackBar =
                      const SnackBar(content: Text('Data Berhasil Disimpan'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
