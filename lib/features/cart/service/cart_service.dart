import 'dart:convert';
import 'package:ecommerce_application/api/api_config.dart';
import 'package:http/http.dart' as http;

class CartApiService {
  Future<Map<String, dynamic>> fetchCart() async {
    try {
      var url = Uri.parse('${ApiConfig.BASEURL}${ApiConfig.CART}');
      final response = await http.get(
        url,
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(
            response.body); // Assuming the cart data is a JSON object
      } else {
        throw Exception(
            'Failed to fetch cart. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching cart: $e');
    }
  }

  // Future<Map<String, dynamic>> updateCart({
  //   required String productId,
  //   required int quantity,
  // }) async {
  //   try {
  //     var url = Uri.parse('${ApiConfig.BASEURL}${ApiConfig.UPDATE_CART}');
  //     final response = await http.post(
  //       url,
  //       headers: {'Accept': 'application/json'},
  //       body: {
  //         'product_id': productId,
  //         'quantity': quantity.toString(),
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       return jsonDecode(response.body);
  //     } else {
  //       throw Exception('Failed to update cart. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error updating cart: $e');
  //   }
  // }
}
