import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/categories_list_view.dart';
import '../connection/api_service.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kategori'),
      ),
      body: FutureBuilder(
        future: APIService.getAllCategories(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: CategoriesListView(categories: snapshot.data.data!),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
