import 'package:timemate_business/data/models/customer.dart';
import 'package:timemate_business/data/models/employee.dart';
import 'package:timemate_business/data/models/service.dart';

class Appointment {
  String id;
  DateTime dateTime;
  Customer customer;
  Employee employee;
  Service service;

  Appointment({
    required this.id,
    required this.dateTime,
    required this.customer,
    required this.employee,
    required this.service,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
        id: json['id'],
        dateTime: json['dateTime'],
        customer: json['customer'],
        employee: json['employee'],
        service: json['service'],
      );
}
