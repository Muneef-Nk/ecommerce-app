import 'package:ecommerce_application/features/cart/service/cart_service.dart';
import 'package:flutter/material.dart';

class CartController with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchCart() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await CartApiService.fetchCart();
    } catch (e) {
      print('Error fetching cart: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
