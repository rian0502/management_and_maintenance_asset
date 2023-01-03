import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


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
      body: const Center(
        child: Text('Maintenance'),
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
