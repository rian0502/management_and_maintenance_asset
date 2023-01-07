import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gudang/connection/api_service.dart';
import 'package:go_router/go_router.dart';

class AddSupplierScreen extends StatefulWidget {
  const AddSupplierScreen({Key? key}) : super(key: key);

  @override
  State<AddSupplierScreen> createState() => _AddSupplierScreenState();
}

class _AddSupplierScreenState extends State<AddSupplierScreen> {
  final TextEditingController _namaSupplierController = TextEditingController();
  final TextEditingController _noTelpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Supplier'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _namaSupplierController,
              decoration: const InputDecoration(
                hintText: 'Nama Supplier',
              ),
            ),
            const SizedBox(height: 20,),
             TextField(
              controller: _noTelpController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,

              ],
              maxLength: 13,
              decoration: const InputDecoration(
                hintText: 'No.Tlp',
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: (){
                  if(_namaSupplierController.text.isEmpty || _noTelpController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data tidak boleh kosong'),
                      ),
                    );
                  }else{
                    APIService.addSuppliers(_namaSupplierController.text, _noTelpController.text)
                        .then((value) => {
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
