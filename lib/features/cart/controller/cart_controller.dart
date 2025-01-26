import 'package:ecommerce_application/features/cart/repository/cart_repository.dart';
import 'package:flutter/material.dart';

class CartController with ChangeNotifier {
  final CartRepository _cartRepository = CartRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<dynamic> _cartItems = [];
  List<dynamic> get cartItems => _cartItems;

  double _totalAmount = 0.0;
  double get totalAmount => _totalAmount;

  Future<void> fetchCart() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _cartRepository.fetchCart();
      _cartItems = response['items'];
      _totalAmount = response['total_amount'];
    } catch (e) {
      print('Error fetching cart: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Future<void> updateCartQuantity({
  //   required String productId,
  //   required int quantity,
  // }) async {
  //   _isLoading = true;
  //   notifyListeners();

  //   try {
  //     await _cartRepository.updateCart(
  //       productId: productId,
  //       quantity: quantity,
  //     );
  //     await fetchCart(); // Refresh cart after updating
  //   } catch (e) {
  //     print('Error updating cart: $e');
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }
}
