import 'dart:convert';

class User {
  final String id;
  final String fullName;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;
  final String token;

  User(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.state,
      required this.city,
      required this.locality,
      required this.password,
      required this.token});

  // Serialization: Convert User object to a Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      'fullName': fullName,
      'email': email,
      'state': state,
      'city': city,
      'locality': locality,
      'password': password,
      'token': token
    };
  }

  // Serialization: Convert Map to Json string
  // The json.encode() function converts a Dart objects (such as Map or List)
  // into a Json String representation, making it suitable for communication
  // between different systems.
  String toJson() => json.encode(toMap());

  // Deserialization: Convert Json string to User object

  //frommap: this constructor take a Map<String, dynamic> and converts into a user Object
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String? ?? "",
      fullName: map['fullName'] as String? ?? "",
      email: map['email'] as String? ?? "",
      state: map['state'] as String? ?? "",
      city: map['city'] as String? ?? "",
      locality: map['locality'] as String? ?? "",
      password: map['password'] as String? ?? "",
      token: map['token'] as String? ?? "",
    );
  }

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}