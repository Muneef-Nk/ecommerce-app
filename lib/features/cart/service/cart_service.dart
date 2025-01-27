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

      print(response.body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Failed to fetch cart. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching cart: $e');
    }
  }
}


// getting res

// I/flutter ( 8247):             "file": "/home/u167681531/domains/ecominnerix.com/public_html/app/vendor/laravel/framework/src/Illuminate/Routing/Router.php",
// I/flutter ( 8247):             "line": 673,
// I/flutter ( 8247):             "function": "match",
// I/flutter ( 8247):             "class": "Illuminate\\Routing\\CompiledRouteCollection",
// I/flutter ( 8247):             "type": "->"
// I/flutter ( 8247):         },
// I/flutter ( 8247):         {
// I/flutter ( 8247):             "file": "/home/u167681531/domains/ecominnerix.com/public_html/