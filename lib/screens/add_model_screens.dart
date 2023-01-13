import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gudang/models/manufacturer.dart';

import '../connection/api_dropdown.dart';

class AddModelScreens extends StatefulWidget {
  const AddModelScreens({Key? key}) : super(key: key);

  @override
  State<AddModelScreens> createState() => _AddModelScreensState();
}

class _AddModelScreensState extends State<AddModelScreens> {
  late String _uuidManufactur;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Model'),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama Model',
                ),
              ),
              const SizedBox(height: 10),
              DropdownSearch(
                itemAsString: (item) => item.namaManufactur!.toString(),
                asyncItems: (String? filter) {
                  return APIDropDown.getAllManufacturer(filter ?? '');
                },
                onChanged: (value) {
                  setState(() {
                    _uuidManufactur = value!.uuid!;
                  });
                  print(_uuidManufactur);
                },
                popupProps: PopupProps.dialog(
                  showSearchBox: true,
                  showSelectedItems: true,
                  itemBuilder:
                      (BuildContext context, Data item, bool isSelected) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(item.namaManufactur!),
                    );
                  },
                ),
                compareFn: (item, sItem) => item.uuid == sItem.uuid,
              )
            ],
          )),
    );
  }
}
