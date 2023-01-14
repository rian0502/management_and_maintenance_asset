import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        title: const Text('Aset'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/addAsset');
        },
        child: const Icon(Icons.add,),
      ),
    );
  }
}
