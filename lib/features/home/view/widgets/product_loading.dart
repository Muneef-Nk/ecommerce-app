import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductsLoading extends StatelessWidget {
  const ProductsLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      separatorBuilder: (context, index) => SizedBox(width: 15),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 150, // Width of the shimmer container
            color: Colors.white,
          ),
        );
      },
    );
  }
}
