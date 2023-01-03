import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddLocationScreen extends StatelessWidget {
   AddLocationScreen({Key? key}) : super(key: key);
   final TextEditingController _namaLokasiController = TextEditingController();
   final TextEditingController _lantaiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Lokasi'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _namaLokasiController,
              decoration: const InputDecoration(
                hintText: 'Nama Lokasi',
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: _lantaiController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(
                hintText: 'Lantai',
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Simpan'))
              ],
            )
          ],
        ),
      )
    );
  }
}
