import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timemate_business/data/models/company.dart';

final companyProvider = Provider((ref) {
  return _Company();
});

class _Company {
  final String _baseUrl = 'http://localhost:3000/api/company';
  Company? company;

  void fetchCompany(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));
    
    if (response.statusCode == 200) {
      company = Company.fromJson(json.decode(response.body));
    } else {
      company = null;
      throw Exception('Failed to load post');
    }
  }

  Future<http.Response> create(Company company) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String> {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(company.toJson()),
    );

    return response;
  }

  Future<List<Company>> fetchCompanies() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((company) => Company.fromJson(company))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
