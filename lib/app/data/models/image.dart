class ImageModel {
  int? id;
  String? largeUrl, mediumUrl, smallUrl, thumbnailUrl, originalUrl;

  ImageModel({
    this.id = -1,
    this.largeUrl = '',
    this.mediumUrl = '',
    this.smallUrl = '',
    this.thumbnailUrl = '',
    this.originalUrl = '',
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      // largeUrl: json['attributes']!['formats']!['large']!['url'] ?? '',
      // mediumUrl: json['attributes']['formats']['medium']['url'] ?? '',
      // smallUrl: json['attributes']['formats']['small']['url'] ?? '',
      // thumbnailUrl: json['attributes']['formats']['thumbnail']['url'] ?? '',
      originalUrl: json['attributes']['url'] ?? '',
    );
  }
}
