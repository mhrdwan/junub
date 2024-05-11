class DetailHadistModel {
  int code;
  String message;
  Data? data;

  DetailHadistModel({required this.code, required this.message, this.data});

  factory DetailHadistModel.fromJson(Map<String, dynamic> json) {
    return DetailHadistModel(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  String name;
  String id;
  int available;
  int requested;
  List<Hadith> hadiths;

  Data({
    required this.name,
    required this.id,
    required this.available,
    required this.requested,
    required this.hadiths,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var hadithsJson = json['hadiths'] as List;
    List<Hadith> hadiths =
        hadithsJson.map((hadith) => Hadith.fromJson(hadith)).toList();

    return Data(
      name: json['name'],
      id: json['id'],
      available: json['available'],
      requested: json['requested'],
      hadiths: hadiths,
    );
  }
}

class Hadith {
  int number;
  String arab;
  String id;

  Hadith({required this.number, required this.arab, required this.id});

  factory Hadith.fromJson(Map<String, dynamic> json) {
    return Hadith(
      number: json['number'],
      arab: json['arab'],
      id: json['id'],
    );
  }
}
