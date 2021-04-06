import 'package:assignment_project/collections/general_utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: getBody(),
      floatingActionButton: FloatingActionButton(
          onPressed: onButtonPressed, child: Icon(Icons.arrow_forward_ios)),
    );
  }

  Widget getBody() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Quantam Software",
            style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }

  void onButtonPressed() {
    Get.toNamed(Constants.categories);
  }
}
