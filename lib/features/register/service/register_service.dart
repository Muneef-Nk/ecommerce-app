import 'dart:convert';
import 'package:ecommerce_application/api/api_config.dart';
import 'package:ecommerce_application/features/register/model/register_model.dart';
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

      final response = await http.post(
        url,
        body: {
          'name': name,
          'email': email,
          'password': password,
          'shop_id': '1',
          'phone_number': phoneNumber,
        },
        headers: {
          'Accept': 'application/json',
        },
      );
      print(response.body);

      return RegisterModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception('Error registering user: $e');
    }
  }
}
