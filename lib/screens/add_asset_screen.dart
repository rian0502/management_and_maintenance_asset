import 'package:flutter/material.dart';

class AddAssetScreen extends StatefulWidget {
  const AddAssetScreen({Key? key}) : super(key: key);

  @override
  State<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends State<AddAssetScreen> {
  final List<String> _categories = ['Laptop', 'Monitor', 'Printer', 'Scanner', 'UPS', 'Router', 'Switch', 'Kabel', 'Lainnya'];
  String _kategori = 'Laptop';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Nama",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Kode",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Vendor",
              ),
            ),
            SizedBox(
              width: 400,
              height: 50,
              child: DropdownButton<String>(
                  value: _kategori,
                  items: _categories.map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _kategori = value!;
                    });
                  }),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Lokasi",
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Keterangan",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print("tambah asset");
              },
              child: const Text("Tambah Asset"),
            ),
          ],
        ),
      ),
    );
  }

  final AppBar _appBar = AppBar(
    title: const Text("Tambah Asset"),
  );
}
