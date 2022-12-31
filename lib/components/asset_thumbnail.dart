import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';


class AssetThumbnail extends StatelessWidget {
  const AssetThumbnail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFListTile(
      titleText: 'Asset Name',
      subTitleText: 'Asset Description',
    );
  }
}
