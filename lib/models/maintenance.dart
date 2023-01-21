class Maintenance {
  List<Data>? data;

  Maintenance({this.data});

  Maintenance.fromJson(Map<String, dynamic> json) {
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
  int? uuid;
  String? idAsset;
  String? idTeknisi;
  String? note;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.uuid,
        this.idAsset,
        this.idTeknisi,
        this.note,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    idAsset = json['id_asset'];
    idTeknisi = json['id_teknisi'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['id_asset'] = idAsset;
    data['id_teknisi'] = idTeknisi;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}