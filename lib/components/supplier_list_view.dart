import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/suppliers.dart';


class SupplierListView extends StatefulWidget{
  final List<Data>? supplier;
  const SupplierListView({Key? key, this.supplier}) : super(key: key);

  @override
  State<SupplierListView> createState() => _SupplierListViewState();
}

class _SupplierListViewState extends State<SupplierListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.supplier!.length,
      itemBuilder: (context, index) {
        return Card(
            child: ListTile(
                title: Text(widget.supplier![index].namaSupplier!),
                subtitle: Text("Telp : ${widget.supplier![index].noTelp}"),
                trailing: PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(value: 1,child: Text('Edit'),),
                    const PopupMenuItem(value: 2,child: Text('View'),),
                  ],
                  onSelected: (value){
                    if(value == 1){
                      context.push('/editSupplier', extra: widget.supplier![index]);
                    }else{
                      print(widget.supplier![index].namaSupplier);
                    }
                  },
                )
            )
        );
      },
    );
  }
}
