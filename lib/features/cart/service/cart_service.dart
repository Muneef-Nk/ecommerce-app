import 'dart:convert';
import 'package:ecommerce_application/api/api_config.dart';
import 'package:ecommerce_application/core/utils/helper_function.dart';
import 'package:http/http.dart' as http;

class CartApiService {
  static fetchCart() async {
    try {
      var url = Uri.parse('${ApiConfig.BASEURL}${ApiConfig.CART}');
      var token = await getAccessToken();
      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to fetch cart. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching cart: $e');
    }
  }
}
