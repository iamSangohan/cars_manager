import 'package:cars_manager/app_screens/addApprov.dart';
import 'package:cars_manager/app_screens/detailApprovis.dart';
import 'package:flutter/material.dart';

class ApprovisIndex extends StatefulWidget {
  const ApprovisIndex({super.key});

  @override
  State<ApprovisIndex> createState() => _ApprovisIndexState();
}

class _ApprovisIndexState extends State<ApprovisIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue[900],
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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('Approvisionnement $index'),
              subtitle: Text('Detail de l\'approvisionnement $index'),
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
      ),
    );
  }
}