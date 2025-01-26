import 'package:ecommerce_application/features/home/service/home_service.dart';

class HomeRepository {
  final HomeApiService _homeApiService = HomeApiService();

  Future<Map<String, dynamic>> fetchHomeData() {
    return _homeApiService.fetchHomeData();
  }
}
