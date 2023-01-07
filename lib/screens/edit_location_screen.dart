import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/connection/api_service.dart';

import '../models/locations.dart';


class EditLocationScreen extends StatefulWidget {
  final Data? location;
  const EditLocationScreen({Key? key, this.location}) : super(key: key);

  @override
  State<EditLocationScreen> createState() => _EditLocationScreenState();
}

class _EditLocationScreenState extends State<EditLocationScreen> {
  final TextEditingController _namaLokasiController = TextEditingController();
  final TextEditingController _lantaiController = TextEditingController();
  late final String uuid;


  @override
  void initState() {
    _namaLokasiController.text = widget.location!.namaGedung! ;
    _lantaiController.text = widget.location!.lantai!;
    uuid = widget.location!.uuid!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Kategori'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _namaLokasiController,
                decoration: const InputDecoration(
                  hintText: 'Nama Lokasi',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _lantaiController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: const InputDecoration(
                  hintText: 'Lantai',
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
                        if (_namaLokasiController.text.isEmpty ||
                            _lantaiController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Nama Lokasi dan Lantai tidak boleh kosong'),
                            ),
                          );
                        } else {
                          //update location
                          APIService.updateLocation(uuid, _namaLokasiController.text, _lantaiController.text)
                              .then((value) => {
                            if (value == 1)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Berhasil mengubah lokasi'),
                                  ),
                                ),
                                context.pop(),
                              }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Gagal mengubah lokasi'),
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


