import 'dart:convert';

Mechanic mechanicFromJson(String str) => Mechanic.fromJson(json.decode(str));

class Mechanic {
  List<Data>? data;

  Mechanic({this.data});

  Mechanic.fromJson(Map<String, dynamic> json) {
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
  String? nik;
  String? namaTeknisi;
  String? createdAt;
  String? updatedAt;

  Data({this.uuid, this.nik, this.namaTeknisi, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    nik = json['nik'];
    namaTeknisi = json['nama_teknisi'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['nik'] = nik;
    data['nama_teknisi'] = namaTeknisi;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
  static List<Data> fromJsonList(List list) {
    if (list.isNotEmpty) {
      return list.map((item) => Data.fromJson(item)).toList();
    } else {
      return [];
    }
  }
}