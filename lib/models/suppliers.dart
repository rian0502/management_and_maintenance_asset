

import 'dart:convert';

Suppliers manufacturerFromJson(String str) => Suppliers.fromJson(json.decode(str));

class Suppliers {
  List<Data>? data;

  Suppliers({this.data});

  Suppliers.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? uuid;
  String? namaSupplier;
  String? noTelp;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.uuid,
        this.namaSupplier,
        this.noTelp,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    namaSupplier = json['nama_supplier'];
    noTelp = json['no_telp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['nama_supplier'] = namaSupplier;
    data['no_telp'] = noTelp;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}