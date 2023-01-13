import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/connection/api_service.dart';
import '../models/categories.dart';


class EditCategoriesScreen extends StatefulWidget {
  final Data? category;
  const EditCategoriesScreen({Key? key, this.category}) : super(key: key);

  @override
  State<EditCategoriesScreen> createState() => _EditCategoriesScreenState();
}

class _EditCategoriesScreenState extends State<EditCategoriesScreen> {

  final TextEditingController _namaKategoriController = TextEditingController();
  late String uuid;
  @override
  void initState() {
    // TODO: implement initState
    uuid = widget.category!.uuid!;
    _namaKategoriController.text = widget.category!.namaKategori!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Kategori'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _namaKategoriController,
                decoration: const InputDecoration(
                  hintText: 'Nama Kategori',
                  labelText: 'Nama Kategori',
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
                        if (_namaKategoriController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Kategori tidak boleh kosong'),
                            ),
                          );
                        } else {
                          //update kategori
                          APIService.updateCategories(_namaKategoriController.text, uuid)
                              .then((value) => {
                            if (value == 1)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Berhasil mengubah Kategori'),
                                  ),
                                ),
                                context.pop(),
                              }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Gagal mengubah Kategori'),
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
