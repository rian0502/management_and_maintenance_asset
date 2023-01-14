import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/components/models_list_view.dart';
import 'package:gudang/connection/api_service.dart';


class ModelScreen extends StatelessWidget {
  const ModelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model'),
      ),
      body: FutureBuilder(
        future: APIService.getAllModels(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: ModelsListView(models: snapshot.data!.data!),
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
          context.push('/addModel');
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
