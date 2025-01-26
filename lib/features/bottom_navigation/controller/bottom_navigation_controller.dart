import 'package:ecommerce_application/features/account/view/provider_view.dart';
import 'package:ecommerce_application/features/cart/view/cart_view.dart';
import 'package:ecommerce_application/features/category/view/category_view.dart';
import 'package:ecommerce_application/features/home/view/home_view.dart';
import 'package:ecommerce_application/features/profile/view/profile_view.dart';
import 'package:flutter/material.dart';

class BottomNavigationController extends ChangeNotifier {
  int selectedIndex = 0;

  final List<Widget> screens = [
    HomeEcommerceScreen(),
    CategoryView(),
    Center(child: Text('Offers')),
    CartScreen(),
    ProfileView(),
  ];

  updateIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
