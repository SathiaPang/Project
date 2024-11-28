class User {
  String? username;
  String? email;
  String? password;
  String? phoneNumber;

  User({
    required this.email,
    required this.password,
    required this.username,
    this.phoneNumber = "",
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'phoneNumber': phoneNumber,
        'password': password,
      };
  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json['username'],
        email: json['email'],
        password: json['password'],
        phoneNumber: json['phoneNumber'],
      );
}
