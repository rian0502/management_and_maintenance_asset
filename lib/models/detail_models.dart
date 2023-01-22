
import 'dart:convert';

DetailModels detailModelsFromJson(String str) => DetailModels.fromJson(json.decode(str));

class DetailModels {
  String? uuid;
  String? namaModel;
  String? noModel;
  String? kategori;
  String? manufactur;

  DetailModels(
      {this.uuid,
        this.namaModel,
        this.noModel,
        this.kategori,
        this.manufactur});

  DetailModels.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    namaModel = json['nama_model'];
    noModel = json['no_model'];
    kategori = json['kategori'];
    manufactur = json['manufactur'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['nama_model'] = namaModel;
    data['no_model'] = noModel;
    data['kategori'] = kategori;
    data['manufactur'] = manufactur;
    return data;
  }
}