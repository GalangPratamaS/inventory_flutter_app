class ResponseBarang {
    final String? pesan;
    final bool? sukses;
    final List<Barang>? barang;

    ResponseBarang({
        this.pesan,
        this.sukses,
        this.barang,
    });

    factory ResponseBarang.fromJson(Map<String, dynamic> json) => ResponseBarang(
        pesan: json["pesan"],
        sukses: json["sukses"],
        barang: json["barang"] == null ? [] : List<Barang>.from(json["barang"]!.map((x) => Barang.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pesan": pesan,
        "sukses": sukses,
        "barang": barang == null ? [] : List<dynamic>.from(barang!.map((x) => x.toJson())),
    };
}

class Barang {
    final String? barangId;
    final String? barangNama;
    final String? barangJumlah;
    final String? barangGambar;

    Barang({
        this.barangId,
        this.barangNama,
        this.barangJumlah,
        this.barangGambar,
    });

    factory Barang.fromJson(Map<String, dynamic> json) => Barang(
        barangId: json["barang_id"],
        barangNama: json["barang_nama"],
        barangJumlah: json["barang_jumlah"],
        barangGambar: json["barang_gambar"],
    );

    Map<String, dynamic> toJson() => {
        "barang_id": barangId,
        "barang_nama": barangNama,
        "barang_jumlah": barangJumlah,
        "barang_gambar": barangGambar,
    };
}
