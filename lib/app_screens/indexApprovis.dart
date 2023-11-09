import 'package:cars_manager/app_screens/addApprov.dart';
import 'package:cars_manager/app_screens/detailApprovis.dart';
import 'package:cars_manager/models/approvisionnement.dart';
import 'package:cars_manager/services/api.dart';
import 'package:flutter/material.dart';

class ApprovisIndex extends StatefulWidget {
  const ApprovisIndex({super.key});

  @override
  State<ApprovisIndex> createState() => _ApprovisIndexState();
}

class _ApprovisIndexState extends State<ApprovisIndex> {
  APIService apiService = APIService();
  late Future<List<Approvisionnement>> procurementsList;

  @override
  void initState() {
    super.initState();
    procurementsList = apiService.getAllProcurementsByVehicle();
    // Mettre dans l'ordre decroissant
    procurementsList = procurementsList.then((value) => value.reversed.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const ApprovisForm(),
          ));
        },
        label: const Text('Ajouter', style: TextStyle(color: Colors.black)),
        icon: const Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.yellow,
      ),
      appBar: AppBar(
        title: const Text('Liste des approvisionnements'),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Approvisionnement>>(
        future: procurementsList,
        builder: (BuildContext context, AsyncSnapshot<List<Approvisionnement>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Approvisionnement procurement = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text('Approvisionnement ${procurement.invoice}'),
                    subtitle: Text('Quantité: ${procurement.quantity} - Montant: ${procurement.amount}'),
                    leading: const Icon(Icons.local_gas_station, color: Colors.black),
                    onTap: () {},
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}