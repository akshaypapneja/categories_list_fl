
import 'package:assignment_project/collections/general_utils/form_utils.dart';
import 'package:assignment_project/collections/widgets/category_item_widget.dart';
import 'package:assignment_project/collections/widgets/loader_widget.dart';
import 'package:assignment_project/modules/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final _controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: Obx(() => _controller.isLoading ? LoaderWidget() : getBody()),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextFormField(
              controller: _controller.searchController,
              decoration: FormUtils.searchDecoration,
              onChanged: (value) {
                searchQuery(value);
              },
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _controller.entity.value.categories.length,
              itemBuilder: (c, i) =>
                  CategoryItemWidget(
                    entity: _controller.entity.value.categories[i],
                    onTap: () {
                      {
                        _controller
                            .entity.value.categories[i].category.isDropped =
                        !_controller
                            .entity.value.categories[i].category.isDropped;
                        setState(() {});
                      }
                    },
                  )),
        ],
      ),
    );
  }

  getAppBar() {
    return AppBar(
      elevation: 0.0,
      leading: InkWell(
        onTap: () => Get.back(),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.blueAccent,
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }

  void searchQuery(String value) {
    if (_controller.entity.value.categories.any((element) =>
    element.category.categoryName.toUpperCase() == value.toUpperCase()) ||
        _controller.entity.value.categories.any((element) =>
            element.category.subcategories.any((element) =>
                element.items.contains(value))))
      print("hello");

  }
}
