import 'package:apipoke/view/update_kategori_barang.dart';
import 'package:flutter/material.dart';

import '../controller/kategori_barang_controller.dart';
import '../model/kategori_barang_model.dart';
import 'add_kategori_barang.dart';

class KategoriBarang extends StatefulWidget {
  const KategoriBarang({super.key});

  @override
  State<KategoriBarang> createState() => _KategoriBarangState();
}

class _KategoriBarangState extends State<KategoriBarang> {
  final kategoriBarangController = KategoriBarangController();
  List<KategoriBarangModel> listKategoriBarang = [];
  String? nama;

  @override
  void initState() {
    super.initState();
    getKategoriBarang();
  }

  void getKategoriBarang() async {
    final KategoriBarang = await kategoriBarangController.getKategoriBarang();
    setState(() {
      listKategoriBarang = KategoriBarang;
    });
  }

  void deleteKategoriBarang(int id) async {
    await kategoriBarangController.deleteKategoriBarang(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Barang'),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: listKategoriBarang.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
            child: InkWell(
              onLongPress: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateKategoriBarang(
                      id: listKategoriBarang[index].id,
                      nama: listKategoriBarang[index].nama,
                    ),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  title: Text(listKategoriBarang[index].nama),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          deleteKategoriBarang(listKategoriBarang[index].id);
                          setState(() {
                            listKategoriBarang.removeAt(index);
                          });
                          var snackBar = const SnackBar(
                              content: Text('Kategori Berhasil Dihapus'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddKategoriBarang()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
