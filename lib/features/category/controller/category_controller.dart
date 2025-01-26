import 'package:ecommerce_application/features/category/repository/category_repository.dart';
import 'package:flutter/material.dart';

class CategoryController with ChangeNotifier {
  final CategoryRepository _categoryRepository = CategoryRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<dynamic> _categories = [];
  List<dynamic> get categories => _categories;

  List<dynamic> _products = [];
  List<dynamic> get products => _products;

  int _currentPage = 1;
  bool _hasMoreProducts = true;

  Future<void> fetchCategories() async {
    _isLoading = true;
    notifyListeners();

    try {
      _categories = await _categoryRepository.fetchCategories();
    } catch (e) {
      print('Error fetching categories: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Future<void> fetchProductsByCategory(String categoryId) async {
  //   if (!_hasMoreProducts) return;

  //   _isLoading = true;
  //   notifyListeners();

  //   try {
  //     final response = await _categoryRepository.fetchProductsByCategory(
  //       categoryId: categoryId,
  //       page: _currentPage,
  //     );

  //     _products.addAll(
  //         response['data']); // Assuming 'data' contains the list of products
  //     _hasMoreProducts = response['next_page_url'] != null;
  //     _currentPage++;
  //   } catch (e) {
  //     print('Error fetching products: $e');
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  void resetPagination() {
    _products.clear();
    _currentPage = 1;
    _hasMoreProducts = true;
    notifyListeners();
  }
}
