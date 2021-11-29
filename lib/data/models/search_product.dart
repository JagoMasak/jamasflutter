// To parse required this JSON data, do
//
//     final cariProduk = cariProdukFromJson(jsonString);

import 'dart:convert';

CariProduk cariProdukFromJson(String str) => CariProduk.fromJson(json.decode(str));

String cariProdukToJson(CariProduk data) => json.encode(data.toJson());

class CariProduk {
    CariProduk({
        required this.status,
        required this.data,
    });

    bool status;
    List<Datum> data;

    factory CariProduk.fromJson(Map<String, dynamic> json) => CariProduk(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.idProduk,
        required this.namaProduk,
        required this.deskripsi,
        required this.jenis,
        required this.harga,
        required this.createdAt,
        required this.namaKategori,
        required this.namaMitra,
        required this.images,
    });

    String idProduk;
    String namaProduk;
    String deskripsi;
    String jenis;
    String harga;
    DateTime createdAt;
    String namaKategori;
    String namaMitra;
    String images;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idProduk: json["id_produk"],
        namaProduk: json["nama_produk"],
        deskripsi: json["deskripsi"],
        jenis: json["jenis"],
        harga: json["harga"],
        createdAt: DateTime.parse(json["created_at"]),
        namaKategori: json["nama_kategori"],
        namaMitra: json["nama_mitra"],
        images: json["images"],
    );

    Map<String, dynamic> toJson() => {
        "id_produk": idProduk,
        "nama_produk": namaProduk,
        "deskripsi": deskripsi,
        "jenis": jenis,
        "harga": harga,
        "created_at": createdAt.toIso8601String(),
        "nama_kategori": namaKategori,
        "nama_mitra": namaMitra,
        "images": images,
    };
}
