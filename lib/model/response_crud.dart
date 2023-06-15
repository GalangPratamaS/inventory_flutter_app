class ResponseCrud {
    final bool? sukses;
    final String? pesan;
    final int? lastId;

    ResponseCrud({
        this.sukses,
        this.pesan,
        this.lastId,
    });

    factory ResponseCrud.fromJson(Map<String, dynamic> json) => ResponseCrud(
        sukses: json["sukses"],
        pesan: json["pesan"],
        lastId: json["last_id"],
    );

    Map<String, dynamic> toJson() => {
        "sukses": sukses,
        "pesan": pesan,
        "last_id": lastId,
    };
}
