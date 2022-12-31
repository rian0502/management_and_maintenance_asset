import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi'),
      ),
      body: const Center(
        child: Text('Lokasi'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/addLocation');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
