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
        label: const Text('Ajouter'),
        icon: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Liste des approvisionnements'),
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
                  child: ListTile(
                    title: Text('Approvisionnement ${procurement.invoice}'),
                    subtitle: Text('Quantité: ${procurement.quantity} - Montant: ${procurement.amount}'),
                    leading: const Icon(Icons.warning),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ApprovDetail(),
                      ));
                    },
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