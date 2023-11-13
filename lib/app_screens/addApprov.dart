import 'package:cars_manager/app_screens/indexApprovis.dart';
import 'package:cars_manager/models/approvisionnement.dart';
import 'package:cars_manager/services/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApprovisForm extends StatefulWidget {
  const ApprovisForm({super.key});

  @override
  State<ApprovisForm> createState() => _ApprovisFormState();
}

class _ApprovisFormState extends State<ApprovisForm> {
  TextEditingController invoiceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  late String vehiculeId;
  late String userId;

  @override
  void initState() {
    super.initState();
    initAsyncOperations();
  }

  Future<void> initAsyncOperations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      vehiculeId = prefs.getString('vehicule_id') ?? 'Aucun utilisateur';
      userId = prefs.getString('user_id') ?? 'Aucun vehicule';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un approvisionnement'),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
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
            TextField(
              controller: invoiceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Numero de la facture',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: quantityController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Quantite de carburant',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
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
                    onPressed: () {
                      invoiceController.clear();
                      quantityController.clear();
                      amountController.clear();
                    },
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
                    onPressed: () async {
                      // Get the values from the controllers
                      String invoice = invoiceController.text;
                      int quantity = int.parse(quantityController.text);
                      int amount = int.parse(amountController.text);

                      // Create an Approvisionnement object
                      
                      Approvisionnement approvisionnement = Approvisionnement(
                        invoice: invoice,
                        quantity: quantity,
                        amount: amount,
                        vehiculeId: vehiculeId, // Replace with the actual vehiculeId
                        userId: userId, // Replace with the actual userId
                      );

                      // Call the API to add the approvisionnement
                      APIService apiService = APIService();
                      try {
                        final result = await apiService.addProcurement(approvisionnement);
                        if(result == 200){
                          // Approvisionnement added successfully
                          // Show a snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Approvisionnement ajouté avec succès.'),
                            ),
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ApprovisIndex(),
                            ),
                          );
                        }
                        else{
                          // There was an error adding the approvisionnement
                          // Show a snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Erreur lors de l\'ajout de l\'approvisionnement.'),
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Erreur lors de l\'ajout de l\'approvisionnement.'),
                          ),
                        );
                      }
                    },
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