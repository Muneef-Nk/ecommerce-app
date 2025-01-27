import 'package:ecommerce_application/features/category/controller/category_controller.dart';
import 'package:ecommerce_application/features/category/view/widgets/category_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final categoryController = Provider.of<CategoryController>(context, listen: false);
    categoryController.fetchCategories();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !categoryController.isLoading) {
        categoryController.fetchCategories();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Categories",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Consumer<CategoryController>(
        builder: (context, categoryController, child) {
          if (categoryController.isLoading && categoryController.categories.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (categoryController.categories.isEmpty) {
            return const Center(
              child: Text("No categories available."),
            );
          }

          return ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: categoryController.categories.length + 1,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              if (index < categoryController.categories.length) {
                final category = categoryController.categories[index];
                return CategoryContainer(
                  categoryName: category.categoryName ?? '',
                  image: category.categoryImage ?? '',
                );
              } else {
                return categoryController.isLoading ? const Center(child: CircularProgressIndicator()) : const SizedBox();
              }
            },
          );
        },
      ),
    );
  }
}
