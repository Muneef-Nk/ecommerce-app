import 'package:ecommerce_application/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Categories",
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: 20,
            separatorBuilder: (context, index) => SizedBox(height: 15),
            itemBuilder: (context, inddx) {
              return CategoryContainer();
            }));
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.amber,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Food",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
