class NewUserDetails {
  final String email;
  final String role;
  final String username;
  final String avatar;

  NewUserDetails(this.email, this.role, this.username, this.avatar);

  NewUserDetails.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        role = json['role'],
        username = json['username'],
        avatar = json['avatar'];
}
