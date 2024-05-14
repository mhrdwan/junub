import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

Future<Map<String, dynamic>> getSholat() async {
  DateTime now = DateTime.now();
  var hari = DateFormat('yyyy-MM-dd').format(now);
  try {
    var response =
        await Dio().get('https://api.myquran.com/v2/sholat/jadwal/1301/$hari');
    return response.data['data'];
  } catch (e) {
    print(e);
    return {}; // Mengembalikan map kosong jika terjadi error
  }
}
