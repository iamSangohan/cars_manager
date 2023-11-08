import 'dart:convert';
import 'package:cars_manager/models/user.dart';
import 'package:http/http.dart' as http;


class APIService {
  final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  // User API 
  Future<User?> login(String email, String password) async {
    var response = await http.post(
      Uri.parse("$apiUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      })
    );

    if (response.statusCode == 200) {
      // Retourner un message de succès
      return jsonDecode(response.body);
    } else {
      // Retourner un message d'erreur
      return null;
    }
  }

  Future<User> getUser() async {
    final response = await http.get(Uri.parse("$apiUrl/user/client"));

    if (response.statusCode == 200) {
      final Map<String, dynamic> userMap = jsonDecode(response.body);
      final User user = User.fromJson(userMap);
      return user;
    } else {
      throw Exception('Failed to load user from API');
    }
  }
}