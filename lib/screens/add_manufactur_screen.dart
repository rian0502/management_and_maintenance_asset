import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../connection/api_service.dart';

class AddManufactureScreen extends StatefulWidget {
  const AddManufactureScreen({Key? key}) : super(key: key);

  @override
  State<AddManufactureScreen> createState() => _AddManufactureScreenState();
}

class _AddManufactureScreenState extends State<AddManufactureScreen> {
  final TextEditingController _namaManufacturerController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Manufacture'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _namaManufacturerController,
              decoration: const InputDecoration(
                hintText: 'Nama Kategori',
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
                        APIService.addManufacturer(
                                _namaManufacturerController.text)
                            .then((value) => {
                                  if (value == 1)
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                          content: Text(
                                            'Berhasil menambahkan Pabrikan'),
                                      )),
                                      context.pop(),
                                    }
                                  else
                                    {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content:
                                            Text('Gagal menambahkan Pabrikan'),
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
