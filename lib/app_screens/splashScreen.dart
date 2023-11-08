import 'package:cars_manager/app_screens/accueil.dart';
import 'package:cars_manager/app_screens/login.dart';
import 'package:cars_manager/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  // Recuperer le token d'authentification de l'utilisateur
  String? token = access_token;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);   

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        // Route vers la page de connexion si l'utilisateur n'est pas connecté
        builder: (context) => widget.token == null ? const AccueilScreen() : const LoginScreen(),
      ));
    });
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
        width: double.infinity, // full width
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.green],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.car_crash_sharp,
              size: 80,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Cars Manager',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}