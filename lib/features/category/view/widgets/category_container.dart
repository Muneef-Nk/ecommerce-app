import 'package:ecommerce_application/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String categoryName;
  final String image;
  const CategoryContainer({
    super.key,
    required this.categoryName,
    required this.image,
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
