import 'package:ecommerce_application/features/home/repository/home_repository.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  final HomeRepository _homeRepository = HomeRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Map<String, dynamic>? _homeData;
  Map<String, dynamic>? get homeData => _homeData;

  Future<void> fetchHomeData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _homeData = await _homeRepository.fetchHomeData();
      print('Home data fetched successfully: $_homeData');
    } catch (e) {
      print('Error fetching home data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
