import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/components/mehanics_list_view.dart';
import '../connection/api_service.dart';

class MechanicScreen extends StatelessWidget {
  const MechanicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Teknisi'),
      ),
      body: FutureBuilder(
        future: APIService.getAllMechanic(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: MechanicsListView(
                mechanic: snapshot.data.data!,
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
          context.push('/addMechanic');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
