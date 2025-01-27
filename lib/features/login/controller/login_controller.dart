import 'package:ecommerce_application/core/constants/color_constants.dart';
import 'package:ecommerce_application/core/utils/helper_function.dart';
import 'package:ecommerce_application/features/bottom_navigation/view/bottom_navigation_view.dart';
import 'package:ecommerce_application/features/home/controller/home_controller.dart';
import 'package:ecommerce_application/features/login/model/login_model.dart';
import 'package:ecommerce_application/features/login/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      var response = await LoginService.login(email, password);

      if (response is LoginModel) {
        if (response.status == true) {
          showSnackBar(context: context, message: "Login successful!", color: AppColor.primary);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavigationView()), (route) => false);
        } else {
          showSnackBar(
            context: context,
            message: response.messages ?? 'Invalid credentials',
          );
        }
      } else {
        showSnackBar(context: context, message: "Login successful!", color: AppColor.primary);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavigationView()), (route) => false);
        saveUserDetailsToPreferences(response);
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
