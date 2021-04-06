import 'package:assignment_project/modules/models/categories_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CategoryServices {
  CategoryServices._internal();

  Dio dio = Dio();
  static final CategoryServices _service = CategoryServices._internal();

  static global() => _service;

  Future<CategoriesEntity> fetchCategories() async {
    try {
      var response =
          await dio.get('https://api.jsonbin.io/b/5fce7e1e2946d2126fff85f0');
      return CategoriesEntity.fromJson(response.data);
    } catch (e) {
      debugPrint(e.toString());
      throw (e);
    }
  }
}
