import 'dart:ffi';

import 'package:dio/dio.dart';

import '../models/locations.dart';

class APIService{
  static const String _BASE_URL = "http://mfrh.me/smmapeltar/api/";

  static Future<Locations> getAllLocation() async{
    var dio = Dio();
    var request = await dio.get(_BASE_URL + "locations");
    if (request.statusCode == 200){
      return Locations.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }
  //add location
  static Future<int> addLocation(String namaGedung, String lantai) async{
    var dio = Dio();
    var request = await dio.post(_BASE_URL + "locations", data: {
      "nama_gedung": namaGedung,
      "lantai": lantai
    });
    if (request.statusCode == 200){
      return 1;
    } else {
      return 0;
    }
  }
}