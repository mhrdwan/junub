import 'package:dio/dio.dart';

Future<Map<String, dynamic>> getSholat() async {
  try {
    var response = await Dio()
        .get('https://api.myquran.com/v2/sholat/jadwal/1301/2024-05-14');
    return response.data['data'];
  } catch (e) {
    print(e);
    return {}; // Mengembalikan map kosong jika terjadi error
  }
}
