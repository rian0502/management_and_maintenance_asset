import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kategori'),
      ),
      body: const Center(
        child: Text('Kategori'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/addCategory');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
