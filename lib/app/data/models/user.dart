class User {
  final int id;
  final String username, phone, email;
  final String? token;

  User({
    required this.id,
    required this.username,
    required this.phone,
    required this.email,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      token: json['token'],
      // pro_weight: double.parse(
      //     json['pro_weight'] == null ? '0' : json['pro_weight'].toString()),
    );
  }
}
