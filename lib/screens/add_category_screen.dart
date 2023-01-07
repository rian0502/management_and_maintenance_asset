import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/connection/api_service.dart';

class AddCategoryScreen extends StatelessWidget {
  AddCategoryScreen({Key? key}) : super(key: key);
  final TextEditingController _categoryNameController = TextEditingController();
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
                controller: _categoryNameController,
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
                        if (_categoryNameController.text.isNotEmpty) {
                          APIService.addCategories(_categoryNameController.text)
                              .then((value) => {
                                    if (value == 1)
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                              content: Text(
                                              'Berhasil menambahkan kategori'),
                                        )),
                                        context.pop(),
                                      }
                                    else
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                              content: Text(
                                              'Gagal menambahkan kategori'),
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
        ));
  }
}
