import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/mechanic.dart';

class MechanicsListView extends StatefulWidget {
  final List<Data>? mechanic;
  const MechanicsListView({Key? key, this.mechanic}) : super(key: key);

  @override
  State<MechanicsListView> createState() => _MechanicsListViewState();
}

class _MechanicsListViewState extends State<MechanicsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.mechanic!.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
                title: Text(widget.mechanic![index].namaTeknisi!),
                subtitle: Text("NIK : ${widget.mechanic![index].nik}"),
                trailing: PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Edit'),
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 1) {
                      context.push('/editMechanic',
                          extra: widget.mechanic![index]);
                    }
                  },
                )));
      },
    );
  }
}
