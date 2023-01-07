import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../connection/api_service.dart';

class AddMechanicScreen extends StatefulWidget {
  const AddMechanicScreen({Key? key}) : super(key: key);

  @override
  State<AddMechanicScreen> createState() => _AddMechanicScreenState();
}

class _AddMechanicScreenState extends State<AddMechanicScreen> {
  final TextEditingController _nik = TextEditingController();
  final TextEditingController _namaTeknisi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Teknisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nik,
              keyboardType: TextInputType.number,
              maxLength: 16,
              decoration: const InputDecoration(
                hintText: 'NIK',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _namaTeknisi,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Nama',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: () {
                  if (_nik.text.isEmpty || _namaTeknisi.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data tidak boleh kosong'),
                      ),
                    );
                  } else {
                    APIService.addMechanic(_nik.text, _namaTeknisi.text).then((value) => {
                      if (value == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data berhasil ditambahkan'),
                          ),
                        ),
                        context.pop(),
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data gagal ditambahkan'),
                          ),
                        ),
                      }
                    });
                  }
                }, child: Text('Simpan'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
