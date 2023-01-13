import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/categories.dart';



class CategoriesListView extends StatefulWidget {
  final List<Data>? categories;
  const CategoriesListView({Key? key, this.categories}) : super(key: key);

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.categories!.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(widget.categories![index].namaKategori!),
              trailing: PopupMenuButton(
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(value: 1,child: Text('Edit'),),
                    const PopupMenuItem(value: 2,child: Text('View'),),
                  ],
                  onSelected: (value){
                    if(value == 1){
                      context.push('/editCategories', extra: widget.categories![index]);
                    }else{
                      print(widget.categories![index].namaKategori);
                    }
                  },
                )
            )
          );
        },
    );
  }
}
