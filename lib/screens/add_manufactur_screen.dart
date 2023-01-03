import 'package:flutter/material.dart';

class AddManufactureScreen extends StatefulWidget {
  const AddManufactureScreen({Key? key}) : super(key: key);

  @override
  State<AddManufactureScreen> createState() => _AddManufactureScreenState();
}

class _AddManufactureScreenState extends State<AddManufactureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Manufacture'),
      ),
      body: const Center(
        child: Text('Add Manufacture'),
      ),
    );
  }
}
