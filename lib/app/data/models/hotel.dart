import 'package:travelapp/app/data/models/cover_image.dart';
import 'package:travelapp/app/data/models/destination.dart';
import 'package:travelapp/app/data/models/image.dart';

class Hotel {
  int? id;
  String? name, content, contactEmail, facebookLink, phoneNumber;
  int? priceFrom;
  double? startCount;
  CoverImage? coverImage;
  List<ImageModel> images = List<ImageModel>.empty(growable: true);
  Destination? destination;

  Hotel({
    this.id = -1,
    this.name = '',
    this.content = '',
    this.startCount = 0.0,
    this.contactEmail = '',
    this.facebookLink = '',
    this.phoneNumber = '',
    this.priceFrom = 0,
    this.coverImage,
    this.destination,
    required this.images,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json["album"]["data"];
    List<ImageModel>? images_tmp = List<ImageModel>.empty(growable: true);
    list.forEach((d) {
      images_tmp.add(ImageModel.fromJson(d));
    });
    return Hotel(
      id: json['id'],
      name: json['name'],
      content: json['content'],
      startCount: double.parse(
          json['stars_count'] == null ? '0' : json['stars_count'].toString()),
      contactEmail: json['contact_email'],
      facebookLink: json['facebook_link'],
      phoneNumber: json['phone_number'],
      priceFrom: json['price_from'] ?? 0,
      coverImage: CoverImage.fromJson(json['cover_image']['data']),
      destination: Destination.fromJson(json['destination']['data']),
      images: images_tmp,
    );
  }
}
