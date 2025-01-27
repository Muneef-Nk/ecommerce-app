import 'package:ecommerce_application/features/login/model/login_success_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

showSnackBar(
    {required BuildContext context, required String message, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        "$message",
        style: TextStyle(color: Colors.white, fontSize: 14),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: color ?? Colors.red,
    ),
  );
}

Future<void> clearPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}

Future<void> saveUserDetailsToPreferences(LoginSuccessModel response) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Save user details
  await prefs.setString('name', response.user?.name ?? '');
  await prefs.setString('email', response.user?.email ?? '');
  await prefs.setString('profile_image', response.user?.profileImage ?? '');

  // Save tokens
  await prefs.setString('access_token', response.accessToken ?? '');
  await prefs.setString('refresh_token', response.refreshToken ?? '');
}

getAccessToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('access_token');
}

getRefreshToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('refresh_token');
}

getName() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('name');
}

getEmail() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}

getProfile() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('profile_image');
}
