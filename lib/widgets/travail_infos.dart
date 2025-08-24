import 'package:flutter/material.dart';
import 'dart:math';

class TravailInfos extends StatelessWidget {
  final TextEditingController panneController;
  final TextEditingController travailController;
  final TextEditingController referenceController;
  final TextEditingController designationController;
  final TextEditingController qteController;
  final TextEditingController tvaController;
  final Widget? topWidget;
  const TravailInfos({
    super.key,
    required this.panneController,
    required this.travailController,
    required this.referenceController,
    required this.designationController,
    required this.qteController,
    required this.tvaController,
    this.topWidget,
  });

  @override
  Widget build(BuildContext context) {
    final int interventionNumber = getRandomInterventionNumber();
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (topWidget != null) topWidget!,
            Text(
              'Dépannage système détection intrusion',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Intervention n* $interventionNumber',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 32),
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
                        Text('Panne', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 16),
                        TextField(
                          controller: panneController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Décrire la panne...",
                            border: OutlineInputBorder(),
                          ),
                        ),
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
                        Text('Travail Réalisé', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 16),
                        TextField(
                          controller: travailController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            hintText: "Décrire le travail réalisé...",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Matériel', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Référence', style: TextStyle(fontSize: 14)),
                            SizedBox(height: 4),
                            TextField(
                              controller: referenceController,
                              decoration: InputDecoration(
                                hintText: 'Référence',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Désignation', style: TextStyle(fontSize: 14)),
                            SizedBox(height: 4),
                            TextField(
                              controller: designationController,
                              decoration: InputDecoration(
                                hintText: 'Désignation',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Qté', style: TextStyle(fontSize: 14)),
                            SizedBox(height: 4),
                            TextField(
                              controller: qteController,
                              decoration: InputDecoration(
                                hintText: 'Qté',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('TVA', style: TextStyle(fontSize: 14)),
                            SizedBox(height: 4),
                            TextField(
                              controller: tvaController,
                              decoration: InputDecoration(
                                hintText: 'TVA',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int getRandomInterventionNumber() {
    return 10000 + Random().nextInt(90000); // 5-digit random number
  }
}