import 'package:cars_manager/app_screens/drawer.dart';
import 'package:cars_manager/app_screens/indexApprovis.dart';
import 'package:cars_manager/app_screens/indexIncident.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AccueilScreen extends StatefulWidget {
  @override
  _AccueilScreenState createState() => _AccueilScreenState();
}


class _AccueilScreenState extends State<AccueilScreen> {
  late String nomPrenom;
  late String matricule;

  @override
  void initState() {
    super.initState();
    initAsyncOperations();
  }

  Future<void> initAsyncOperations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      nomPrenom = prefs.getString('username') ?? 'Aucun utilisateur';
      matricule = prefs.getString('vehicule_immatriculation') ?? 'Aucun vehicule';
    });
  }


  @override
  Widget build(BuildContext context) {
    // Votre code de construction reste inchangé
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
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    // Ligne avec les informations de l'utilisateur
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('NOM : ', 
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          color: Colors.white
                        )
                      ),
                      Text(
                        nomPrenom,
                        style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    // Ligne avec les informations sur le vehicule de l'utilisateur
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Vehicule No : ', 
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          fontSize: 24,
                          fontFamily: 'Roboto',
                          color: Colors.white
                        )
                      ),
                      Text(
                        matricule, 
                        style: const TextStyle(
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
                    // Desactiver le bouton si aucun vehicule
                    onPressed: matricule == 'Aucun vehicule' ? null : () {
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
                    onPressed: matricule == 'Aucun vehicule' ? null : (() {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ApprovisIndex(),
                      ));
                    }),
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