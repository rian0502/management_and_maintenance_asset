import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import '../connection/api_dropdown.dart';
import 'package:gudang/models/models_barang.dart' as models;
import 'package:gudang/models/locations.dart' as locations;
import 'package:gudang/models/suppliers.dart' as suppliers;
class AddAssetScreen extends StatefulWidget {
  const AddAssetScreen({Key? key}) : super(key: key);

  @override
  State<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends State<AddAssetScreen> {
  late String _uuidModel;
  late String _uuidLocation;
  late String _uuidSupplier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ListView(
          children: [
            TextFormField(
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
                itemBuilder: (BuildContext context, models.Data item,
                    bool isSelected) {
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
              decoration: const InputDecoration(
                labelText: "Kode Order",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Keterangan",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("tambah asset");
              },
              child: const Text("Tambah Asset"),
            ),
          ],
        ),
      ),
    );
  }

  final AppBar _appBar = AppBar(
    title: const Text("Tambah Asset"),
  );
}
