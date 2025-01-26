import 'dart:convert';
import 'package:ecommerce_application/api/api_config.dart';
import 'package:http/http.dart' as http;

class HomeApiService {
  Future<Map<String, dynamic>> fetchHomeData() async {
    var url = Uri.parse('${ApiConfig.BASEURL}${ApiConfig.HOME}');
    try {
      final response = await http.get(url, headers: {
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to fetch home data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching home data: $e');
    }
  }
}
