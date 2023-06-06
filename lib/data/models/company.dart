import 'package:timemate_business/data/models/employee.dart';
import 'package:timemate_business/data/models/service.dart';

class Company {
  String? id;
  String name;
  String primaryColor;
  String? secondaryColor;
  String? slogan;
  List<Employee>? employees;
  List<Service>? services;

  Company({
    this.id,
    required this.name,
    required this.primaryColor,
    this.secondaryColor,
    this.slogan,
    this.employees,
    this.services
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json['id'],
        name: json['name'],
        primaryColor: json['primaryColor'],
        secondaryColor: json['secondaryColor'],
        slogan: json['slogan'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        if (id != null) 'id': id,
        'name': name,
        'primaryColor': primaryColor,
        if (secondaryColor != null) 'secondaryColor': secondaryColor,
        if (slogan != null) 'slogan': slogan,
        if (employees != null) 'employees': employees,
        if (services != null) 'services': services,
      };

  @override
  String toString() {
    return 'Company{\n'
        '\tid: $id,\n'
        '\tname: $name,\n'
        '\tprimaryColor: $primaryColor,\n'
        '\tsecondaryColor: $secondaryColor,\n'
        '\tslogan: $slogan\n'
        '\temployees: $employees\n'
        '\tservices: $services\n'
        '}';
  }
}
