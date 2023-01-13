import 'package:dio/dio.dart';
import 'package:gudang/models/manufacturer.dart' as manufactur;
import 'package:gudang/models/suppliers.dart' as suppliers;


class APIDropDown{
  static const String _BASE_URL = "http://mfrh.me/smmapeltar/api/";

  static Future<List<manufactur.Data>> getAllManufacturer(String nama) async{
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}manufacturer/$nama");
    if (request.statusCode == 200){
      return manufactur.Data.fromJsonList(request.data['data']);
    } else {
      return [];
    }
  }
  static Future<List<suppliers.Data>> getAllSupplier(String nama) async{
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}suppliers");
    if (request.statusCode == 200){
      return suppliers.Data.fromJsonList(request.data['data']);
    } else {
      return [];
    }
  }
}