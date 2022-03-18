class Destination {
  int? id;
  String? name;

  Destination({
    this.id,
    this.name,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'],
      name: json['name'],
    );
  }
}
