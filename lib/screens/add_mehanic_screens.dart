import 'package:flutter/material.dart';

class AddMechanicScreen extends StatefulWidget {
  const AddMechanicScreen({Key? key}) : super(key: key);

  @override
  State<AddMechanicScreen> createState() => _AddMechanicScreenState();
}

class _AddMechanicScreenState extends State<AddMechanicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Mechanic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 16,
              decoration: const InputDecoration(
                hintText: 'NIK',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: 'Nama',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: Text('Simpan'))
          ],
        ),
      ),
    );
  }
}
