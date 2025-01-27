import 'package:ecommerce_application/features/category/model/category_model.dart';
import 'package:ecommerce_application/features/category/service/category_service.dart';
import 'package:flutter/material.dart';

class CategoryController with ChangeNotifier {
  bool isLoading = false;
  bool hasMoreData = true;

  int currentPage = 1;
  List<Data> categories = [];

  Future<void> fetchCategories() async {
    if (isLoading || !hasMoreData) return;

    isLoading = true;
    notifyListeners();

    try {
      CategoryModel? categoryModel = await CategoryApiService.fetchCategories(currentPage);
      if (categoryModel != null && categoryModel.category != null) {
        categories.addAll(categoryModel.category!.data!);
        currentPage++;
      } else {
        hasMoreData = false;
      }
    } catch (e) {
      print('Error fetching categories: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
