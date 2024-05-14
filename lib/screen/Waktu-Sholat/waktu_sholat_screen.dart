import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:junub/models/JadwalSholat/ListSemuaKota/List-SemuaKota.dart';

class WaktuSholat extends StatefulWidget {
  const WaktuSholat({super.key});

  @override
  State<WaktuSholat> createState() => _WaktuSholatState();
}

ListKota? listKota;

class _WaktuSholatState extends State<WaktuSholat> {
  void getWaktuSholat() async {
    try {
      var response =
          await Dio().get('https://api.myquran.com/v2/sholat/kota/semua');
      print(response.data);
      setState(() {
        listKota = ListKota.fromJson(response.data);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWaktuSholat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(listKota?.status?.toString() ?? "Unknown Status"),
      ),
    );
  }
}
