import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timemate_business/data/models/employee.dart';

final employeeProvider = Provider<_Employee>((ref) {
  return _Employee();
});

class _Employee {
  final String _baseUrl = 'http://localhost:3000/api/employee';
  Employee? employee;

  void fetchEmployee(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode == 200) {
      employee = Employee.fromJson(json.decode(response.body));
    } else {
      employee = null;
      throw Exception('Failed to load post');
    }
  }
}
