import 'package:flutter/material.dart';

class ClientInfos extends StatelessWidget {
  const ClientInfos(this.title, {super.key, required this.controllers});

  final String title;
  final Map<String, TextEditingController> controllers;
  final List<Map<String, String>> fields = const [
    {'label': 'Nom', 'hint': 'Entrez le nom'},
    {'label': 'Prénom', 'hint': 'Entrez le prénom'},
    {'label': 'Adresse', 'hint': 'Entrez l\'adresse'},
    {'label': 'Tel', 'hint': 'Entrez le téléphone'},
    {'label': 'GSM', 'hint': 'Entrez le GSM'},
    {'label': 'Email', 'hint': 'Entrez l\'email'},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            ...fields.map((field) => Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${field['label']} :'),
                  TextField(
                    controller: controllers[field['label']!],
                    decoration: InputDecoration(
                      hintText: field['hint'],
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
