import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:timemate_business/data/models/appointment.dart';

final appointmentProvider = Provider<_Appointment>((ref) {
  return _Appointment();
});

class _Appointment {
  final String _baseUrl = 'http://localhost:3000/api/appointment';

  Future<List<Appointment>> fetchAppointments() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((appointment) => Appointment.fromJson(appointment))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }
}
