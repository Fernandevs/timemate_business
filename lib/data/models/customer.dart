import 'package:timemate_business/data/models/appointment.dart';
import 'package:timemate_business/data/models/user.dart';

class Customer {
  String id;
  String name;
  String lastname;
  String? address;
  String? telephone;
  List<Appointment>? appointments;
  User user;

  Customer(this.id,
      this.name,
      this.lastname,
      this.address,
      this.telephone,
      this.appointments,
      this.user,);

  factory Customer.fromJson(Map<String, dynamic> json) =>
      Customer(
        json['id'],
        json['name'],
        json['lastname'],
        json['address'],
        json['telephone'],
        json['appointments'],
        json['user'],
      );
}
