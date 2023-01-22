import 'dart:convert';

MaintenanceDetail maintenanceDetailFromJson(String str) =>
    MaintenanceDetail.fromJson(json.decode(str));

class MaintenanceDetail {
  String? uuid;
  String? namaAsset;
  String? serial;
  String? model;
  String? namaTeknisi;
  String? note;

  MaintenanceDetail(
      {this.uuid,
        this.namaAsset,
        this.serial,
        this.model,
        this.namaTeknisi,
        this.note});

  MaintenanceDetail.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    namaAsset = json['nama_asset'];
    serial = json['serial'];
    model = json['model'];
    namaTeknisi = json['nama_teknisi'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['nama_asset'] = this.namaAsset;
    data['serial'] = this.serial;
    data['model'] = this.model;
    data['nama_teknisi'] = this.namaTeknisi;
    data['note'] = this.note;
    return data;
  }
}
