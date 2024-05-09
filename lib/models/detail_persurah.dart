class DetailSurahResponse {
  String? message;
  int? code;
  SurahDetail? data;

  DetailSurahResponse({this.message, this.code, this.data});

  factory DetailSurahResponse.fromJson(Map<String, dynamic> json) {
    return DetailSurahResponse(
      message: json['message'],
      code: json['code'],
      data: json['data'] != null ? SurahDetail.fromJson(json['data']) : null,
    );
  }
}

class SurahDetail {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  Map<String, String>? audioFull;
  List<AyatDetail>? ayat;

  SurahDetail({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
    this.ayat,
  });

  factory SurahDetail.fromJson(Map<String, dynamic> json) {
    return SurahDetail(
      nomor: json['nomor'],
      nama: json['nama'],
      namaLatin: json['namaLatin'],
      jumlahAyat: json['jumlahAyat'],
      tempatTurun: json['tempatTurun'],
      arti: json['arti'],
      deskripsi: json['deskripsi'],
      audioFull: json['audioFull']?.cast<String, String>(),
      ayat: json['ayat']
          ?.map<AyatDetail>((item) => AyatDetail.fromJson(item))
          .toList(),
    );
  }
}

class AyatDetail {
  int? nomorAyat;
  String? teksArab;
  String? teksLatin;
  String? teksIndonesia;
  Map<String, String>? audio;

  AyatDetail({
    this.nomorAyat,
    this.teksArab,
    this.teksLatin,
    this.teksIndonesia,
    this.audio,
  });

  factory AyatDetail.fromJson(Map<String, dynamic> json) {
    return AyatDetail(
      nomorAyat: json['nomorAyat'],
      teksArab: json['teksArab'],
      teksLatin: json['teksLatin'],
      teksIndonesia: json['teksIndonesia'],
      audio: json['audio']?.cast<String, String>(),
    );
  }
}
