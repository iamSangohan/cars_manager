// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'package:cars_manager/constant.dart';
import 'package:cars_manager/models/approvisionnement.dart';
import 'package:cars_manager/models/reparation.dart';
import 'package:cars_manager/models/user.dart';
import 'package:cars_manager/models/vehicule.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class APIService {
  final String apiUrl = 'http://api-mobile.yes-ivoire.com';
  // final String apiUrl = "http://192.168.1.78:3000";

  
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

          // Enregistrez le token d'authentification dans le SharedPreferences & l'id de l'utilisateur dans le SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', 'Bearer ${jsonData['access_token']}');
          await prefs.setString('user_id', user.id);
          await prefs.setString('username', '${user.firstName} ${user.lastName}');

          if (user.client != null) {
            // Le client existe, vous pouvez accéder à ses attributs comme ceci :
            String clientId = user.client!.id;
            String birthDate = user.client!.birthDate;
            int salary = user.client!.salary;
            String address = user.client!.adresse;
            // Enregistrez ces attributs dans SharedPreferences si nécessaire.
          } else {
            // Aucun client n'est présent, faites le traitement approprié ici.
          }

          // Recuperer le vehicule et ajouter son id et son immatriculation dans SharedPreferences
          try {
            Vehicule vehicule = await getVehicule();
            await prefs.setString('vehicule_id', vehicule.id);
            await prefs.setString('vehicule_immatriculation', vehicule.registration);
          } catch (e) {
            // Gérer l'exception, par exemple, afficher un message d'erreur ou prendre des mesures appropriées.
            print('Erreur lors de la récupération du véhicule : $e');
          }

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

  Future<Vehicule> getVehicule() async {
    // Recuperer l'id de l'utilisateur de SharedPreferences
    String user_id = await SharedPreferences.getInstance().then((prefs) => prefs.getString('user_id')!);

    final response = await http.get(
      Uri.parse("$apiUrl/vehicule/drive-user-vehicule/$user_id"),
      // Ajouter le token d'authentification dans le header de la requete
      headers: {
        "Authorization": await SharedPreferences.getInstance().then((prefs) => prefs.getString('access_token')!),
        "content-type": "application/json",
      },
    );
    
    if (response.statusCode == 200){
      // Convertir la réponse JSON en liste
      var jsonData = jsonDecode(response.body) as List<dynamic>;
      print(jsonData);
      // Vérifier si la liste n'est pas vide
      if (jsonData.isNotEmpty) {
        // Récupérer le dernier véhicule
        final vehiculeMap = jsonData.last;
        final vehicule = Vehicule.fromJson(vehiculeMap);
        return vehicule;
      } else {
        throw Exception('La liste est vide dans la réponse JSON.');
      }
    } else {
      throw Exception('Failed to load vehicule from API');
    }
  }


  Future<int> addProcurement(Approvisionnement approvisionnement) async {
    final response = await http.post(
      Uri.parse('$apiUrl/vehicule/procurement'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': await SharedPreferences.getInstance().then((prefs) => prefs.getString('access_token')!),
      },
      body: jsonEncode(approvisionnement.toJson()),
    );

    if (response.statusCode == 201) {
      // The procurement was added successfully
      return 200;
    } else {
      // There was an error adding the procurement
      throw Exception('Failed to add procurement');
    }
  }


  Future<int> addReparation(Reparation reparation) async {
    final response = await http.post(
      Uri.parse('$apiUrl/vehicule/repair'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': await SharedPreferences.getInstance().then((prefs) => prefs.getString('access_token')!),
      },
      body: jsonEncode(reparation.toJson()),
    );

    if (response.statusCode == 201) {
      // La reparation a été ajoutée avec succès
      return 200;
    } else {
      // Il y a eu une erreur lors de l'ajout de la reparation
      throw Exception('Failed to add reparation');
    }
  }


  Future<List<Approvisionnement>> getAllProcurementsByVehicle() async {
    // Récupérer l'id du véhicule de SharedPreferences
    String vehicleId = await SharedPreferences.getInstance().then((prefs) => prefs.getString('vehicule_id')!);
    
    final response = await http.get(
      Uri.parse('$apiUrl/vehicule/procurement-vehicule/$vehicleId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': await SharedPreferences.getInstance().then((prefs) => prefs.getString('access_token')!),
      },
    );

    if (response.statusCode == 200) {
      // Convertir la réponse JSON en liste
      var jsonData = jsonDecode(response.body) as List<dynamic>;

      // Vérifier si la liste n'est pas vide
      if (jsonData.isNotEmpty) {
        // Vérifier si le premier élément de la liste contient la clé 'data'
        final procurementsList = jsonData;
          List<Approvisionnement> procurements = [];
          for (var procurementMap in procurementsList) {
            final procurement = Approvisionnement.fromJson(procurementMap);
            procurements.add(procurement);
          }
          return procurements;
      } else {
        throw Exception('La liste est vide dans la réponse JSON.');
      }
    } else {
      throw Exception('Failed to load procurements from API');
    }
  }


  Future<List<Reparation>> getAllRepairsByVehicle() async {
    // Récupérer l'id du véhicule de SharedPreferences
    String vehicleId = await SharedPreferences.getInstance().then((prefs) => prefs.getString('vehicule_id')!);
    
    final response = await http.get(
      Uri.parse('$apiUrl/vehicule/repair-vehicule/$vehicleId'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': await SharedPreferences.getInstance().then((prefs) => prefs.getString('access_token')!),
      },
    );

    if (response.statusCode == 200) {
      // Convertir la réponse JSON en liste
      var jsonData = jsonDecode(response.body) as List<dynamic>;

      // Vérifier si la liste n'est pas vide
      if (jsonData.isNotEmpty) {
        final repairsList = jsonData;
          List<Reparation> repairs = [];
          for (var repairMap in repairsList) {
            final repair = Reparation.fromJson(repairMap);
            repairs.add(repair);
          }
          return repairs;
      } else {
        throw Exception('La liste est vide. Aucune réparation n\'a été effectuée sur ce véhicule.');
      }
    } else {
      throw Exception('Failed to load repairs from API');
    }
  }
}