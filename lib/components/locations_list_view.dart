import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/locations.dart';

class LocationListView extends StatefulWidget {
  final List<Data>? locations;
  const LocationListView({Key? key, this.locations}) : super(key: key);

  @override
  State<LocationListView> createState() => _LocationListViewState();
}

class _LocationListViewState extends State<LocationListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.locations!.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
                title: Text(widget.locations![index].namaGedung!),
                subtitle: Text("Lantai : ${widget.locations![index].lantai}"),
                trailing: PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Edit'),
                    ),
                  ],
                  onSelected: (value) {
                    if (value == 1) {
                      context.push('/editLocation',
                          extra: widget.locations![index]);
                    }
                  },
                )));
      },
    );
  }
}
