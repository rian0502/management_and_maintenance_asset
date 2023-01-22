import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gudang/models/assets.dart';

class AssetsListView extends StatefulWidget {
  final List<Data>? assets;
  const AssetsListView({Key? key, this.assets}) : super(key: key);

  @override
  State<AssetsListView> createState() => _AssetsListViewState();
}

class _AssetsListViewState extends State<AssetsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.assets!.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
                title: Text(widget.assets![index].namaAsset!),
                subtitle: Text(widget.assets![index].serial!),
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
                      context.push('/editAsset', extra: widget.assets![index]);
                    } else {
                      context.push('/viewAsset', extra: widget.assets![index].uuid);
                    }
                  },
                )));
      },
    );
  }
}
