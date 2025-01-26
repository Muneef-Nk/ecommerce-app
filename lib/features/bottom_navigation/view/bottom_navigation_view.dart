import 'package:ecommerce_application/core/constants/color_constants.dart';
import 'package:ecommerce_application/features/bottom_navigation/controller/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 251, 251, 251),
      body:
          Consumer<BottomNavigationController>(builder: (context, provider, _) {
        return provider.screens[provider.selectedIndex];
      }),
      bottomNavigationBar:
          Consumer<BottomNavigationController>(builder: (context, provider, _) {
        return BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: Colors.grey,
          currentIndex: provider.selectedIndex,
          onTap: (value) {
            provider.updateIndex(value);
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined),
              label: "Offers",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        );
      }),
    );
  }
}
