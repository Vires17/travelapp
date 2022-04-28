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
    CoverImage cover_tmp = CoverImage(
        id: -1,
        originalUrl:
            'https://travel-api-public.s3.ap-southeast-1.amazonaws.com/large_144525984_36ecbf2f08.jpg');
    if (json['cover_image'] != null) {
      cover_tmp = CoverImage.fromJson(json['cover_image']['data']);
    }
    return Destination(
      id: json['id'],
      name: json['name'],
      coverImage: cover_tmp,
    );
  }
}
