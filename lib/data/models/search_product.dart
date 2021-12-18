// To parse required this JSON data, do
//
//     final cariProduk = cariProdukFromJson(jsonString);

import 'dart:convert';

CariProduk cariProdukFromJson(String str) => CariProduk.fromJson(json.decode(str));

String cariProdukToJson(CariProduk data) => json.encode(data.toJson());

class CariProduk {
    CariProduk({
        required this.meta,
        required this.data,
    });

    Meta meta;
    List<Datum> data;

    factory CariProduk.fromJson(Map<String, dynamic> json) => CariProduk(
        meta: Meta.fromJson(json["meta"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.nama,
        required this.deskripsi,
        required this.kategori,
        required this.jenis,
        required this.harga,
        required this.penjual,
        required this.diposting,
        required this.gambar,
    });

    String id;
    String nama;
    String deskripsi;
    Kategori kategori;
    String jenis;
    String harga;
    String penjual;
    String diposting;
    List<Gambar> gambar;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        deskripsi: json["deskripsi"],
        kategori: Kategori.fromJson(json["kategori"]),
        jenis: json["jenis"],
        harga: json["harga"],
        penjual: json["penjual"],
        diposting: json["diposting"],
        gambar: List<Gambar>.from(json["gambar"].map((x) => Gambar.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "deskripsi": deskripsi,
        "kategori": kategori.toJson(),
        "jenis": jenis,
        "harga": harga,
        "penjual": penjual,
        "diposting": diposting,
        "gambar": List<dynamic>.from(gambar.map((x) => x.toJson())),
    };
}

class Gambar {
    Gambar({
        required this.id,
        required this.url,
    });

    String id;
    String url;

    factory Gambar.fromJson(Map<String, dynamic> json) => Gambar(
        id: json["id"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
    };
}

class Kategori {
    Kategori({
        required this.id,
        required this.nama,
    });

    String id;
    String nama;

    factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json["id"],
        nama: json["nama"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
    };
}

class Meta {
    Meta({
        required this.code,
        required this.status,
        required this.message,
    });

    int code;
    String status;
    String message;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
    };
}
