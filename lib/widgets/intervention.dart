import 'package:flutter/material.dart';
import 'dart:math';

class Intervention extends StatelessWidget {
  final TextEditingController panneController;
  final TextEditingController travailController;
  final TextEditingController referenceController;
  final TextEditingController designationController;
  final TextEditingController qteController;
  final TextEditingController tvaController;
  final Widget? topWidget;
  final List<Map<String, String>> materielLines;
  final VoidCallback onAddMaterielLine;
  final String entretienType;
  final ValueChanged<String> onEntretienTypeChanged;
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
  final String technicien;
  final Map<String, TextEditingController> entretienIncendieControllers;
  final TextEditingController incendieQuantiteController;
  final TextEditingController incendieTypeController;
  final TextEditingController incendieAdaptationController;

  const Intervention({
    super.key,
    required this.panneController,
    required this.travailController,
    required this.referenceController,
    required this.designationController,
    required this.qteController,
    required this.tvaController,
    this.topWidget,
    required this.materielLines,
    required this.onAddMaterielLine,
    required this.entretienType,
    required this.onEntretienTypeChanged,
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
    required this.technicien,
    required this.entretienIncendieControllers,
    required this.incendieQuantiteController,
    required this.incendieTypeController,
    required this.incendieAdaptationController,
  });

  static final List<Map<String, String>> entretienIntrusionFields = [
    {'label': 'Disjoncteur séparé', 'hint': ''},
    {'label': 'Test d\'armement', 'hint': ''},
    {'label': 'Vérification et mise à l\'heure centrale', 'hint': ''},
    {'label': 'Vérification et essai claviers', 'hint': ''},
    {'label': 'Vérification et essai détecteurs', 'hint': ''},
    {'label': 'Vérification et essai détecteurs incendie', 'hint': ''},
    {'label': 'Vérification et essai sirène intérieure', 'hint': ''},
    {'label': 'Vérification et essai sirène et flash ext.', 'hint': ''},
    {'label': 'Vérification et essai bouton panique', 'hint': ''},
    {'label': 'Vérification et essai  de transmission', 'hint': ''},
    {'label': 'Vérification et essai processus d\'alarme', 'hint': ''},
    {'label': 'Vérification événements', 'hint': ''},
    {'label': 'Carnet entretien', 'hint': ''},
    {'label': 'Contrôle de présence de tension', 'hint': ''},
  ];

  static final List<Map<String, String>> centraleFields = [
    {'label': 'Tension de chargement (VDC)', 'hint': ''},
    {'label': 'Tension batterie sous charge (VDC)', 'hint': ''},
    {'label': 'Tension zones (VDC)', 'hint': ''},
    {'label': 'Cons. de chargement (mA)', 'hint': ''},
    {'label': 'Cons. Sans alimentation (mA)', 'hint': ''},
  ];

  static final List<Map<String, String>> extension12Fields = [
    {'label': 'Tension de charge (VDC)', 'hint': ''},
    {'label': 'Cons. Charge (mA)', 'hint': ''},
    {'label': 'Tension batterie (VDC)', 'hint': ''},
    {'label': 'Tension zones (VDC)', 'hint': ''},
    {'label': 'Cons. Repos (mA)', 'hint': ''},
  ];

  static final List<Map<String, String>> extension34Fields = [
    {'label': 'Tension de charge (VDC)', 'hint': ''},
    {'label': 'Tension batterie (VDC)', 'hint': ''},
    {'label': 'Tension zones (VDC)', 'hint': ''},
    {'label': 'Cons. Repos (mA)', 'hint': ''},
    {'label': 'Nécessité d\'adaptation du système', 'hint': ''},
  ];

  static final List<String> extension34RemplacementLabels = [
    'Rempl. batterie centrale',
    'Rempl. batterie ext 1',
    'Rempl. batterie ext 2',
    'Rempl. batterie ext 3',
    'Rempl. batterie ext 4',
    'Rempl. pile clavier',
    'Rempl. pile contact mag.',
    'Rempl. pile détecteur',
    'Rempl. pile détecteur inc.',
    'Rempl. pile sirène intérieure',
    'Rempl. pile/batt. sirène ext.',
    'Rempl. pile télécommande',
    'Rempl. batterie transmetteur',
  ];

  static final List<Map<String, String>> entretienIncendieFields = [
    {'label': 'Différentiel séparé', 'hint': ''},
    {'label': 'Disjoncteur séparé', 'hint': ''},
    {'label': 'Vérification et essai des détecteurs', 'hint': ''},
    {'label': 'Détecteurs de + 5ans', 'hint': ''},
    {'label': 'Accès dégagé aux déclencheurs', 'hint': ''},
    {'label': 'Vérification et essai des déclencheurs', 'hint': ''},
    {'label': 'Vérification et essai processus d\'alarme', 'hint': ''},
    {'label': 'Vérification et essai circuit électr. de la centrale', 'hint': ''},
    {'label': 'Examen visuel des connexions', 'hint': ''},
    {'label': 'Test coupure alim. et déclenchement', 'hint': ''},
    {'label': 'Vérification des événements', 'hint': ''},
    {'label': 'Modification date d\'échéance maintenance', 'hint': ''},
    {'label': 'Vérification du carnet entretien', 'hint': ''},
    {'label': 'Tension réseau (VAC)', 'hint': ''},
    {'label': 'Tension de chargement (VDC)', 'hint': ''},
    {'label': 'Tension sous charge (VDC)', 'hint': ''},
    {'label': 'Cons. De chargement (mA)', 'hint': ''},
    {'label': 'Cons. Sous charge (mA)', 'hint': ''},
    {'label': 'Cons. alarme (mA)', 'hint': ''},
  ];

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
                        Text(
                          'Panne',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                        Text(
                          'Travail Réalisé',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                  Text(
                    'Matériel',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ...materielLines.map(
                    (line) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(line['Référence'] ?? ''),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(line['Désignation'] ?? ''),
                          ),
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
                  SizedBox(height: 8),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      icon: Icon(Icons.add),
                      label: Text('Ajouter'),
                      onPressed: onAddMaterielLine,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            // NEW BLOCK AT THE BOTTOM
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final selected = await showDialog<String>(
                            context: context,
                            builder: (context) => SimpleDialog(
                              title: Text('Choisir le type d\'entretien'),
                              children: [
                                SimpleDialogOption(
                                  child: Text('Entretien Intrusion'),
                                  onPressed: () =>
                                      Navigator.pop(context, 'Entretien Intrusion'),
                                ),
                                SimpleDialogOption(
                                  child: Text('Entretien Incendie'),
                                  onPressed: () =>
                                      Navigator.pop(context, 'Entretien Incendie'),
                                ),
                              ],
                            ),
                          );
                          if (selected != null) {
                            onEntretienTypeChanged(selected);
                          }
                        },
                        child: Text(
                          entretienType.isEmpty
                              ? 'Choisir le type d\'entretien'
                              : entretienType,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(width: 32),
                      Text(
                        'Date: ${DateTime.now().day.toString().padLeft(2, '0')}/'
                        '${DateTime.now().month.toString().padLeft(2, '0')}/'
                        '${DateTime.now().year}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(width: 32),
                      Text(
                        'Technicien: $technicien',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  if (entretienType == 'Entretien Intrusion') ...[
                    ...entretienIntrusionFields.map((field) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              field['label']!,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.right,
                              controller: entretienIntrusionControllers[field['label']!],
                              decoration: InputDecoration(
                                hintText: field['hint'],
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(height: 18),
                    Text('Centrale', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    ...centraleFields.map((field) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              field['label']!,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.right,
                              controller: centraleControllers[field['label']!],
                              decoration: InputDecoration(
                                hintText: field['hint'],
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(height: 18),
                    Text('Extension 1-2', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        children: [
                          SizedBox(width: 208, child: Text('', style: TextStyle(fontWeight: FontWeight.bold))),
                          SizedBox(width: 120, child: Text('Valeur 1', style: TextStyle(fontWeight: FontWeight.bold))),
                          SizedBox(width: 120, child: Text('Valeur 2', style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    ...extension12Fields.map((field) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(field['label']!, style: TextStyle(fontSize: 14)),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            width: 120,
                            child: TextField(
                              controller: extension12Value1Controllers[field['label']!],
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
                              controller: extension12Value2Controllers[field['label']!],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              ),
                            ),
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
                          SizedBox(width: 208, child: Text('', style: TextStyle(fontWeight: FontWeight.bold))),
                          SizedBox(width: 120, child: Text('Valeur 1', style: TextStyle(fontWeight: FontWeight.bold))),
                          SizedBox(width: 120, child: Text('Valeur 2', style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    ...extension34Fields.where((field) => field['label'] != 'Nécessité d\'adaptation du système').map((field) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(field['label']!, style: TextStyle(fontSize: 14)),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            width: 120,
                            child: TextField(
                              controller: extension34Value1Controllers[field['label']!],
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
                              controller: extension34Value2Controllers[field['label']!],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              ),
                            ),
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
                          SizedBox(
                            width: 200,
                            child: Text('Nécessité d\'adaptation du système', style: TextStyle(fontSize: 14)),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            width: 120,
                            child: TextField(
                              controller: extension34NecessiteController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18),
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 200),
                          SizedBox(width: 8),
                          SizedBox(
                            width: 120,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Type:', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            width: 120,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Quantité initiale', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            width: 120,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Quantité changée', style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...extension34RemplacementLabels.map((label) => Padding(
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
                  // Only show these for Entretien Incendie:
                  if (entretienType == 'Entretien Incendie') ...[
                    ...entretienIncendieFields.map((field) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              field['label']!,
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.right,
                              controller: entretienIncendieControllers[field['label']!],
                              decoration: InputDecoration(
                                hintText: field['hint'],
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          alignment: Alignment.centerLeft,
                          child: Text('Quantité', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          width: 120,
                          child: TextField(
                            controller: incendieQuantiteController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Container(
                          width: 80,
                          alignment: Alignment.centerLeft,
                          child: Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(width: 8),
                        SizedBox(
                          width: 120,
                          child: TextField(
                            controller: incendieTypeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 200,
                          alignment: Alignment.centerLeft,
                          child: Text('Adaptation nécessaire du système', style: TextStyle(fontSize: 14)),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.right,
                            controller: incendieAdaptationController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
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
