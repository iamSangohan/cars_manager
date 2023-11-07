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
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Formulaire d\'ajout d\'un approvisionnement',
              style: TextStyle(fontSize: 20),
              // Centrer le texte
              textAlign: TextAlign.center,
              
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
            ),
          ],
        ),
      ),
    );
  }
}