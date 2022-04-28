import 'package:travelapp/app/data/models/cover_image.dart';
import 'package:travelapp/app/data/models/destination.dart';
import 'package:travelapp/app/data/models/image.dart';

class Post {
  int? id;
  String? title, content;
  double? startCount;
  int? viewCount;
  CoverImage? coverImage;
  Destination? destination;

  Post({
    this.id = -1,
    this.title = '',
    this.content = '',
    this.startCount = 0.0,
    this.viewCount = 0,
    this.destination,
    this.coverImage,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      startCount: double.parse(
          json['stars_count'] == null ? '0' : json['stars_count'].toString()),
      viewCount: int.parse(
          json['views_count'] == null ? '0' : json['views_count'].toString()),
      coverImage: CoverImage.fromJson(json['cover_image']['data']),
      destination: Destination.fromJson(json['destination']['data']),
    );
  }
}
