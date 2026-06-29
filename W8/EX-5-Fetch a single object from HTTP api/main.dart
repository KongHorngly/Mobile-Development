import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

void main() async {
  // 1. API URL
  Uri url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');

  // 2. Send GET request
  Response response = await http.get(url);

  // 3. Check status code
  if (response.statusCode != 200) {
    throw Exception('Failed to fetch user (HTTP ${response.statusCode})');
  }

  // 4. Parse JSON
  Map<String, dynamic> json = jsonDecode(response.body);

  // 5. Create User object
  User user = User.fromJson(json);

  print(user);
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
  });

  static User fromJson(Map<String, dynamic> json) {
    const String idKey = 'id';
    const String nameKey = 'name';
    const String usernameKey = 'username';
    const String emailKey = 'email';

    assert(json[idKey] is int);
    assert(json[nameKey] is String);
    assert(json[usernameKey] is String);
    assert(json[emailKey] is String);

    int id = json[idKey];
    String name = json[nameKey];
    String username = json[usernameKey];
    String email = json[emailKey];

    return User(id: id, name: name, username: username, email: email);
  }

  @override
  String toString() {
    return '''
User Information
ID: $id
Name: $name
Username: $username
Email: $email
''';
  }
}
