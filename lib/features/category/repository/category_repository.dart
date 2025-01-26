import 'package:ecommerce_application/features/category/service/category_service.dart';

class CategoryRepository {
  final CategoryApiService _categoryApiService = CategoryApiService();

  Future<List<dynamic>> fetchCategories() {
    return _categoryApiService.fetchCategories();
  }

  // Future<Map<String, dynamic>> fetchProductsByCategory({
  //   required String categoryId,
  //   required int page,
  // }) {
  //   return _categoryApiService.fetchProductsByCategory(
  //     categoryId: categoryId,
  //     page: page,
  //   );
  // }
}
