// ignore_for_file: public_member_api_docs, sort_constructors_first
class ListSholatHarian {
  int id;
  String lokasi;
  String daerah;
  Jadwal jadwal;

  ListSholatHarian({
    required this.id,
    required this.lokasi,
    required this.daerah,
    required this.jadwal,
  });

  factory ListSholatHarian.fromJson(Map<String, dynamic> json) {
    return ListSholatHarian(
      id: json['id'],
      lokasi: json['lokasi'],
      daerah: json['daerah'],
      jadwal: Jadwal.fromJson(json['jadwal']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'lokasi': lokasi,
      'daerah': daerah,
      'jadwal': jadwal.toJson(),
    };
  }
}

class Jadwal {
  String tanggal;
  String imsak;
  String subuh;
  String terbit;
  String dhuha;
  String dzuhur;
  String ashar;
  String maghrib;
  String isya;
  String date;

  Jadwal({
    required this.tanggal,
    required this.imsak,
    required this.subuh,
    required this.terbit,
    required this.dhuha,
    required this.dzuhur,
    required this.ashar,
    required this.maghrib,
    required this.isya,
    required this.date,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    return Jadwal(
      tanggal: json['tanggal'],
      imsak: json['imsak'],
      subuh: json['subuh'],
      terbit: json['terbit'],
      dhuha: json['dhuha'],
      dzuhur: json['dzuhur'],
      ashar: json['ashar'],
      maghrib: json['maghrib'],
      isya: json['isya'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tanggal': tanggal,
      'imsak': imsak,
      'subuh': subuh,
      'terbit': terbit,
      'dhuha': dhuha,
      'dzuhur': dzuhur,
      'ashar': ashar,
      'maghrib': maghrib,
      'isya': isya,
      'date': date,
    };
  }
}
