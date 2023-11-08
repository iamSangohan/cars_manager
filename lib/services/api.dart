import 'dart:convert';
import 'package:cars_manager/constant.dart';
import 'package:cars_manager/models/user.dart';
import 'package:http/http.dart' as http;


class APIService {
  final String apiUrl = "http://192.168.1.78:3000";
  // 192.168.1.78
  // 3000
  
  // User API 
  Future<int> login(String email, String password) async {
    var response = await http.post(
      Uri.parse("$apiUrl/user/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      })
    );

    if (response.statusCode == 201) {
      try {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey('data') && jsonData['data'] != null) {
          final user = User.fromJson(jsonData['data']);
          currentUser = user; // Stockez l'utilisateur connecté dans la variable globale
          access_token = jsonData['access_token']; // Stockez le token d'authentification dans la variable globale
          return 201; // Code de succès
        } else {
          print("La clé 'data' est nulle ou inexistante dans la réponse JSON.");
          return 0; // Code d'erreur (ou tout autre code que vous préférez)
        }
      } catch (e) {
        print("Erreur de décodage JSON : $e");
        return 0; // Code d'erreur en cas d'échec du décodage JSON
      }
    } else {
      // La réponse est une erreur, vous pouvez analyser les détails d'erreur ici si nécessaire.
      print(response.body);

      return response.statusCode; // Renvoie le code d'état de la réponse de l'API.
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