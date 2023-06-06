class Service {
  String id;
  String name;
  String description;
  double price;

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id'].toString(),
        name: json['name'].toString(),
        description: json['description'].toString(),
        price: json['price'] as double,
      );
}
