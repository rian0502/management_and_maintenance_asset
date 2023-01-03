import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supplier'),
      ),
      body: const Center(
        child: Text('Supplier Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/addSupplier');
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
