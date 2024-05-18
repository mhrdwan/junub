class ListKota {
  bool? status; // Mengubah dari String? ke bool?
  List<Data>? data; // Mengubah dari Data? ke List<Data>?

  ListKota({this.status, this.data});

  factory ListKota.fromJson(Map<String, dynamic> json) {
    return ListKota(
      status: json['status'],
      data: json['data'] != null
          ? List<Data>.from(json['data'].map((x) => Data.fromJson(x)))
          : null,
    );
  }
}

class Data {
  String
      id; // Mengubah tipe dari int ke String karena dalam JSON, "id" adalah string
  String lokasi;

  Data({required this.id, required this.lokasi});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      lokasi: json['lokasi'],
    );
  }
}
