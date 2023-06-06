class Logo {
  String id;
  String url;

  Logo(this.id, this.url);

  factory Logo.fromJson(Map<String, dynamic> json) => Logo(
        json['id'],
        json['url'],
      );
}
