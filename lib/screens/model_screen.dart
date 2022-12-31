import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ModelScreen extends StatelessWidget {
  const ModelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model'),
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
