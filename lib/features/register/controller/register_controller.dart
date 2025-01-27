import 'package:ecommerce_application/core/constants/color_constants.dart';
import 'package:ecommerce_application/core/utils/helper_function.dart';
import 'package:ecommerce_application/features/bottom_navigation/view/bottom_navigation_view.dart';
import 'package:ecommerce_application/features/register/model/register_model.dart';
import 'package:ecommerce_application/features/register/service/register_service.dart';
import 'package:flutter/material.dart';

class RegisterController with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      RegisterModel response = await RegisterService.registerUser(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      );

      if (response.status == true) {
        showSnackBar(
          context: context,
          message: response.message ?? "User registered successfully!",
          color: AppColor.primary,
        );

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => BottomNavigationView()), (route) => false);
      } else {
        showSnackBar(
          context: context,
          message: response.message ?? "Something went wrong!",
        );
      }
    } catch (e) {
      showSnackBar(
        context: context,
        message: "Something went wrong!",
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
