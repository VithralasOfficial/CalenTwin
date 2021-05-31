import 'package:integrative/Screens/HomePage/components/Event.dart';

class UserBoundary {
  UserId userId;
  String role;
  String username;
  String avatar;
  Set<EventItem> events = {};

  UserBoundary(this.userId, this.role, this.username, this.avatar);

  UserBoundary.fromJson(Map<String, dynamic> json)
      : userId = UserId.fromJson(json['userId']),
        role = json['role'],
        username = json['username'],
        avatar = json['avatar'];

  Map<String, dynamic> toJson() => {
        'userId': userId.toJson(),
        'role': role,
        'username': username,
        'avatar': avatar
      };
}

class UserId {
  String space;
  String email;

  UserId(this.space, this.email);

  UserId.fromJson(Map<String, dynamic> json)
      : space = json['space'],
        email = json['email'];

  Map<String, dynamic> toJson() => {'space': space, 'email': email};
}
