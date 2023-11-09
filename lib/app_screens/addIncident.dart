import 'package:cars_manager/app_screens/indexIncident.dart';
import 'package:cars_manager/models/reparation.dart';
import 'package:cars_manager/services/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncidentForm extends StatefulWidget {
  const IncidentForm({super.key});

  @override
  State<IncidentForm> createState() => _IncidentFormState();
}

class _IncidentFormState extends State<IncidentForm> {
  TextEditingController invoiceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
              controller: descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Reparation effectuee',
              ),
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 5,
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
                    onPressed: () {
                      // Get the values from the controllers
                      String invoice = invoiceController.text;
                      String description = descriptionController.text;
                      double amount = double.parse(amountController.text);

                      // Create an Approvisionnement object
                      
                      Reparation reparation = Reparation(
                        invoice: invoice,
                        description: description,
                        amount: amount,
                        vehiculeId: vehiculeId,
                        userId: userId,
                      );

                      // Call the API to add the approvisionnement
                      APIService apiService = APIService();
                      try {
                        final result =  apiService.addReparation(reparation);
                        if(result == 200){
                          // Approvisionnement added successfully
                          // Show a snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Reparation ajoutée avec succès.'),
                            ),
                          );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const IncidentIndex(),
                            ),
                          );
                        }
                        else{
                          // There was an error adding the approvisionnement
                          // Show a snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Erreur lors de l\'ajout de la reparation.'),
                            ),
                          );
                        }
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Erreur lors de l\'ajout de la reparation.'),
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