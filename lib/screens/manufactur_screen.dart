import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/components/manufacturer_list_view.dart';
import '../connection/api_service.dart';

class ManufacturerScreen extends StatelessWidget {
  const ManufacturerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pabrikan'),
      ),
      body: FutureBuilder(
        future: APIService.getAllManufacturer(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: ManufacturerListViewScreen(
                manufacture: snapshot.data.data!,
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
          context.push('/addManufacture');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
