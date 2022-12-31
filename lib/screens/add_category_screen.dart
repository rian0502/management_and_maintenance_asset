import 'package:flutter/material.dart';

class AddCategoryScreen extends StatelessWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

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
                decoration: const InputDecoration(
                  hintText: 'Nama Kategori',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Simpan'),
              ),
            ],
          ),
        ));
  }
}
