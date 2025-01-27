import 'dart:convert';

import 'package:ecommerce_application/api/api_config.dart';
import 'package:ecommerce_application/core/utils/helper_function.dart';
import 'package:ecommerce_application/features/category/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryApiService {
  static fetchCategories(int page) async {
    try {
      var token = await getAccessToken();

      var url = Uri.parse('${ApiConfig.BASEURL}${ApiConfig.CATEGORIES}?page=$page');
      final response = await http.post(
        url,
        body: {
          'page': page.toString(),
          "name": "nature",
        },
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);

      if (response.statusCode == 200) {
        return CategoryModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to fetch categories');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }
}
