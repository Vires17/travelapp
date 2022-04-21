import 'package:travelapp/app/data/models/cover_image.dart';

class Destination {
  int? id;
  String? name;
  CoverImage? coverImage;

  Destination({
    this.id,
    this.name,
    this.coverImage,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      id: json['id'],
      name: json['name'],
      coverImage: CoverImage.fromJson(json['cover_image']['data']),
    );
  }
}
