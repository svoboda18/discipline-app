class User {
  const User({required this.username, required this.password});
  final String username;
  final String password;

  factory User.fromJson(Map<String, String> json) {
    return User(username: json['username']!, password: json['password']!);
  }

  Map<String, String> toJson() {
    return {'username': username, 'password': password};
  }
}
