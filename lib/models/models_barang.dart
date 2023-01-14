import 'dart:convert';

Models modelsFromJson(String str) => Models.fromJson(json.decode(str));

class Models {
  List<Data>? data;

  Models({this.data});

  Models.fromJson(Map<String, dynamic> json) {
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
  String? namaModel;
  String? idManufacturer;
  String? idKategori;
  String? noModel;
  Null? foto;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.uuid,
        this.namaModel,
        this.idManufacturer,
        this.idKategori,
        this.noModel,
        this.foto,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    namaModel = json['nama_model'];
    idManufacturer = json['id_manufacturer'];
    idKategori = json['id_kategori'];
    noModel = json['no_model'];
    foto = json['foto'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['nama_model'] = namaModel;
    data['id_manufacturer'] = idManufacturer;
    data['id_kategori'] = idKategori;
    data['no_model'] = noModel;
    data['foto'] = foto;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}