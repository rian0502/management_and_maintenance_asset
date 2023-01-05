import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/connection/api_service.dart';

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
                ElevatedButton(onPressed: () {
                  if(_namaLokasiController.text.isEmpty || _lantaiController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Nama Lokasi dan Lantai tidak boleh kosong'),
                      ),
                    );
                  } else {
                    //add location
                    APIService.addLocation(_namaLokasiController.text, _lantaiController.text).then((value) => {
                      context.pop()
                    });
                  }
                }, child: Text('Simpan'))
              ],
            )
          ],
        ),
      )
    );
  }
}
