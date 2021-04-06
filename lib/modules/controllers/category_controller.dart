import 'package:assignment_project/collections/general_utils/check_online.dart';
import 'package:assignment_project/collections/services/categories_services.dart';
import 'package:assignment_project/modules/models/categories_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  TextEditingController searchController = TextEditingController();
  CategoryServices services = CategoryServices.global();
  var entity = CategoriesEntity().obs;

  final noInternet = false.obs;
  final serverError = false.obs;
  final _isLoading = false.obs;

  bool get isLoading => this._isLoading.value;

  bool get internetError => this.noInternet.value;

  // setters
  void changeInternetError(bool value) => this.noInternet.value = value;

  void changeServerError(bool value) => this.serverError.value = value;

  void changeIsLoading(bool value) => this._isLoading.value = value;

  @override
  void onInit() {
    super.onInit();
    fetchServices();
  }

  void fetchServices() async {
    if (await isOnlineCheck()) {
      try {
        changeInternetError(false);
        changeIsLoading(true);
        changeServerError(false);
        entity.value = await services.fetchCategories();
        changeIsLoading(false);
      } catch (e) {
        print(e.toString());
        changeIsLoading(false);
        changeServerError(true);
      }
    } else {
      changeInternetError(true);
    }
  }
}
