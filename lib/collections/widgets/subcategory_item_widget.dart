import 'package:assignment_project/collections/general_utils/helpers.dart';
import 'package:assignment_project/modules/models/categories_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubCategoryItemWidget extends StatelessWidget {
  final Subcategories entity;
  final String color;

  SubCategoryItemWidget({this.entity, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Helper.commonText(
              title: entity.subCategoryname.toUpperCase(),
              color: color,
              size: 18.0),
          // Text(entity.subCategoryname.toUpperCase(),
          //     style: TextStyle(color: HexColor.fromHex(color), fontSize: 18.0)),
          SizedBox(
            height: 10.0,
          ),
          ListView.separated(
            separatorBuilder: (c, i) => Divider(),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (c, i) => getItems(entity.items[i]),
            itemCount: entity.items.length,
          ),
        ],
      ),
    );
  }

  getItems(String item) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Helper.commonText(title: item, size: 16.0)]);
  }
}
