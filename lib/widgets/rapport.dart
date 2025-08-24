import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:gestion_intervention/widgets/intervention.dart';

class Rapport extends StatelessWidget {
  final Map<String, TextEditingController> clientFacturationControllers;
  final Map<String, TextEditingController> clientInstallationControllers;
  final TextEditingController interventionNumController;
  final TextEditingController interventionDateController;
  final TextEditingController interventionHeureController;
  final String technicien;
  final List<String> selectedTags;
  final TextEditingController motifController;
  final TextEditingController noteController;
  final TextEditingController materielController;
  final TextEditingController panneController;
  final TextEditingController travailController;
  final TextEditingController referenceController;
  final TextEditingController designationController;
  final TextEditingController qteController;
  final TextEditingController tvaController;
  final ui.Image? signatureImage;
  final List<Map<String, String>> materielLines;
  final String entretienType;
  final Map<String, TextEditingController> entretienIntrusionControllers;
  final Map<String, TextEditingController> centraleControllers;
  final Map<String, TextEditingController> extension12Controllers;
  final Map<String, TextEditingController> extension34Controllers;
  final Map<String, TextEditingController> extension34TypeControllers;
  final Map<String, TextEditingController> extension34QteInitialeControllers;
  final Map<String, TextEditingController> extension34QteChangeeControllers;
  final Map<String, TextEditingController> extension12Value1Controllers;
  final Map<String, TextEditingController> extension12Value2Controllers;
  final Map<String, TextEditingController> extension34Value1Controllers;
  final Map<String, TextEditingController> extension34Value2Controllers;
  final TextEditingController extension34NecessiteController;

  const Rapport({
    super.key,
    required this.clientFacturationControllers,
    required this.clientInstallationControllers,
    required this.interventionNumController,
    required this.interventionDateController,
    required this.interventionHeureController,
    required this.technicien,
    required this.selectedTags,
    required this.motifController,
    required this.noteController,
    required this.materielController,
    required this.panneController,
    required this.travailController,
    required this.referenceController,
    required this.designationController,
    required this.qteController,
    required this.tvaController,
    this.signatureImage,
    required this.materielLines,
    required this.entretienType,
    required this.entretienIntrusionControllers,
    required this.centraleControllers,
    required this.extension12Controllers,
    required this.extension34Controllers,
    required this.extension34TypeControllers,
    required this.extension34QteInitialeControllers,
    required this.extension34QteChangeeControllers,
    required this.extension12Value1Controllers,
    required this.extension12Value2Controllers,
    required this.extension34Value1Controllers,
    required this.extension34Value2Controllers,
    required this.extension34NecessiteController,
  });

  Widget _buildReadOnlyField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 120, child: Text(label, style: TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(24.0),
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Facturation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ...clientFacturationControllers.entries.map((e) => _buildReadOnlyField(e.key, e.value.text)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Installation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ...clientInstallationControllers.entries.map((e) => _buildReadOnlyField(e.key, e.value.text)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(24.0),
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Intervention Infos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      _buildReadOnlyField('N*', interventionNumController.text),
                      _buildReadOnlyField('Date', interventionDateController.text),
                      _buildReadOnlyField('Heure', interventionHeureController.text),
                      _buildReadOnlyField('Technicien', technicien),
                      _buildReadOnlyField("Objet de l'intervention", selectedTags.join(', ')),
                      _buildReadOnlyField('Motif', motifController.text),
                      _buildReadOnlyField('Note', noteController.text),
                      _buildReadOnlyField('Matériel', materielController.text),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Text(
                              "Type d'entretien : ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(entretienType),
                          ],
                        ),
                      ),
                      if (entretienType == 'Entretien Intrusion') ...[
                        ...entretienIntrusionControllers.entries.map((entry) =>
                          _buildReadOnlyField(entry.key, entry.value.text)
                        ),
                        SizedBox(height: 18),
                        Text('Centrale', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ...centraleControllers.entries.map((entry) =>
                          _buildReadOnlyField(entry.key, entry.value.text)
                        ),
                        SizedBox(height: 18),
                        Text('Extension 1-2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            children: [
                              SizedBox(width: 200, child: Text('', style: TextStyle(fontWeight: FontWeight.bold))),
                              SizedBox(width: 120, child: Text('Valeur 1', style: TextStyle(fontWeight: FontWeight.bold))),
                              SizedBox(width: 120, child: Text('Valeur 2', style: TextStyle(fontWeight: FontWeight.bold))),
                            ],
                          ),
                        ),
                        ...Intervention.extension12Fields.map((field) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 200, child: Text(field['label']!, style: TextStyle(fontSize: 14))),
                              SizedBox(width: 8),
                              SizedBox(
                                width: 120,
                                child: Text(extension12Value1Controllers[field['label']!]?.text ?? '', textAlign: TextAlign.right),
                              ),
                              SizedBox(width: 8),
                              SizedBox(
                                width: 120,
                                child: Text(extension12Value2Controllers[field['label']!]?.text ?? '', textAlign: TextAlign.right),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(height: 18),
                        Text('Extension 3-4', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            children: [
                              SizedBox(width: 200, child: Text('', style: TextStyle(fontWeight: FontWeight.bold))),
                              SizedBox(width: 120, child: Text('Valeur 1', style: TextStyle(fontWeight: FontWeight.bold))),
                              SizedBox(width: 120, child: Text('Valeur 2', style: TextStyle(fontWeight: FontWeight.bold))),
                            ],
                          ),
                        ),
                        // All except Nécessité d'adaptation du système
                        ...Intervention.extension34Fields.where((field) => field['label'] != 'Nécessité d\'adaptation du système').map((field) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 200, child: Text(field['label']!, style: TextStyle(fontSize: 14))),
                              SizedBox(width: 8),
                              SizedBox(
                                width: 120,
                                child: Text(extension34Value1Controllers[field['label']!]?.text ?? '', textAlign: TextAlign.right),
                              ),
                              SizedBox(width: 8),
                              SizedBox(
                                width: 120,
                                child: Text(extension34Value2Controllers[field['label']!]?.text ?? '', textAlign: TextAlign.right),
                              ),
                            ],
                          ),
                        )),
                        // Nécessité d'adaptation du système (single input)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 200, child: Text('Nécessité d\'adaptation du système', style: TextStyle(fontSize: 14))),
                              SizedBox(width: 8),
                              SizedBox(
                                width: 120,
                                child: Text(extension34NecessiteController.text, textAlign: TextAlign.right),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Travail Infos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      _buildReadOnlyField('Panne', panneController.text),
                      _buildReadOnlyField('Travail Réalisé', travailController.text),
                      ...materielLines.map((line) => Row(
                        children: [
                          Expanded(child: _buildReadOnlyField('Référence', line['Référence'] ?? '')),
                          Expanded(child: _buildReadOnlyField('Désignation', line['Désignation'] ?? '')),
                          Expanded(child: _buildReadOnlyField('Qté', line['Qté'] ?? '')),
                          Expanded(child: _buildReadOnlyField('TVA', line['TVA'] ?? '')),
                        ],
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Signature', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 16),
                if (signatureImage != null)
                  Center(
                    child: SizedBox(
                      height: 150,
                      child: RawImage(image: signatureImage),
                    ),
                  )
                else
                  Center(child: Text('Aucune signature enregistrée')), // No signature
              ],
            ),
          ),
          if (entretienType == 'Entretien Intrusion') ...[
            SizedBox(height: 18),
            Text('Remplacement Extension 3-4', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                children: [
                  SizedBox(width: 200, child: Text('Type:', style: TextStyle(fontWeight: FontWeight.bold))),
                  SizedBox(width: 120, child: Text('Quantité initiale', style: TextStyle(fontWeight: FontWeight.bold))),
                  SizedBox(width: 120, child: Text('Quantité changée', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),
            ...Intervention.extension34RemplacementLabels.map((label) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(label, style: TextStyle(fontSize: 14)),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: extension34TypeControllers[label],
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: extension34QteInitialeControllers[label],
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: extension34QteChangeeControllers[label],
                      readOnly: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ],
      ),
    );
  }
}