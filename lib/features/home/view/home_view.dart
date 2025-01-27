import 'package:ecommerce_application/core/constants/color_constants.dart';
import 'package:ecommerce_application/core/utils/helper_function.dart';
import 'package:ecommerce_application/features/home/controller/home_controller.dart';
import 'package:ecommerce_application/features/home/view/widgets/category_loading.dart';
import 'package:ecommerce_application/features/home/view/widgets/heading.dart';
import 'package:ecommerce_application/features/home/view/widgets/product_loading.dart';
import 'package:ecommerce_application/features/home/view/widgets/proudct_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeEcommerceScreen extends StatefulWidget {
  const HomeEcommerceScreen({super.key});

  @override
  State<HomeEcommerceScreen> createState() => _HomeEcommerceScreenState();
}

class _HomeEcommerceScreenState extends State<HomeEcommerceScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Provider.of<HomeController>(context, listen: false).fetchHomeData();
      getData();
    });
  }

  getData() async {
    name = await getName();
    setState(() {});
  }

  var name;
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
              'Hi, ${name ?? ""}',
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
            SizedBox(
              height: 100,
              child: Consumer<HomeController>(builder: (context, provider, _) {
                return provider.isLoading
                    ? CategoryLoading()
                    : ListView.builder(
                        scrollDirection:
                            Axis.horizontal, // Horizontal scrolling
                        itemCount:
                            provider.productsModel?.categories?.items?.length ??
                                0, // Dynamically set item count
                        itemBuilder: (context, index) {
                          var item =
                              provider.productsModel?.categories?.items?[index];
                          return _categoryItem(
                            item?.categoryName ?? '', // Category name
                            item?.categoryImage ?? '', // Category image
                          );
                        },
                      );
              }),
            ),
            SizedBox(height: 15),
            Heading(
              label: "Top Selling",
              onPressed: () {},
            ),
            Consumer<HomeController>(builder: (context, provider, _) {
              return provider.isLoading
                  ? ProductsLoading()
                  : provider.productsModel?.topSellingItems?.items?.isEmpty ??
                          true
                      ? Center(child: Text("No top-selling items available."))
                      : SizedBox(
                          height: 300,
                          child: ListView.separated(
                            itemCount: provider.productsModel?.topSellingItems
                                    ?.items?.length ??
                                0,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 15),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var item = provider.productsModel?.topSellingItems
                                  ?.items?[index];
                              return ProductContainer(
                                image: item?.thumbnailImage ?? '',
                                price: item?.price.toString() ?? '',
                                rating: 4.5,
                                reviews: 77,
                                title: item?.name ?? '',
                              );
                            },
                          ),
                        );
            }),
            SizedBox(height: 15),
            Heading(
              label: "Best offers",
              onPressed: () {},
            ),
            Consumer<HomeController>(builder: (context, provider, _) {
              return provider.productsModel?.bestOffers?.items?.isEmpty ?? true
                  ? Center(child: Text("No best offers items available."))
                  : SizedBox(
                      height: 300,
                      child: ListView.separated(
                        itemCount:
                            provider.productsModel?.bestOffers?.items?.length ??
                                0,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 15),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var item =
                              provider.productsModel?.bestOffers?.items?[index];
                          return ProductContainer(
                            image: item?.thumbnailImage ?? '',
                            price: item?.price.toString() ?? '',
                            rating: 4.5,
                            reviews: 77,
                            title: item?.name ?? '',
                          );
                        },
                      ),
                    );
            }),
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
          icon.isEmpty
              ? CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/thum.webp"),
                  ),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(icon),
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
