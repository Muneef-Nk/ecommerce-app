import 'dart:convert';

import 'package:ecommerce_application/api/api_config.dart';
import 'package:ecommerce_application/features/login/model/login_model.dart';
import 'package:ecommerce_application/features/login/model/login_success_model.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static login(String email, String password) async {
    var url = Uri.parse('${ApiConfig.BASEURL}${ApiConfig.LOGIN}');

    try {
      final response = await http.post(url, body: {
        'email': email,
        'password': password,
      });

      print(response.statusCode);
      print(response.body);
      var decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return LoginSuccessModel.fromJson(decodedData);
      } else {
        return LoginModel.fromJson(decodedData);
      }
    } catch (e) {
      throw (e);
    }
  }
}
