import 'package:cars_manager/app_screens/addIncident.dart';
import 'package:cars_manager/app_screens/detailIcident.dart';
import 'package:cars_manager/models/reparation.dart';
import 'package:cars_manager/services/api.dart';
import 'package:flutter/material.dart';

class IncidentIndex extends StatefulWidget {
  const IncidentIndex({super.key});

  @override
  State<IncidentIndex> createState() => _IncidentIndexState();
}

class _IncidentIndexState extends State<IncidentIndex> {
  APIService apiService = APIService();
  late Future<List<Reparation>> repairsList;

  @override
  void initState() {
    super.initState();
    repairsList = apiService.getAllRepairsByVehicle();
    // Mettre dans l'ordre decroissant
    repairsList = repairsList.then((value) => value.reversed.toList());
  }

  @override
  Widget build(BuildContext context) {
    // Listview vertical avec un builder
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const IncidentForm(),
          ));
        },
        label: const Text('Ajouter', style: TextStyle(color: Colors.black)),
        icon: const Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      appBar: AppBar(
        title: const Text('Liste des incidents'),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<List<Reparation>>(
        future: repairsList,
        builder: (BuildContext context, AsyncSnapshot<List<Reparation>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Reparation repair = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text('Incident ${repair.description}'),
                    subtitle: Text('Montant: ${repair.amount}'),
                    leading: const Icon(Icons.car_crash, color: Colors.black,),
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
      )
    );
  }
}