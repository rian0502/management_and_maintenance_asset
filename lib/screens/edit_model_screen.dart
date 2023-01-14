import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../connection/api_dropdown.dart';
import '../connection/api_service.dart';
import '../models/models_barang.dart' as models;
import '../models/manufacturer.dart' as manufacture;
import '../models/categories.dart' as categories;

class EditModelScreen extends StatefulWidget {
  final models.Data? model;
  const EditModelScreen({Key? key, this.model}) : super(key: key);

  @override
  State<EditModelScreen> createState() => _EditModelScreenState();
}

class _EditModelScreenState extends State<EditModelScreen> {
  final TextEditingController _namaModel = TextEditingController();
  final TextEditingController _kodeModel = TextEditingController();
  late String _uuidManufacturer;
  late String _uuidCategory;
  late String _uuidModel;
  @override
  void initState() {
    _namaModel.text = widget.model!.namaModel!;
    _kodeModel.text = widget.model!.noModel!;
    _uuidManufacturer = widget.model!.idManufacturer!;
    _uuidCategory = widget.model!.idKategori!;
    _uuidModel = widget.model!.uuid!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Model'),
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
                  return APIDropDown.getAllManufacturer(filter ?? '');
                },
                onChanged: (value) {
                  setState(() {
                    _uuidManufacturer = value!.uuid!;
                  });
                  print(_uuidManufacturer);
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
                    _uuidCategory = value!.uuid!;
                  });
                  print(_uuidCategory);
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
                            _uuidManufacturer.isEmpty ||
                            _uuidCategory.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data harus di isi'),
                            ),
                          );
                        } else {
                          APIService.updateModels(
                                  _namaModel.text,
                                  _uuidManufacturer,
                                  _uuidCategory,
                                  _kodeModel.text,
                                  _uuidModel)
                              .then((value) {
                                setState(() {

                                });
                            if (value == 1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Berhasil merubah data'),
                                ),
                              );
                              context.pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Gagal merubah data'),
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
