import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/components/locations_list_view.dart';
import '../connection/api_service.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi'),
      ),
      body: FutureBuilder(
        future: APIService.getAllLocation(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: LocationListView(
                locations: snapshot.data.data!,
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
          context.push('/addLocation');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
