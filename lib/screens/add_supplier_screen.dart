import 'package:flutter/material.dart';


class AddSupplierScreen extends StatefulWidget {
  const AddSupplierScreen({Key? key}) : super(key: key);

  @override
  State<AddSupplierScreen> createState() => _AddSupplierScreenState();
}

class _AddSupplierScreenState extends State<AddSupplierScreen> {
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
              decoration: const InputDecoration(
                hintText: 'Nama Supplier',
              ),
            ),
            const SizedBox(height: 20,),
            const TextField(
              keyboardType: TextInputType.number,
              maxLength: 13,
              decoration: InputDecoration(
                hintText: 'No.Tlp',
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){}, child: Text('Simpan'))
          ],
        ),
      ),
    );
  }
}
