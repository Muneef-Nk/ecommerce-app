import 'package:ecommerce_application/core/constants/color_constants.dart';
import 'package:ecommerce_application/features/home/view/widgets/heading.dart';
import 'package:ecommerce_application/features/home/view/widgets/proudct_container.dart';
import 'package:flutter/material.dart';

class HomeEcommerceScreen extends StatelessWidget {
  const HomeEcommerceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Shammas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Let's start shopping",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: AppColor.amber,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.notifications_outlined),
          ),
          Container(
            width: 45,
            height: 45,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: AppColor.amber,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(Icons.favorite_outline),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 200,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 234, 75),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/thum.webp",
                      width: 120,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Onam Special",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Exclusive Offer",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Qui dolor do ut proident dolore exercitation eu irure pariatur",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 2,
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: AppColor.darkAmber,
                              ),
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: AppColor.darkAmber,
                              ),
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: AppColor.darkAmber,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Heading(
              label: "Categories",
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _categoryItem('Electronics', ''),
                    _categoryItem('Clothing', ''),
                    _categoryItem('Home', ''),
                    _categoryItem('Beauty', ''),
                    _categoryItem('Toys', ''),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Heading(
              label: "Top Selling",
              onPressed: () {},
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                itemCount: 10,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                separatorBuilder: (context, index) => SizedBox(width: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductContainer();
                },
              ),
            ),
            SizedBox(height: 15),
            Heading(
              label: "Best offers",
              onPressed: () {},
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                itemCount: 10,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                separatorBuilder: (context, index) => SizedBox(width: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ProductContainer();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryItem(String title, String icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/thum.webp"),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
