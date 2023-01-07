import 'dart:convert';

Manufacturer manufacturerFromJson(String str) => Manufacturer.fromJson(json.decode(str));

class Manufacturer {
  List<Data>? data;

  Manufacturer({this.data});

  Manufacturer.fromJson(Map<String, dynamic> json) {
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
  String? namaManufactur;
  String? createdAt;
  String? updatedAt;

  Data({this.uuid, this.namaManufactur, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    namaManufactur = json['nama_manufactur'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['nama_manufactur'] = namaManufactur;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}