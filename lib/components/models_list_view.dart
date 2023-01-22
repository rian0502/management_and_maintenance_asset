import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/models_barang.dart';


class ModelsListView extends StatefulWidget {
  final List<Data>? models;
  const ModelsListView({Key? key, this.models}) : super(key: key);

  @override
  State<ModelsListView> createState() => _ModelsListViewState();
}

class _ModelsListViewState extends State<ModelsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.models!.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
                title: Text(widget.models![index].namaModel!),
                subtitle: Text("Kode : ${widget.models![index].noModel}"),
                trailing: PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(value: 1,child: Text('Edit'),),
                    const PopupMenuItem(value: 2,child: Text('View'),),
                  ],
                  onSelected: (value){
                    if(value == 1){
                      context.push('/editModel', extra: widget.models![index]);
                    }else{
                      context.push('/viewModel', extra: widget.models![index].uuid);
                    }
                  },
                )
            )
        );
      },
    );
  }
}
