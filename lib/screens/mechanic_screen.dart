import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class MechanicScreen extends StatelessWidget {
  const MechanicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanic'),
      ),
      body: Center(
        child: Text('Mechanic Screen'),
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
