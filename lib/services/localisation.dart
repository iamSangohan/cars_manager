import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void getLocationAndSend() async {
  // Vérifier si la permission de localisation est accordée
  LocationPermission permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    // Si la permission est refusée, demander la permission
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Si l'utilisateur refuse la permission, retourner
      return;
    }
  }

  // Récupérer la position actuelle du téléphone
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);

  // Envoyer la position via l'API
  String apiUrl = 'http://api-mobile.yes-ivoire.com/vehicule/location';
  // String apiUrl = 'http://192.168.1.78:3000/vehicule/location';

  // Recuperer vehicule_id et user_id
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String vehicleId = prefs.getString('vehicule_id')!;
  String userId = prefs.getString('user_id')!;

  // Formatage de la donnee
  Map<String, String> data = {
    'userId': userId,
    'vehiculeId': vehicleId,
    'longitude': position.longitude.toString(),
    'latitude': position.latitude.toString(),
  };

  var response = await http.post(
    Uri.parse(apiUrl), 
    headers: {
      'Accept': 'application/json',
      'Authorization': prefs.getString('access_token')!,
    },
    body: data
  );

  // print(response.statusCode);

  if (response.statusCode == 201) {
    // La position a été envoyée avec succès
    // print(response);
    print('Position envoyée avec succès');
    // Attendre 5 minutes avant d'appeler à nouveau la fonction
    Future.delayed(const Duration(seconds: 10), getLocationAndSend);
  } else {
    // Il y a eu une erreur lors de l'envoi de la position
    // print('Erreur lors de l\'envoi de la position');
  }
}