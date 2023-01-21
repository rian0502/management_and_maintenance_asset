import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/components/maintenance_list_view.dart';

import '../connection/api_service.dart';

class MaintenanceScreen extends StatefulWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);

  @override
  State<MaintenanceScreen> createState() => _MaintenanceScreenState();
}

class _MaintenanceScreenState extends State<MaintenanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: FutureBuilder(
        future: APIService.getAllMaintenance(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: MaintenanceListView(
                maintenance: snapshot.data.data!,
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
          context.push('/addMaintenance');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
