import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components/supplier_list_view.dart';
import '../connection/api_service.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supplier'),
      ),
      body: FutureBuilder(
        future: APIService.getAllSuppliers(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: SupplierListView(
                supplier: snapshot.data.data!,
              ),
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
          context.push('/addSupplier');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
