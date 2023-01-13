import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/models/suppliers.dart';

import '../connection/api_service.dart';


class EditSupplierScreen extends StatefulWidget {
  final Data? supplier;
  const EditSupplierScreen({Key? key, this.supplier}) : super(key: key);

  @override
  State<EditSupplierScreen> createState() => _EditSupplierScreenState();
}

class _EditSupplierScreenState extends State<EditSupplierScreen> {
  final TextEditingController _namaSupplier = TextEditingController();
  final TextEditingController _noTlp = TextEditingController();
  late String uuid;

  @override
  void initState() {
    uuid = widget.supplier!.uuid!;
    _namaSupplier.text = widget.supplier!.namaSupplier!;
    _noTlp.text = widget.supplier!.noTelp!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Data Pemasok'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _namaSupplier,
                decoration: const InputDecoration(
                  hintText: 'Nama Pemasok',
                  labelText: 'Nama Pemasok'
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _noTlp,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  hintText: 'No TLP',
                  labelText: 'No TLP'
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_namaSupplier.text.isEmpty ||
                            _noTlp.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Nama Lokasi dan Lantai tidak boleh kosong'),
                            ),
                          );
                        } else {
                          //update location
                          APIService.updateSuppliers(uuid, _namaSupplier.text, _noTlp.text)
                              .then((value) => {
                            if (value == 1)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Berhasil mengubah Pemasok'),
                                  ),
                                ),
                                context.pop(),
                              }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Gagal mengubah Pemasok'),
                                ),
                              ),
                            }
                          });
                        }
                      },
                      child: const Text('Simpan'))
                ],
              )
            ],
          ),
        ));
  }
}
