import 'package:assignment_project/modules/views/category_page.dart';
import 'package:assignment_project/modules/views/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'general_utils/constants.dart';

class Routers {
  static final routes = [
    GetPage(name: Constants.homePage, page: () => HomePage()),
    GetPage(name: Constants.categories, page: () => CategoryPage()),
  ];
}
