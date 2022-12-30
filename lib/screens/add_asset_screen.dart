import 'package:flutter/material.dart';


class AddAssetScreen extends StatefulWidget {
  const AddAssetScreen({Key? key}) : super(key: key);

  @override
  State<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends State<AddAssetScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('tambah assets'),
    );
  }
}
