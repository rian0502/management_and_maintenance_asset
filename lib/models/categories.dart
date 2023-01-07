import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

class Categories {
  List<Data>? data;

  Categories({this.data});

  Categories.fromJson(Map<String, dynamic> json) {
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
  String? namaKategori;
  String? createdAt;
  String? updatedAt;

  Data({this.uuid, this.namaKategori, this.createdAt, this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    namaKategori = json['nama_kategori'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['nama_kategori'] = namaKategori;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}