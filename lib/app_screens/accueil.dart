import 'package:flutter/material.dart';

class AccueilScreen extends StatelessWidget {
  const AccueilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            // Ligne avec les informations de l'utilisateur
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('NOM : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text("MENSAH Luc", style: TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            // Ligne avec les informations sur le vehicule de l'utilisateur
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Vehicule No : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text("AB-100-AB", style: TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Deux boutons de meme taille au centre avec une image dans chaque bouton pour Incidents et Approvisionnements
              Expanded(
                child: SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to second route when tapped.
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.car_repair, size: 40),
                          Text('Incidents', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to second route when tapped.
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.local_gas_station, size: 40),
                          Text('Approvisionnements', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]
      ),
    );
  }
}