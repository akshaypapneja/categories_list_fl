import 'package:assignment_project/collections/general_utils/extension_file.dart';
import 'package:assignment_project/collections/widgets/subcategory_item_widget.dart';
import 'package:assignment_project/modules/models/categories_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CategoryItemWidget extends StatelessWidget {
  final Categories entity;
  final VoidCallback onTap;

  CategoryItemWidget({this.entity, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
      child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                height: 50.0,
                width: 50.0,
                color: HexColor.fromHex(entity.category.colorCode.toString()),
                child: CachedNetworkImage(
                  imageUrl: entity.category.imagePath,
                  placeholder: (a, b) => CupertinoActivityIndicator(),
                  errorWidget: (a, b, c) => Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            title: Text(
              entity.category.categoryName,
              style: TextStyle(
                  color:
                      HexColor.fromHex(entity.category.colorCode.toString())),
            ),
            trailing: InkWell(
              onTap: onTap,
              child: Icon(entity.category.isDropped
                  ? Icons.arrow_drop_up
                  : Icons.arrow_drop_down),
            ),
          ),
          entity.category.isDropped
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: entity.category.subcategories.length,
                  itemBuilder: (c, i) => SubCategoryItemWidget(
                      entity: entity.category.subcategories[i],
                      color: entity.category.colorCode.toString()))
              : Container()
        ],
      ),
    );
  }
}
