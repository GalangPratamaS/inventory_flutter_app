class ResponseRegister {
    final bool sukses;
    final String pesan;

    ResponseRegister({
        required this.sukses,
        required this.pesan,
    });

    factory ResponseRegister.fromJson(Map<String, dynamic> json) => ResponseRegister(
        sukses: json["sukses"],
        pesan: json["pesan"],
    );

    Map<String, dynamic> toJson() => {
        "sukses": sukses,
        "pesan": pesan,
    };
}
