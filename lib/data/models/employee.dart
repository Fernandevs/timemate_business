import 'package:timemate_business/data/models/appointment.dart';
import 'package:timemate_business/data/models/company.dart';
import 'package:timemate_business/data/models/service.dart';
import 'package:timemate_business/data/models/user.dart';

class Employee {
  String id;
  String name;
  String lastname;
  String curp;
  String rfc;
  String position;
  List<Appointment>? appointments;
  Company company;
  List<Service> services;
  User user;

  Employee(
    this.id,
    this.name,
    this.lastname,
    this.curp,
    this.rfc,
    this.position,
    this.appointments,
    this.company,
    this.services,
    this.user,
  );

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        json['id'],
        json['name'],
        json['lastname'],
        json['curp'],
        json['rfc'],
        json['position'],
        json['appointments'],
        json['company'],
        json['services'],
        json['user'],
      );
}
