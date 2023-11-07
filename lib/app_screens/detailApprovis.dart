import 'package:flutter/material.dart';

class ApprovDetail extends StatefulWidget {
  const ApprovDetail({super.key});

  @override
  State<ApprovDetail> createState() => _ApprovDetailState();
}

class _ApprovDetailState extends State<ApprovDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details de l\'approvisionnement'),
      ),
    );
  }
}