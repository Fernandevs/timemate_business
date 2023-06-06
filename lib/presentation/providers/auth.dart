import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:timemate_business/data/models/user.dart';
import 'package:timemate_business/helpers/exceptions/user_not_found.dart';

final authProvider = Provider<_Auth>((ref) {
  return _Auth();
});

class _Auth {
  late String _jwt;
  String get jwt => _jwt;

  late User? _user;
  User? get user => _user;

  _Auth() {
    _user = null;
  }

  login({required String email, required String password}) async {
    final url = Uri.parse('http://localhost:3000/api/auth/login');

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{
            'email': email,
            'password': password,
          },
        ),
      );
      _jwt = jsonDecode(response.body)['token'] ?? '';

      if(_jwt.isNotEmpty) {
        _user = User.fromJson(JwtDecoder.decode(_jwt));
      } else {
        throw UserNotFound();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  logout() {
    _user = null;
  }
}
