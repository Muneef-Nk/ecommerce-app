import 'dart:convert';
import 'package:ecommerce_application/api/api_config.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  static registerUser({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      var url = Uri.parse('${ApiConfig.BASEURL}${ApiConfig.REGISTER}');

      final body = {
        'name': name,
        'email': email,
        'password': password,
        'shop_id': '1',
        'phone_number': phoneNumber,
      };

      final response = await http.post(
        url,
        body: body,
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception(
            'Failed to register user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error registering user: $e');
    }
  }
}
