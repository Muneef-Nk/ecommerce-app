import 'package:ecommerce_application/features/home/model/products_model.dart';
import 'package:ecommerce_application/features/home/service/home_service.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  ProductsModel? productsModel;
  Future<void> fetchHomeData() async {
    _isLoading = true;
    notifyListeners();

    try {
      productsModel = await HomeApiService.fetchHomeData();
    } catch (e) {
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    notifyListeners();
  }
}
