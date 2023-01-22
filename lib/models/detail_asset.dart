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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['nama_model'] = namaModel;
    data['no_model'] = noModel;
    data['serial'] = serial;
    data['location'] = location;
    data['supplier'] = supplier;
    data['nama_asset'] = namaAsset;
    data['purchase_date'] = purchaseDate;
    data['order_number'] = orderNumber;
    data['notes'] = notes;
    return data;
  }
}