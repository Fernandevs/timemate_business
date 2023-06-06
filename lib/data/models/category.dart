class Category {
  String? id;
  String name;

  Category({this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'].toString(),
        name: json['name'].toString(),
      );

  Map<String, dynamic> toJson() => {
        if (id != null) 'id': id,
        'name': name,
      };
}
