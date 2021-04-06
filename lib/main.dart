import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'collections/general_utils/constants.dart';
import 'collections/routers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: Routers.routes,
      initialRoute: Constants.homePage,
    );
  }
}
