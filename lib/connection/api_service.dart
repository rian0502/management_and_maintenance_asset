import 'package:dio/dio.dart';
import '../models/assets.dart';
import '../models/categories.dart';
import '../models/locations.dart';
import '../models/manufacturer.dart';
import '../models/mechanic.dart';
import '../models/models_barang.dart';
import '../models/suppliers.dart';

class APIService {
  static const String _BASE_URL = "http://mfrh.me/smmapeltar/api/";
  //api lokasi
  static Future<Locations> getAllLocation() async {
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}locations");
    if (request.statusCode == 200) {
      return Locations.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }

  //add location
  static Future<int> addLocation(String namaGedung, String lantai) async {
    var dio = Dio();
    var request = await dio.post("${_BASE_URL}locations",
        data: {"nama_gedung": namaGedung, "lantai": lantai});
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  //update loaction
  static Future<int> updateLocation(
      String id, String namaGedung, String lantai) async {
    var dio = Dio();
    var request = await dio.put("${_BASE_URL}locations/$id",
        data: {"nama_gedung": namaGedung, "lantai": lantai});
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  //api teknisi
  static Future<Mechanic> getAllMechanic() async {
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}teknisi");
    if (request.statusCode == 200) {
      return Mechanic.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<int> addMechanic(String nik, String nama) async {
    var dio = Dio();
    var request = await dio
        .post("${_BASE_URL}teknisi", data: {"nik": nik, "nama_teknisi": nama});
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  static Future<int> updateMehcanic(
      String uuid, String nama, String nik) async {
    var dio = Dio();
    var request = await dio.put("${_BASE_URL}teknisi/$uuid",
        data: {"nik": nik, "nama_teknisi": nama});
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  //supplioer
  static Future<Suppliers> getAllSuppliers() async {
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}suppliers");
    if (request.statusCode == 200) {
      return Suppliers.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<int> addSuppliers(String nama, String noTelp) async {
    var dio = Dio();
    var request = await dio.post("${_BASE_URL}suppliers",
        data: {"nama_supplier": nama, "no_telp": noTelp});
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  static Future<int> updateSuppliers(
      String uuid, String namaSuplier, String noTLP) async {
    var dio = Dio();
    var request = await dio.put("${_BASE_URL}suppliers/$uuid",
        data: {"nama_supplier": namaSuplier, "no_telp": noTLP});
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  //kategori
  static Future<Categories> getAllCategories() async {
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}categories");
    if (request.statusCode == 200) {
      return Categories.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<int> addCategories(String nama) async {
    var dio = Dio();
    var request = await dio.post("${_BASE_URL}categories", data: {
      "nama_kategori": nama,
    });
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  static Future<int> updateCategories(String name, String id) async {
    var dio = Dio();
    var request = await dio.put("${_BASE_URL}categories/$id", data: {
      "nama_kategori": name,
    });
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  //manufacture
  static Future<Manufacturer> getAllManufacturer() async {
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}manufacturer");
    if (request.statusCode == 200) {
      return Manufacturer.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<int> addManufacturer(String nama) async {
    var dio = Dio();
    var request = await dio.post("${_BASE_URL}manufacturer", data: {
      "nama_manufactur": nama,
    });
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  static Future<int> updateManufacturer(
      String nama_manufactur, String uuid) async {
    var dio = Dio();
    var request = await dio.put("${_BASE_URL}manufacturer/$uuid", data: {
      "nama_manufactur": nama_manufactur,
    });
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  // request untuk table models
  static Future<Models> getAllModels() async {
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}modelsbarang");
    if (request.statusCode == 200) {
      return Models.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<int> addModels(String namaModel, String idManufacture,
      String idCategory, String noModel) async {
    var dio = Dio();
    var request = await dio.post("${_BASE_URL}modelsbarang", data: {
      "nama_model": namaModel,
      "id_manufacturer": idManufacture,
      "id_kategori": idCategory,
      "no_model": noModel,
    });
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  static Future<int> updateModels(String namaModel, String idManufacturer,
      String idCategory, String noModel, String uuid) async {
    var dio = Dio();
    var request = await dio.put("${_BASE_URL}modelsbarang/$uuid", data: {
      "nama_model": namaModel,
      "id_manufacturer": idManufacturer,
      "id_kategori": idCategory,
      "no_model": noModel
    });
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }

  //asset
  static Future<Assets> getAllAssets() async {
    var dio = Dio();
    var request = await dio.get("${_BASE_URL}assets");
    if (request.statusCode == 200) {
      return Assets.fromJson(request.data);
    } else {
      throw Exception("Failed to load data");
    }
  }

  static Future<int> addAsset(
      String idModel,
      String idSupplier,
      String idLocation,
      String namaAset,
      String purchaseDate,
      String orderNumber,
      String ket) async {
    var dio = Dio();
    var request = await dio.post("${_BASE_URL}assets", data: {
      "id_model": idModel,
      "id_supplier": idSupplier,
      "id_location": idLocation,
      "nama_asset": namaAset,
      "purchase_date": purchaseDate,
      "order_number": orderNumber,
      "notes": ket
    });
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }
  static Future<int> updateAsset(
      String idModel,
      String idSupplier,
      String idLocation,
      String namaAset,
      String purchaseDate,
      String orderNumber,
      String ket,
      String uuid) async {
    var dio = Dio();
    var request = await dio.put("${_BASE_URL}assets/$uuid", data: {
      "id_model": idModel,
      "id_supplier": idSupplier,
      "id_location": idLocation,
      "nama_asset": namaAset,
      "purchase_date": purchaseDate,
      "order_number": orderNumber,
      "notes": ket
    });
    if (request.statusCode == 200) {
      return 1;
    } else {
      return 0;
    }
  }
}
