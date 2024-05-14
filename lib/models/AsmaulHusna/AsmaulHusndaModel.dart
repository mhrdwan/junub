// ignore_for_file: public_member_api_docs, sort_constructors_first
class AsmaulHusnaModel {
  bool status;
  List<Data>? data;
  AsmaulHusnaModel({
    required this.status,
    this.data,
  });
  factory AsmaulHusnaModel.fromJson(Map<String, dynamic> json) {
    return AsmaulHusnaModel(
      status: json['status'],
      data: json['data'] != null
          ? List<Data>.from(json['data'].map((x) => Data.fromJson(x)))
          : null,
    );
  }
}

class Data {
  String? arab;
  String? indo;
  int? id;
  String? latin;

  Data({
    required this.arab,
    required this.indo,
    required this.id,
    required this.latin,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      arab: json['arab'],
      indo: json['indo'],
      id: json['id'],
      latin: json['latin'],
    );
  }
}
