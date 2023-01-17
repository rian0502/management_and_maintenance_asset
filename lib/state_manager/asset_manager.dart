import 'package:flutter/material.dart';
import 'package:gudang/connection/api_service.dart';

import '../models/assets.dart';

class AssetManager extends ChangeNotifier {
  List<Data> asset = [];

  void addAsset(String idModel, String idSupplier, String idLocation,
      String namaAset, String purchaseDate, String orderNumber, String ket) {
    APIService.addAsset(idModel, idSupplier, idLocation, namaAset, purchaseDate,
            orderNumber, ket)
        .then((value) => notifyListeners());
  }

  void removeAsset(Data data) {
    asset.remove(data);
    notifyListeners();
  }
}
