import 'package:flutter/material.dart';

class MaterielPage extends StatelessWidget {
  final List<Map<String, String>> materielLines;
  final List<Map<String, String>> additionalMaterielLines;
  final TextEditingController refSuppController;
  final TextEditingController desSuppController;
  final TextEditingController qteSuppController;
  final TextEditingController tvaSuppController;
  final VoidCallback onAddSuppMaterielLine;

  const MaterielPage({
    super.key,
    required this.materielLines,
    required this.additionalMaterielLines,
    required this.refSuppController,
    required this.desSuppController,
    required this.qteSuppController,
    required this.tvaSuppController,
    required this.onAddSuppMaterielLine,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Matériel intervention',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ...materielLines.map(
            (line) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Expanded(flex: 3, child: Text(line['Référence'] ?? '')),
                  Expanded(flex: 5, child: Text(line['Désignation'] ?? '')),
                  Expanded(flex: 1, child: Text(line['Qté'] ?? '')),
                  Expanded(flex: 1, child: Text(line['TVA'] ?? '')),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          Text(
            'Matériel supplémentaire',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ...additionalMaterielLines.map(
            (line) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Expanded(flex: 3, child: Text(line['Référence'] ?? '')),
                  Expanded(flex: 5, child: Text(line['Désignation'] ?? '')),
                  Expanded(flex: 1, child: Text(line['Qté'] ?? '')),
                  Expanded(flex: 1, child: Text(line['TVA'] ?? '')),
                ],
              ),
            ),
          ),
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
                      textAlign: TextAlign.left,
                      textCapitalization: TextCapitalization.sentences,
                      controller: refSuppController,
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
                      textAlign: TextAlign.left,
                      textCapitalization: TextCapitalization.sentences,
                      controller: desSuppController,
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
                      textAlign: TextAlign.left,
                      textCapitalization: TextCapitalization.sentences,
                      controller: qteSuppController,
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
                      textAlign: TextAlign.left,
                      textCapitalization: TextCapitalization.sentences,
                      controller: tvaSuppController,
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
          SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: Icon(Icons.add),
              label: Text('Ajouter'),
              onPressed: (refSuppController.text.trim().isNotEmpty ||
                      desSuppController.text.trim().isNotEmpty ||
                      qteSuppController.text.trim().isNotEmpty ||
                      tvaSuppController.text.trim().isNotEmpty)
                  ? onAddSuppMaterielLine
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}