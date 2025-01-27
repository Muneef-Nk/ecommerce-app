import 'package:ecommerce_application/features/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:ecommerce_application/features/cart/controller/cart_controller.dart';
import 'package:ecommerce_application/features/category/controller/category_controller.dart';
import 'package:ecommerce_application/features/home/controller/home_controller.dart';
import 'package:ecommerce_application/features/login/controller/login_controller.dart';
import 'package:ecommerce_application/features/login/view/login_view.dart';
import 'package:ecommerce_application/features/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavigationController()),
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => RegisterController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => CategoryController()),
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
