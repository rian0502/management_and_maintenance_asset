import 'package:flutter/material.dart';
import 'package:gudang/connection/api_service.dart';

class ViewAssetScreen extends StatelessWidget {
  final String? uuid;
  const ViewAssetScreen({Key? key, this.uuid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Asset'),
      ),
      body: FutureBuilder(
          future: APIService.detailAsset(uuid!),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    buildUserInfoDisplay(
                        'Nama Asset', snapshot.data!.namaAsset),
                    buildUserInfoDisplay('Kode Asset', snapshot.data!.serial),
                    buildUserInfoDisplay(
                        'Model',
                        snapshot.data!.namaModel +
                            ' - ' +
                            snapshot.data!.noModel),
                    buildUserInfoDisplay('Lokasi', snapshot.data!.location),
                    buildUserInfoDisplay('Pemasok', snapshot.data!.supplier),
                    buildUserInfoDisplay(
                        'Kode Order', snapshot.data!.orderNumber),
                    buildUserInfoDisplay(
                        'Tanggal Pembelian', snapshot.data!.purchaseDate),
                    buildUserInfoDisplay('Catatan', snapshot.data!.notes),
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
