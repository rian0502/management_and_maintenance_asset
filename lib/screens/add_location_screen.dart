import 'package:flutter/material.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({Key? key}) : super(key: key);

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
              decoration: const InputDecoration(
                hintText: 'Nama Lokasi',
              ),
            ),
            const SizedBox(height: 20,),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Lantai',
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, child: Text('Simpan'))
          ],
        ),
      )
    );
  }
}
