class UserModel {
  UserModel({
    required this.uId,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.token,
    required this.image,
  });

  late final String uId;
  late final String username;
  late final String email;
  late final String token;
  late final String phone;
  late final String password;
  late final String image;

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'] ?? '';
    username = json['username'] ?? '';
    email = json['email'] ?? '';
    email = json['phone'] ?? '';
    email = json['password'] ?? '';
    token = json['token'] ?? '';
    image = json['image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'token': token,
      'image': image,
    };
  }
}