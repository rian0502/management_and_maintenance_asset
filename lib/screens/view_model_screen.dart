import 'package:flutter/material.dart';

import '../connection/api_service.dart';

class ViewModelScreen extends StatelessWidget {
  final String? uuid;
  const ViewModelScreen({Key? key, this.uuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Model Barang'),
      ),
      body: FutureBuilder(
          future: APIService.detailModels(uuid!),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    buildUserInfoDisplay('Kode Model', snapshot.data!.noModel),
                    buildUserInfoDisplay('Nama Model', snapshot.data!.namaModel),
                    buildUserInfoDisplay('Kategori', snapshot.data!.kategori),
                    buildUserInfoDisplay('Pabrikan', snapshot.data!.manufactur),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

Widget buildUserInfoDisplay(String title, String getValue) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        Container(
            width: 350,
            height: 40,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ))),
            child: Row(children: [
              Expanded(
                  child: Text(
                    getValue,
                    style: const TextStyle(fontSize: 16, height: 1.4),
                  )),
            ]))
      ],
    ));