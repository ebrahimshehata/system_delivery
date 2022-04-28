class ChatModel {
  ChatModel({
    required this.username,
    required this.userImage,
    required this.userId,
  });

  late final String username;
  late final String userImage;
  late final String userId;

  ChatModel.fromJson(Map<String, dynamic> json) {
    username = json['username'] ?? '';
    userImage = json['userImage'] ?? '';
    userId = json['userId'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'userImage': userImage,
      'userId': userId,
    };
  }
}