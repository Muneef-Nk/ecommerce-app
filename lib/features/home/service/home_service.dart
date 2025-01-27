import 'dart:convert';

import 'package:ecommerce_application/api/api_config.dart';
import 'package:ecommerce_application/core/utils/helper_function.dart';
import 'package:ecommerce_application/features/home/model/products_model.dart';
import 'package:http/http.dart' as http;

class HomeApiService {
  static fetchHomeData() async {
    var url = Uri.parse('${ApiConfig.BASEURL}${ApiConfig.HOME}');
    try {
      var accessToken = await getAccessToken();
      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        return ProductsModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to fetch home data');
      }
    } catch (e) {
      throw Exception('Error fetching home data: $e');
    }
  }
}
