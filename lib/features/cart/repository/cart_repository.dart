import 'package:ecommerce_application/features/cart/service/cart_service.dart';

class CartRepository {
  final CartApiService _cartApiService = CartApiService();

  Future<Map<String, dynamic>> fetchCart() {
    return _cartApiService.fetchCart();
  }

  // Future<Map<String, dynamic>> updateCart({
  //   required String productId,
  //   required int quantity,
  // }) {
  //   return _cartApiService.updateCart(
  //     productId: productId,
  //     quantity: quantity,
  //   );
  // }
}
