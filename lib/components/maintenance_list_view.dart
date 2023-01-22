import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/maintenance.dart';

class MaintenanceListView extends StatefulWidget {
  final List<Data>? maintenance;
  const MaintenanceListView({Key? key, this.maintenance}) : super(key: key);

  @override
  State<MaintenanceListView> createState() => _MaintenanceListViewState();
}

class _MaintenanceListViewState extends State<MaintenanceListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.maintenance!.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
                title: Text(widget.maintenance![index].note!),
                trailing: PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text('View'),
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 1) {
                      context.push('/editMaintenance',
                          extra: widget.maintenance![index]);
                    } else {
                      context.push('/viewMaintenance',
                          extra: widget.maintenance![index].uuid);
                    }
                  },
                )));
      },
    );
  }
}
