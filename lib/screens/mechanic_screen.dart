import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

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
            return ListView.builder(
              itemCount: snapshot.data.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Card(
                      child: Slidable(
                        key: Key(snapshot.data.data![index].nik),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          dismissible: DismissiblePane(onDismissed: () {}),
                          children: [
                            SlidableAction(
                              onPressed: (value) {
                                context.push('/editMechanic', extra: snapshot.data.data![index]);
                              },
                              backgroundColor: const Color(0xFF21B7CA),
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                            ),
                          ],
                        ),
                        child:  ListTile(
                          title: Text(snapshot.data.data![index].namaTeknisi),
                          subtitle: Text(snapshot.data.data![index].nik),
                        ),
                      )),
                );
              },
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
