import 'package:dio/dio.dart';
import '../models/categories.dart';
import '../models/locations.dart';
import '../models/manufacturer.dart';
import '../models/mechanic.dart';
import '../models/suppliers.dart';

class APIService{
  static const String _BASE_URL = "http://mfrh.me/smmapeltar/api/";
  //api lokasi
  static Future<Locations> getAllLocation() async{
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}locations");
    if (request.statusCode == 200){
      return Locations.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }
  //add location
  static Future<int> addLocation(String namaGedung, String lantai) async{
    var dio = Dio();
    var request = await dio.post("${_BASE_URL}locations", data: {
      "nama_gedung": namaGedung,
      "lantai": lantai
    });
    if (request.statusCode == 200){
      return 1;
    } else {
      return 0;
    }
  }
  //update loaction
  static Future<int> updateLocation(String id, String namaGedung, String lantai) async{
    var dio = Dio();
    var request = await dio.put("${_BASE_URL}locations/$id", data: {
      "nama_gedung": namaGedung,
      "lantai": lantai
    });
    if (request.statusCode == 200){
      return 1;
    } else {
      return 0;
    }
  }

  //api teknisi
  static Future<Mechanic> getAllMechanic() async{
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}teknisi");
    if (request.statusCode == 200){
      return Mechanic.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }
  static Future<int> addMechanic(String nik, String nama) async{
    var dio = Dio();
    var request = await dio.post("${_BASE_URL}teknisi", data: {
      "nik": nik,
      "nama_teknisi": nama
    });
    if (request.statusCode == 200){
      return 1;
    } else {
      return 0;
    }
  }

  //supplioer
  static Future<Suppliers> getAllSuppliers() async{
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}suppliers");
    if (request.statusCode == 200){
      return Suppliers.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }
  static Future<int> addSuppliers(String nama, String noTelp) async{
    var dio = Dio();
    var request = await dio.post("${_BASE_URL}suppliers", data: {
      "nama_supplier": nama,
      "no_telp": noTelp
    });
    if (request.statusCode == 200){
      return 1;
    } else {
      return 0;
    }
  }
  //kategori
  static Future<Categories> getAllCategories() async{
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}categories");
    if (request.statusCode == 200){
      return Categories.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }
  static Future<int> addCategories(String nama) async{
    var dio = Dio();
    var request = await dio.post("${_BASE_URL}categories", data: {
      "nama_kategori": nama,
    });
    if (request.statusCode == 200){
      return 1;
    } else {
      return 0;
    }
  }

  static Future<int> updateCategories(String name, String id) async{
    var dio = Dio();
    var request = await dio.put("${_BASE_URL}categories/$id", data: {
      "nama_kategori": name,
    });
    if (request.statusCode == 200){
      return 1;
    }else{
      return 0;
    }
  }

  //manufacture
  static Future<Manufacturer> getAllManufacturer() async{
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}manufacturer");
    if (request.statusCode == 200){
      return Manufacturer.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<int> addManufacturer(String nama) async{
    var dio = Dio();
    var request = await dio.post("${_BASE_URL}manufacturer", data: {
      "nama_manufactur": nama,
    });
    if (request.statusCode == 200){
      return 1;
    } else {
      return 0;
    }
  }
  static Future<int> updateManufacturer(String nama_manufactur, String uuid) async{
    var dio = Dio();
    var request = await dio.put("${_BASE_URL}manufacturer/$uuid", data: {
      "nama_manufactur" : nama_manufactur,
    });
    if (request.statusCode == 200){
      return 1;
    }else{
      return 0;
    }
  }

}