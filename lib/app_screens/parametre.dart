import 'package:cars_manager/app_screens/drawer.dart';
import 'package:flutter/material.dart';

// Parametre de l'application (mot de passe, photo de profil, etc...)
class ParametreScreen extends StatefulWidget {
  const ParametreScreen({super.key});

  @override
  State<ParametreScreen> createState() => _ParametreScreenState();
}

class _ParametreScreenState extends State<ParametreScreen> {
  @override
  Widget build(BuildContext context) {
    // UI de la page Parametre
    return Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Parametre'),
      ),
    );
  }
}