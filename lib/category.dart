import 'dart:convert';
import 'package:http/http.dart' as http;

class Meal {
  final int id;
  final String name;
  final String category;
  final String imageUrl;

  Meal({required this.id, required this.name, required this.category, required this.imageUrl});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      imageUrl: json['imageUrl'],
    );
  }
}

class MealService {
  static const String baseUrl = 'https://your-api-url.com';

  Future<List<Meal>> fetchMeals() async {
    final response = await http.get(Uri.parse('$baseUrl/meals'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }
}