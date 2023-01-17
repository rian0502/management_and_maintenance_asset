import 'dart:convert';

Assets assetsFromJson(String str) => Assets.fromJson(json.decode(str));

class Assets {
  List<Data>? data;

  Assets({this.data});

  Assets.fromJson(Map<String, dynamic> json) {
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
  String? serial;
  String? idModel;
  String? idLocation;
  String? idSupplier;
  String? namaAsset;
  String? purchaseDate;
  String? orderNumber;
  String? notes;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.uuid,
      this.serial,
      this.idModel,
      this.idLocation,
      this.idSupplier,
      this.namaAsset,
      this.purchaseDate,
      this.orderNumber,
      this.notes,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    serial = json['serial'];
    idModel = json['id_model'];
    idLocation = json['id_location'];
    idSupplier = json['id_supplier'];
    namaAsset = json['nama_asset'];
    purchaseDate = json['purchase_date'];
    orderNumber = json['order_number'];
    notes = json['notes'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  static List<Data> fromJsonList(List list) {
    if (list.isNotEmpty) {
      return list.map((item) => Data.fromJson(item)).toList();
    } else {
      return <Data>[];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['serial'] = serial;
    data['id_model'] = idModel;
    data['id_location'] = idLocation;
    data['id_supplier'] = idSupplier;
    data['nama_asset'] = namaAsset;
    data['purchase_date'] = purchaseDate;
    data['order_number'] = orderNumber;
    data['notes'] = notes;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
