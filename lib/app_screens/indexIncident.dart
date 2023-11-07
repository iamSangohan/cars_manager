import 'package:cars_manager/app_screens/addIncident.dart';
import 'package:cars_manager/app_screens/detailIcident.dart';
import 'package:flutter/material.dart';

class IncidentIndex extends StatefulWidget {
  const IncidentIndex({super.key});

  @override
  State<IncidentIndex> createState() => _IncidentIndexState();
}

class _IncidentIndexState extends State<IncidentIndex> {
  @override
  Widget build(BuildContext context) {
    // Listview vertical avec un builder
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const IncidentForm(),
          ));
        },
        label: const Text('Ajouter'),
        icon: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Liste des incidents'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Incident $index'),
              subtitle: Text('Description de l\'incident $index'),
              leading: const Icon(Icons.warning),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const IncidentDetail(),
                ));
              },
            ),
          );
        },
      ),
    );
  }
}