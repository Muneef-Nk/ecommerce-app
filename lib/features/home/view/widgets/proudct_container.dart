import 'package:ecommerce_application/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ProductContainer extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final double rating;
  final int reviews;

  const ProductContainer({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: 1,
          blurRadius: 15,
        )
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: image.isEmpty
                ? Image.asset(
                    "assets/thum.webp",
                    height: 150,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    image,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'RS. ${price}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: AppColor.primary, size: 14),
                    Text(
                      '$rating',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '$reviews',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(width: 2),
                    Text(
                      'Reviews',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                PopupMenuButton<String>(
                  iconSize: 15,
                  onSelected: (value) {},
                  color: Colors.white,
                  itemBuilder: (BuildContext context) {
                    return [
                      'Option 1',
                      'Option 2',
                      'Option 3',
                    ].map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
