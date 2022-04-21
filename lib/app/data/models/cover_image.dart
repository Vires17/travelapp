class CoverImage {
  int? id;
  String? largeUrl, mediumUrl, smallUrl, thumbnailUrl, originalUrl;

  CoverImage({
    this.id = -1,
    this.largeUrl = '',
    this.mediumUrl = '',
    this.smallUrl = '',
    this.thumbnailUrl = '',
    this.originalUrl = '',
  });

  factory CoverImage.fromJson(Map<String, dynamic> json) {
    return CoverImage(
      id: json['id'],
      // largeUrl: json['attributes']!['formats']!['large']!['url'] ?? '',
      // mediumUrl: json['attributes']['formats']['medium']['url'] ?? '',
      // smallUrl: json['attributes']['formats']['small']['url'] ?? '',
      // thumbnailUrl: json['attributes']['formats']['thumbnail']['url'] ?? '',
      originalUrl: json['attributes']['url'] ?? '',
    );
  }
}
