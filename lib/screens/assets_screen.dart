import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/connection/api_service.dart';

import '../components/assets_list_view.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({Key? key}) : super(key: key);

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aset'),
      ),
      body: FutureBuilder(
        future: APIService.getAllAssets(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: AssetsListView(
                  assets: snapshot.data!.data!,
                ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/addAsset');
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
