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
        shadowColor: Colors.transparent,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 300.0,
            color: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                )
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    // Ligne avec les informations de l'utilisateur
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('NOM : ', 
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          color: Colors.white
                        )
                      ),
                      Text("MENSAH Luc", 
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          color: Colors.white
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    // Ligne avec les informations sur le vehicule de l'utilisateur
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Vehicule No : ', 
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          color: Colors.white
                        )
                      ),
                      Text("AB-100-AB", 
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          color: Colors.white
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 70),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Deux boutons de meme taille au centre avec une image dans chaque bouton pour Incidents et Approvisionnements
              SizedBox(
                height: 150,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                    ),
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
              const SizedBox(height: 20),
              SizedBox(
                height: 150,
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ApprovisIndex(),
                      ));
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_gas_station, size: 40),
                        Text('Approvisionnements', style: TextStyle(fontSize: 16)),
                      ],
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