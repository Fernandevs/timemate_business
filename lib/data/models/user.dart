class User {
  String id;
  String role;
  int iat;

  User({required this.id, required this.role, required this.iat});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      role: json['role'] as String,
      iat: json['iat'] as int,
    );
  }
}
