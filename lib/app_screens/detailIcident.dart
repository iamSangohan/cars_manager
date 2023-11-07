import 'package:flutter/material.dart';

class IncidentDetail extends StatefulWidget {
  const IncidentDetail({super.key});

  @override
  State<IncidentDetail> createState() => _IncidentDetailState();
}

class _IncidentDetailState extends State<IncidentDetail> {
  @override
  Widget build(BuildContext context) {
    // Afficher les details de l'incidents
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Details de l\'incident'),
      ),
    );
  }
}