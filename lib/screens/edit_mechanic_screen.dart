import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../connection/api_service.dart';
import '../models/mechanic.dart';


class EditMechanicScreen extends StatefulWidget {
  final Data? mechanic;
  const EditMechanicScreen({Key? key, this.mechanic}) : super(key: key);

  @override
  State<EditMechanicScreen> createState() => _EditMechanicScreenState();
}

class _EditMechanicScreenState extends State<EditMechanicScreen> {
  final TextEditingController _nik = TextEditingController();
  final TextEditingController _namaTeknisi = TextEditingController();
  late String uuid;

  @override
  void initState() {
    uuid = widget.mechanic!.uuid!;
    _nik.text = widget.mechanic!.nik!;
    _namaTeknisi.text = widget.mechanic!.namaTeknisi!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Teknisi'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child:  Column(
          children: [
            TextField(
              controller: _nik,
              keyboardType: TextInputType.number,
              maxLength: 16,
              decoration: const InputDecoration(
                hintText: 'NIK',
                labelText: 'NIK'
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
                labelText: 'Nama'
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
                    APIService.updateMehcanic(uuid, _namaTeknisi.text, _nik.text).then((value) => {
                      if (value == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data berhasil diubah'),
                          ),
                        ),
                        context.pop(),
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data gagal diubah'),
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
