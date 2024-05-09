class detailSuratModel {
  int code;
  String message;
  Data data;

  detailSuratModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory detailSuratModel.fromJson(Map<String, dynamic> json) {
    return detailSuratModel(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      data: Data.fromJson(json['data'] ?? {}),
    );
  }
}

class Data {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  Map<String, String> audioFull;
  List<Ayat> ayat;
  SuratSelanjutnya suratSelanjutnya;
  bool suratSebelumnya;

  Data({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
    required this.ayat,
    required this.suratSelanjutnya,
    required this.suratSebelumnya,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      nomor: json['nomor'] ?? 0,
      nama: json['nama'] ?? '',
      namaLatin: json['nama_latin'] ?? '',
      jumlahAyat: json['jumlah_ayat'] ?? 0,
      tempatTurun: json['tempat_turun'] ?? '',
      arti: json['arti'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      audioFull: json['audio_full'] != null
          ? Map<String, String>.from(json['audio_full'])
          : {},
      ayat: json['ayat'] != null
          ? List<Ayat>.from(json['ayat'].map((x) => Ayat.fromJson(x)))
          : [],
      suratSelanjutnya: json['surat_selanjutnya'] != null
          ? SuratSelanjutnya.fromJson(json['surat_selanjutnya'])
          : SuratSelanjutnya.empty(),
      suratSebelumnya: json['surat_sebelumnya'] ?? false,
    );
  }
}

class Ayat {
  int nomorAyat;
  String teksArab;
  String teksLatin;
  String teksIndonesia;
  Map<String, String> audio;

  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomorAyat: json['nomor_ayat'] ?? 0,
      teksArab: json['teks_arab'] ?? '',
      teksLatin: json['teks_latin'] ?? '',
      teksIndonesia: json['teks_indonesia'] ?? '',
      audio:
          json['audio'] != null ? Map<String, String>.from(json['audio']) : {},
    );
  }
}

class SuratSelanjutnya {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;

  SuratSelanjutnya({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
  });

  factory SuratSelanjutnya.fromJson(Map<String, dynamic> json) {
    return SuratSelanjutnya(
      nomor: json['nomor'] ?? 0,
      nama: json['nama'] ?? '',
      namaLatin: json['nama_latin'] ?? '',
      jumlahAyat: json['jumlah_ayat'] ?? 0,
    );
  }

  // An empty constructor for cases when the JSON is missing
  factory SuratSelanjutnya.empty() {
    return SuratSelanjutnya(
      nomor: 0,
      nama: '',
      namaLatin: '',
      jumlahAyat: 0,
    );
  }
}
