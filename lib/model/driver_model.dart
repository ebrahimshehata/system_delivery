class DriverModel {
  DriverModel({
    required this.uId,
    required this.drivername,
    required this.email,
    required this.phone,
    required this.password,
    required this.token,
    required this.image,
  });

  late final String uId;
  late final String drivername;
  late final String email;
  late final String token;
  late final String phone;
  late final String password;
  late final String image;

  DriverModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'] ?? '';
    drivername = json['drivername'] ?? '';
    email = json['email'] ?? '';
    email = json['phone'] ?? '';
    email = json['password'] ?? '';
    token = json['token'] ?? '';
    image = json['image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'drivername': drivername,
      'email': email,
      'phone': phone,
      'password': password,
      'token': token,
      'image': image,
    };
  }
}