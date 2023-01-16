import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../connection/api_dropdown.dart';
import 'package:go_router/go_router.dart';
import '../connection/api_service.dart';
import '../models/locations.dart' as locations;
import '../models/models_barang.dart' as models;
import '../models/suppliers.dart' as suppliers;
import '../models/assets.dart' as assets;

class EditAssetScreen extends StatefulWidget {
  final assets.Data? asset;
  const EditAssetScreen({Key? key, this.asset}) : super(key: key);

  @override
  State<EditAssetScreen> createState() => _EditAssetScreenState();
}

class _EditAssetScreenState extends State<EditAssetScreen> {
  late String _uuidModel;
  late String _uuidLocation;
  late String _uuidSupplier;
  late String _uuidAsset;
  final TextEditingController _controllerNameAset = TextEditingController();
  final TextEditingController _controllerKodeOrder = TextEditingController();
  final TextEditingController _controllerKeterangan = TextEditingController();
  final TextEditingController _controllerDatePicker = TextEditingController();

  @override
  void initState() {
    _uuidSupplier = widget.asset!.idSupplier!;
    _uuidModel = widget.asset!.idModel!;
    _uuidLocation = widget.asset!.idLocation!;
    _uuidAsset = widget.asset!.uuid!;
    _controllerDatePicker.text = widget.asset!.purchaseDate!;
    _controllerKodeOrder.text = widget.asset!.orderNumber!;
    _controllerKeterangan.text = widget.asset!.notes!;
    _controllerNameAset.text = widget.asset!.namaAsset!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Aset'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ListView(
          children: [
            TextFormField(
              controller: _controllerNameAset,
              decoration: const InputDecoration(
                labelText: "Nama Aset",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            const SizedBox(
              height: 15,
              width: 400,
              child: Text('Model'),
            ),
            DropdownSearch(
              itemAsString: (item) => item.namaModel!.toString(),
              asyncItems: (String? filter) {
                return APIDropDown.getAllModels();
              },
              onChanged: (value) {
                setState(() {
                  _uuidModel = value!.uuid!;
                });
                print(_uuidModel);
              },
              popupProps: PopupProps.dialog(
                showSearchBox: true,
                showSelectedItems: true,
                itemBuilder:
                    (BuildContext context, models.Data item, bool isSelected) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Text("${item.namaModel!} -  ${item.noModel!}"),
                  );
                },
              ),
              compareFn: (item, sItem) => item.uuid == sItem.uuid,
            ),
            const SizedBox(height: 15),
            const SizedBox(
              height: 15,
              width: 400,
              child: Text('Lokasi'),
            ),
            DropdownSearch(
              itemAsString: (item) => item.namaGedung!.toString(),
              asyncItems: (String? filter) {
                return APIDropDown.getAlLLocation();
              },
              onChanged: (value) {
                setState(() {
                  _uuidLocation = value!.uuid!;
                });
                print(_uuidLocation);
              },
              popupProps: PopupProps.dialog(
                showSearchBox: true,
                showSelectedItems: true,
                itemBuilder: (BuildContext context, locations.Data item,
                    bool isSelected) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Text("${item.namaGedung!} -  LT ${item.lantai!}"),
                  );
                },
              ),
              compareFn: (item, sItem) => item.uuid == sItem.uuid,
            ),
            const SizedBox(height: 15),
            const SizedBox(
              height: 15,
              width: 400,
              child: Text('Pemasok'),
            ),
            DropdownSearch(
              itemAsString: (item) => item.namaSupplier!.toString(),
              asyncItems: (String? filter) {
                return APIDropDown.getAllSupplier();
              },
              onChanged: (value) {
                setState(() {
                  _uuidSupplier = value!.uuid!;
                });
                print(_uuidSupplier);
              },
              popupProps: PopupProps.dialog(
                showSearchBox: true,
                showSelectedItems: true,
                itemBuilder: (BuildContext context, suppliers.Data item,
                    bool isSelected) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(item.namaSupplier!),
                  );
                },
              ),
              compareFn: (item, sItem) => item.uuid == sItem.uuid,
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _controllerDatePicker,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Tanggal Order",
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));
                _controllerDatePicker.text =
                    "${date!.year}-${date.month}-${date.day}";
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _controllerKodeOrder,
              decoration: const InputDecoration(
                labelText: "Kode Order",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: _controllerKeterangan,
              decoration: const InputDecoration(
                labelText: "Keterangan",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controllerNameAset.text.isEmpty ||
                    _controllerKodeOrder.text.isEmpty ||
                    _controllerKeterangan.text.isEmpty ||
                    _controllerDatePicker.text.isEmpty ||
                    _uuidModel.isEmpty ||
                    _uuidLocation.isEmpty ||
                    _uuidSupplier.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Data tidak boleh kosong'),
                    ),
                  );
                } else {
                  APIService.updateAsset(
                          _uuidModel,
                          _uuidSupplier,
                          _uuidLocation,
                          _controllerNameAset.text,
                          _controllerDatePicker.text,
                          _controllerKodeOrder.text,
                          _controllerKeterangan.text,
                          _uuidAsset)
                      .then((value) => {
                            if (value == 1)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Data berhasil ditambahkan'),
                                  ),
                                ),
                                context.pop(),
                              }
                            else
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Data gagal ditambahkan'),
                                  ),
                                ),
                              }
                          });
                  context.pop();
                }
              },
              child: const Text("Tambah Asset"),
            ),
          ],
        ),
      ),
    );
  }
}
