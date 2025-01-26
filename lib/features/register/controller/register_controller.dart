import 'package:ecommerce_application/core/constants/color_constants.dart';
import 'package:ecommerce_application/core/utils/helper_function.dart';
import 'package:ecommerce_application/features/register/service/register_service.dart';
import 'package:flutter/material.dart';

class RegisterController with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
    // required String shopId,
    required String phoneNumber,
    required BuildContext context,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await RegisterService.registerUser(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
      );

      showSnackBar(
        context: context,
        message: "User registered successfully!",
        color: AppColor.primary,
      );
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
