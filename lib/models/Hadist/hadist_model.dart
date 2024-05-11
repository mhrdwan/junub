class ModelHadist {
  int? code;
  String? message;
  List<DatasModel>? data;
  bool? error;

  ModelHadist({
    this.code,
    this.message,
    this.data,
    this.error,
  });

  factory ModelHadist.fromJson(Map<String, dynamic> json) => ModelHadist(
        code: json['code'],
        message: json['message'],
        data: json['data'] == null
            ? null
            : List<DatasModel>.from(
                json['data'].map((x) => DatasModel.fromJson(x))),
        error: json['error'],
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'data': data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        'error': error,
      };
}

class DatasModel {
  String? name;
  String? id;
  int? available;

  DatasModel({
    this.name,
    this.id,
    this.available,
  });

  factory DatasModel.fromJson(Map<String, dynamic> json) => DatasModel(
        name: json['name'],
        id: json['id'],
        available: json['available'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'id': id,
        'available': available,
      };
}
