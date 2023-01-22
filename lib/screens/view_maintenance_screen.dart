import 'package:flutter/material.dart';

import '../connection/api_service.dart';


class ViewMaintenanceScreen extends StatelessWidget {
  final String? uuid;
  const ViewMaintenanceScreen({Key? key, this.uuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Perbaikan'),
      ),
      body: FutureBuilder(
          future: APIService.detailMaintenance(uuid!),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    buildUserInfoDisplay("Nama Aset", snapshot.data!.namaAsset),
                    buildUserInfoDisplay("Serial", snapshot.data!.serial),
                    buildUserInfoDisplay("Model", snapshot.data!.model),
                    buildUserInfoDisplay("Teknisi", snapshot.data!.namaTeknisi),
                    buildUserInfoDisplay("Keterangan", snapshot.data!.note),
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