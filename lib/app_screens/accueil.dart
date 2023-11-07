import 'package:cars_manager/app_screens/drawer.dart';
import 'package:cars_manager/app_screens/indexApprovis.dart';
import 'package:cars_manager/app_screens/indexIncident.dart';
import 'package:flutter/material.dart';

class AccueilScreen extends StatelessWidget {
  const AccueilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const FenetreNavigation(),
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            // Ligne avec les informations de l'utilisateur
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('NOM : ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text("MENSAH Luc", style: TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            // Ligne avec les informations sur le vehicule de l'utilisateur
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const IncidentIndex(),
                        ));
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ApprovisIndex(),
                        ));
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