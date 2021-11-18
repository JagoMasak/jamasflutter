// To parse required this JSON data, do
//
//     final semuaProduk = semuaProdukFromJson(jsonString);

import 'dart:convert';

SemuaProduk semuaProdukFromJson(String str) => SemuaProduk.fromJson(json.decode(str));

String semuaProdukToJson(SemuaProduk data) => json.encode(data.toJson());

class SemuaProduk {
    SemuaProduk({
        required this.status,
        required this.data,
    });

    bool status;
    List<Datum> data;

    factory SemuaProduk.fromJson(Map<String, dynamic> json) => SemuaProduk(
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
        required this.idMitra,
        required this.idJenis,
        required this.namaProduk,
        required this.deskripsi,
        required this.gambar,
        required this.harga,
        required this.jenisProduk,
        required this.namaMitra,
        required this.namaToko,
        required this.alamatToko,
        required this.nohp,
        required this.email,
    });

    String idProduk;
    String idMitra;
    String idJenis;
    String namaProduk;
    String deskripsi;
    String gambar;
    String harga;
    String jenisProduk;
    String namaMitra;
    String namaToko;
    String alamatToko;
    String nohp;
    String email;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idProduk: json["id_produk"],
        idMitra: json["id_mitra"],
        idJenis: json["id_jenis"],
        namaProduk: json["nama_produk"],
        deskripsi: json["deskripsi"],
        gambar: json["gambar"],
        harga: json["harga"],
        jenisProduk: json["jenis_produk"],
        namaMitra: json["nama_mitra"],
        namaToko: json["nama_toko"],
        alamatToko: json["alamat_toko"],
        nohp: json["nohp"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id_produk": idProduk,
        "id_mitra": idMitra,
        "id_jenis": idJenis,
        "nama_produk": namaProduk,
        "deskripsi": deskripsi,
        "gambar": gambar,
        "harga": harga,
        "jenis_produk": jenisProduk,
        "nama_mitra": namaMitra,
        "nama_toko": namaToko,
        "alamat_toko": alamatToko,
        "nohp": nohp,
        "email": email,
    };
}
