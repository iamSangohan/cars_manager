import 'package:flutter/material.dart';
import 'package:cars_manager/app_screens/accueil.dart';
import 'package:cars_manager/app_screens/login.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    checkAuthenticationStatus();
  }

  Future<void> checkAuthenticationStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('access_token');

    // Delay the execution of the function for 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Vérifier si le token d'authentification existe
    if (accessToken != null) {
      // Rediriger vers l'écran d'accueil
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => AccueilScreen(),
      ));
    } else {
      // Rediriger vers l'écran de connexion
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ));
    }
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.yellow
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ajouter une image comme logo
            Image(
              image: AssetImage('assets/images/logo_taxi.png'),
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}
