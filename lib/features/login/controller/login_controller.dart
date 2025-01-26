import 'package:ecommerce_application/core/constants/color_constants.dart';
import 'package:ecommerce_application/core/utils/helper_function.dart';
import 'package:ecommerce_application/features/login/model/login_model.dart';
import 'package:ecommerce_application/features/login/service/login_service.dart';
import 'package:flutter/material.dart';

class LoginController with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      LoginModel response = await LoginService.login(email, password);
      print(response.status);

      if (response.status == true) {
        showSnackBar(
            context: context,
            message: "Login successful!",
            color: AppColor.primary);
      } else {
        showSnackBar(
          context: context,
          message: response.messages ?? 'Login failed',
        );
      }
    } catch (e) {
      showSnackBar(context: context, message: 'Something went wrong!');
      _isLoading = false;
      notifyListeners();
    }
    _isLoading = false;
    notifyListeners();
  }
}
