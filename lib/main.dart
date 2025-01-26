import 'package:ecommerce_application/features/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:ecommerce_application/features/bottom_navigation/view/bottom_navigation_view.dart';
import 'package:ecommerce_application/features/login/controller/login_controller.dart';
import 'package:ecommerce_application/features/login/view/login_view.dart';
import 'package:ecommerce_application/features/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BottomNavigationController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => RegisterController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
