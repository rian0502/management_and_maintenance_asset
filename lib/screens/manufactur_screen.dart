import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ManufacturerScreen extends StatelessWidget {
  const ManufacturerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manufacture'),
      ),
      body: const Center(
        child: Text('Manufacture'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/addManufacture');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
