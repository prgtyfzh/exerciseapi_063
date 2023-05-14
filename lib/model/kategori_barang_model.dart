import 'dart:convert';

class KategoriBarangModel {
  final String nama;
  var id;
  KategoriBarangModel({
    required this.nama,
    this.id,
  });

  KategoriBarangModel copyWith({
    int? id,
    String? nama,
  }) {
    return KategoriBarangModel(
      id: id,
      nama: nama ?? this.nama,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_kategori_barang': id.toMap(),
      'nama_kategori_barang': nama,
    };
  }

  factory KategoriBarangModel.fromMap(Map<String, dynamic> map) {
    return KategoriBarangModel(
      id: map['id_kategori_barang'] ?? '',
      nama: map['nama_kategori_barang'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory KategoriBarangModel.fromJson(String source) =>
      KategoriBarangModel.fromMap(json.decode(source));

  @override
  String toString() => 'KategoriBarangModel(nama: $nama)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KategoriBarangModel && other.nama == nama;
  }

  @override
  int get hashCode => nama.hashCode;
}
