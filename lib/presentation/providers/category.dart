import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timemate_business/data/models/category.dart';

final categoryProvider = Provider<_Category>((ref) {
  return _Category();
});

class _Category {
  final String _baseUrl = 'http://localhost:3000/api/category';

  Future<List<Category>> findAll() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((category) => Category.fromJson(category))
          .toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<http.Response> findOne(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load the category');
    }
  }

  Future<http.Response> create(Category category) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(category.toJson()),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to create a category');
    }
  }

  Future<http.Response> update(Category category) async {
    final response = await http.patch(
      Uri.parse('$_baseUrl/${category.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(category.toJson()),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to update the category');
    }
  }

  Future<http.Response> delete(Category category) async {
    final response = await http.delete(
      Uri.parse('$_baseUrl/${category.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(category.toJson()),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to delete the category');
    }
  }
}
