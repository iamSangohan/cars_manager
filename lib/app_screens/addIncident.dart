import 'package:flutter/material.dart';

class IncidentForm extends StatefulWidget {
  const IncidentForm({super.key});

  @override
  State<IncidentForm> createState() => _IncidentFormState();
}

class _IncidentFormState extends State<IncidentForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un incident'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Formulaire d\'ajout d\'une reparation',
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
                hintText: 'Reparation effectuee',
              ),
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 5,
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