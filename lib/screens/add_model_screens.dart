import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/connection/api_service.dart';
import 'package:gudang/models/manufacturer.dart' as manufacture;
import 'package:gudang/models/categories.dart' as categories;
import '../connection/api_dropdown.dart';

class AddModelScreens extends StatefulWidget {
  const AddModelScreens({Key? key}) : super(key: key);

  @override
  State<AddModelScreens> createState() => _AddModelScreensState();
}

class _AddModelScreensState extends State<AddModelScreens> {
  String _uuidManufactur = '';
  String _uuidCategori = '';
  final TextEditingController _namaModel = TextEditingController();
  final TextEditingController _kodeModel = TextEditingController();
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
              const SizedBox(height: 15),
              TextField(
                controller: _namaModel,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama Model',
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _kodeModel,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kode Model',
                ),
              ),
              const SizedBox(height: 15),
              const SizedBox(
                height: 15,
                width: 400,
                child: Text('Pabrikan'),
              ),
              DropdownSearch(
                itemAsString: (item) => item.namaManufactur!.toString(),
                asyncItems: (String? filter) {
                  return APIDropDown.getAllManufacturer();
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
                  itemBuilder: (BuildContext context, manufacture.Data item,
                      bool isSelected) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(item.namaManufactur!),
                    );
                  },
                ),
                compareFn: (item, sItem) => item.uuid == sItem.uuid,
              ),
              const SizedBox(height: 15),
              const SizedBox(
                height: 15,
                width: 400,
                child: Text('Kategori'),
              ),
              DropdownSearch(
                itemAsString: (item) => item.namaKategori!.toString(),
                asyncItems: (String? filter) {
                  return APIDropDown.getAllCategories();
                },
                onChanged: (value) {
                  setState(() {
                    _uuidCategori = value!.uuid!;
                  });
                  print(_uuidCategori);
                },
                popupProps: PopupProps.dialog(
                  showSearchBox: true,
                  showSelectedItems: true,
                  itemBuilder: (BuildContext context, categories.Data item,
                      bool isSelected) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(item.namaKategori!),
                    );
                  },
                ),
                compareFn: (item, sItem) => item.uuid == sItem.uuid,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_namaModel.text.isEmpty ||
                            _kodeModel.text.isEmpty ||
                            _uuidManufactur.isEmpty ||
                            _uuidCategori.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data harus di isi'),
                            ),
                          );
                        } else {
                          APIService.addModels(_namaModel.text, _uuidManufactur,
                              _uuidCategori, _kodeModel.text)
                              .then((value) {
                            if (value == 1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Berhasil menambahkan data'),
                                ),
                              );
                              context.pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Gagal menambahkan data'),
                                ),
                              );
                            }
                          });
                        }
                      },
                      child: const Text('Simpan'))
                ],
              )
            ],
          )),
    );
  }
}
