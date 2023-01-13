import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/models/manufacturer.dart';

import '../connection/api_service.dart';

class EditManufacturScreen extends StatefulWidget {
  final Data? manufactur;
  const EditManufacturScreen({Key? key, this.manufactur}) : super(key: key);

  @override
  State<EditManufacturScreen> createState() => _EditManufacturScreenState();
}

class _EditManufacturScreenState extends State<EditManufacturScreen> {
  final TextEditingController _namaManufacturerController =
  TextEditingController();
  late String _uuid;

  @override
  void initState() {
    _namaManufacturerController.text = widget.manufactur!.namaManufactur!;
    _uuid = widget.manufactur!.uuid!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data Pabrikan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _namaManufacturerController,
              decoration: const InputDecoration(
                hintText: 'Nama Pabrikan',
                labelText: 'Nama Pabrikan'
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
                      if (_namaManufacturerController.text.isNotEmpty) {
                        APIService.updateManufacturer(
                            _namaManufacturerController.text, _uuid)
                            .then((value) => {
                          if (value == 1)
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    'Berhasil mengubah Pabrikan'),
                              )),
                              context.pop(),
                            }
                          else
                            {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                Text('Gagal mengubah Pabrikan'),
                              )),
                            }
                        });
                      }
                    },
                    child: const Text('Simpan'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
