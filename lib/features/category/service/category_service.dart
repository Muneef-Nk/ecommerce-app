import 'dart:convert';
import 'package:ecommerce_application/api/api_config.dart';
import 'package:http/http.dart' as http;

class CategoryApiService {
  Future<List<dynamic>> fetchCategories() async {
    try {
      var url = Uri.parse('${ApiConfig.BASEURL}${ApiConfig.CATEGORIES}');
      final response = await http.get(
        url,
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        return jsonDecode(
            response.body); // Assuming the response is a list of categories
      } else {
        throw Exception(
            'Failed to fetch categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }

  // Future<Map<String, dynamic>> fetchProductsByCategory({
  //   required String categoryId,
  //   required int page,
  // }) async {
  //   try {
  //     var url = Uri.parse(
  //         '${ApiConfig.BASEURL}${ApiConfig.CATEGORY_PRODUCTS.replaceFirst('{id}', categoryId)}?page=$page');
  //     final response = await http.get(
  //       url,
  //       headers: {'Accept': 'application/json'},
  //     );

  //     if (response.statusCode == 200) {
  //       return jsonDecode(response
  //           .body); // Assuming the response includes product data with pagination
  //     } else {
  //       throw Exception(
  //           'Failed to fetch products for category $categoryId. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     throw Exception('Error fetching products: $e');
  //   }
  // }
}
