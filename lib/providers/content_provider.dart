import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/mock_api_service.dart';

class ContentProvider with ChangeNotifier {
  final MockApiService _apiService = MockApiService();
  
  List<Movie> _movies = [];
  bool _isLoading = true;

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  ContentProvider() {
    loadContent();
  }

  Future<void> loadContent() async {
    _isLoading = true;
    notifyListeners();

    try {
      final jsonList = await _apiService.fetchMovies();
      _movies = jsonList.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      print("Error loading mock data: \$e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
