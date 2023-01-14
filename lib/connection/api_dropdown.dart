import 'package:dio/dio.dart';
import 'package:gudang/models/categories.dart' as categories;
import 'package:gudang/models/manufacturer.dart' as manufactur;
import 'package:gudang/models/suppliers.dart' as suppliers;
import 'package:gudang/models/models_barang.dart' as models;
import 'package:gudang/models/locations.dart' as locations;


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
  static Future<List<suppliers.Data>> getAllSupplier() async{
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}suppliers");
    if (request.statusCode == 200){
      return suppliers.Data.fromJsonList(request.data['data']);
    } else {
      return [];
    }
  }
  static Future<List<categories.Data>> getAllCategories() async{
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}categories");
    if (request.statusCode == 200){
      return categories.Data.fromJsonList(request.data['data']);
    } else {
      return [];
    }
  }
  static Future<List<models.Data>> getAllModels() async{
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}modelsbarang");
    if (request.statusCode == 200){
      return models.Data.fromJsonList(request.data['data']);
    } else {
      return [];
    }
  }
  static Future<List<locations.Data>> getAlLLocation() async{
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}locations");
    if (request.statusCode == 200){
      return locations.Data.fromJsonList(request.data['data']);
    } else {
      return [];
    }
  }


}