class User {
  int? id;
  String? username, phone, email;
  String? token;

  User({
    this.id = -1,
    this.username = '',
    this.phone = '',
    this.email = '',
    this.token = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['name'],
      phone: json['phone_number'],
      email: json['email'],
      token: json['token'],
      // pro_weight: double.parse(
      //     json['pro_weight'] == null ? '0' : json['pro_weight'].toString()),
    );
  }
}
