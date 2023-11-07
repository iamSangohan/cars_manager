import 'package:flutter/material.dart';

class ApprovisForm extends StatefulWidget {
  const ApprovisForm({super.key});

  @override
  State<ApprovisForm> createState() => _ApprovisFormState();
}

class _ApprovisFormState extends State<ApprovisForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un approvisionnement'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Formulaire d\'ajout d\'un approvisionnement',
              style: TextStyle(fontSize: 20),
              // Centrer le texte
              textAlign: TextAlign.center,
              
            ),
            const SizedBox(height: 50),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Numero de la facture',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Quantite de carburant',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Montant de la facture',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            // Deux boutons pour valider ou annuler l'ajout
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // Width and height du bouton
                  width: 125,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text('Annuler'),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 125,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Valider'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}