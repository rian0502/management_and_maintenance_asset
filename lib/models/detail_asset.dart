import 'dart:convert';

DetailAsset detailAssetFromJson(String str) => DetailAsset.fromJson(json.decode(str));

class DetailAsset {
  String? uuid;
  String? namaModel;
  String? noModel;
  String? serial;
  String? location;
  String? supplier;
  String? namaAsset;
  String? purchaseDate;
  String? orderNumber;
  String? notes;

  DetailAsset(
      {this.uuid,
        this.namaModel,
        this.noModel,
        this.serial,
        this.location,
        this.supplier,
        this.namaAsset,
        this.purchaseDate,
        this.orderNumber,
        this.notes});

  DetailAsset.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    namaModel = json['nama_model'];
    noModel = json['no_model'];
    serial = json['serial'];
    location = json['location'];
    supplier = json['supplier'];
    namaAsset = json['nama_asset'];
    purchaseDate = json['purchase_date'];
    orderNumber = json['order_number'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['nama_model'] = this.namaModel;
    data['no_model'] = this.noModel;
    data['serial'] = this.serial;
    data['location'] = this.location;
    data['supplier'] = this.supplier;
    data['nama_asset'] = this.namaAsset;
    data['purchase_date'] = this.purchaseDate;
    data['order_number'] = this.orderNumber;
    data['notes'] = this.notes;
    return data;
  }
}