import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:gestion_intervention/widgets/client.dart';
import 'package:gestion_intervention/widgets/rapport.dart';
import 'package:gestion_intervention/widgets/signature.dart';
import 'package:gestion_intervention/widgets/intervention.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Client Infos controllers
  final Map<String, TextEditingController> clientFacturationControllers = {
    'Nom': TextEditingController(),
    'Prénom': TextEditingController(),
    'Adresse': TextEditingController(),
    'Tel': TextEditingController(),
    'GSM': TextEditingController(),
    'Email': TextEditingController(),
  };
  final Map<String, TextEditingController> clientInstallationControllers = {
    'Nom': TextEditingController(),
    'Prénom': TextEditingController(),
    'Adresse': TextEditingController(),
    'Tel': TextEditingController(),
    'GSM': TextEditingController(),
    'Email': TextEditingController(),
  };

  // Intervention Infos controllers/state
  final TextEditingController interventionNumController =
      TextEditingController();
  final TextEditingController interventionDateController =
      TextEditingController();
  final TextEditingController interventionHeureController =
      TextEditingController();
  String technicien = 'Jean Dupont';
  List<String> selectedTags = [];

  // Motif, Note, Materiel
  final TextEditingController motifController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController materielController = TextEditingController();

  // Travail Infos controllers
  final TextEditingController panneController = TextEditingController();
  final TextEditingController travailController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController qteController = TextEditingController();
  final TextEditingController tvaController = TextEditingController();

  // Signature image state
  ui.Image? _signatureImage;

  void _onSignatureValidated(ui.Image image) {
    setState(() {
      _signatureImage = image;
    });
  }

  List<Map<String, String>> materielLines = [];

  void _addMaterielLine() {
    setState(() {
      materielLines.add({
        'Référence': referenceController.text,
        'Désignation': designationController.text,
        'Qté': qteController.text,
        'TVA': tvaController.text,
      });
      referenceController.clear();
      designationController.clear();
      qteController.clear();
      tvaController.clear();
    });
  }

  // Add entretienType state to _MyHomePageState:
  String entretienType = '';

  // Add handler:
  void _onEntretienTypeChanged(String value) {
    setState(() {
      entretienType = value;
    });
  }

  // Add controllers for entretien fields in _MyHomePageState:
  final Map<String, TextEditingController> entretienIntrusionControllers = {
    'Disjoncteur séparé': TextEditingController(),
    'Test d\'armement': TextEditingController(),
    'Vérification et mise à l\'heure centrale': TextEditingController(),
    'Vérification et essai claviers': TextEditingController(),
    'Vérification et essai détecteurs': TextEditingController(),
    'Vérification et essai détecteurs incendie': TextEditingController(),
    'Vérification et essai sirène intérieure': TextEditingController(),
    'Vérification et essai sirène et flash ext.': TextEditingController(),
    'Vérification et essai bouton panique': TextEditingController(),
    'Vérification et essai  de transmission': TextEditingController(),
    'Vérification et essai processus d\'alarme': TextEditingController(),
    'Vérification événements': TextEditingController(),
    'Carnet entretien': TextEditingController(),
    'Contrôle de présence de tension': TextEditingController(),
  };
  final Map<String, TextEditingController> centraleControllers = {
    'Tension de chargement (VDC)': TextEditingController(),
    'Tension batterie sous charge (VDC)': TextEditingController(),
    'Tension zones (VDC)': TextEditingController(),
    'Cons. de chargement (mA)': TextEditingController(),
    'Cons. Sans alimentation (mA)': TextEditingController(),
  };

  // Add controllers for Extension 1-2 and Extension 3-4 in _MyHomePageState:
  final Map<String, TextEditingController> extension12Controllers = {
    'Tension de charge (VDC)': TextEditingController(),
    'Cons. Charge (mA)': TextEditingController(),
    'Tension batterie (VDC)': TextEditingController(),
    'Tension zones (VDC)': TextEditingController(),
    'Cons. Repos (mA)': TextEditingController(),
  };
  final Map<String, TextEditingController> extension34Controllers = {
    'Tension de charge (VDC)': TextEditingController(),
    'Tension batterie (VDC)': TextEditingController(),
    'Tension zones (VDC)': TextEditingController(),
    'Cons. Repos (mA)': TextEditingController(),
    'Nécessité d\'adaptation du système': TextEditingController(),
  };

  // Add in _MyHomePageState:
  final Map<String, TextEditingController> extension34TypeControllers = {
    for (var label in Intervention.extension34RemplacementLabels)
      label: TextEditingController(),
  };
  final Map<String, TextEditingController> extension34QteInitialeControllers = {
    for (var label in Intervention.extension34RemplacementLabels)
      label: TextEditingController(),
  };
  final Map<String, TextEditingController> extension34QteChangeeControllers = {
    for (var label in Intervention.extension34RemplacementLabels)
      label: TextEditingController(),
  };

  final Map<String, TextEditingController> extension12Value1Controllers = {
    'Tension de charge (VDC)': TextEditingController(),
    'Cons. Charge (mA)': TextEditingController(),
    'Tension batterie (VDC)': TextEditingController(),
    'Tension zones (VDC)': TextEditingController(),
    'Cons. Repos (mA)': TextEditingController(),
  };
  final Map<String, TextEditingController> extension12Value2Controllers = {
    'Tension de charge (VDC)': TextEditingController(),
    'Cons. Charge (mA)': TextEditingController(),
    'Tension batterie (VDC)': TextEditingController(),
    'Tension zones (VDC)': TextEditingController(),
    'Cons. Repos (mA)': TextEditingController(),
  };
  final Map<String, TextEditingController> extension34Value1Controllers = {
    'Tension de charge (VDC)': TextEditingController(),
    'Tension batterie (VDC)': TextEditingController(),
    'Tension zones (VDC)': TextEditingController(),
    'Cons. Repos (mA)': TextEditingController(),
  };
  final Map<String, TextEditingController> extension34Value2Controllers = {
    'Tension de charge (VDC)': TextEditingController(),
    'Tension batterie (VDC)': TextEditingController(),
    'Tension zones (VDC)': TextEditingController(),
    'Cons. Repos (mA)': TextEditingController(),
  };
  final TextEditingController extension34NecessiteController =
      TextEditingController();

  final Map<String, TextEditingController> entretienIncendieControllers = {
    'Différentiel séparé': TextEditingController(),
    'Disjoncteur séparé': TextEditingController(),
    'Vérification et essai des détecteurs': TextEditingController(),
    'Détecteurs de + 5ans': TextEditingController(),
    'Accès dégagé aux déclencheurs': TextEditingController(),
    'Vérification et essai des déclencheurs': TextEditingController(),
    'Vérification et essai processus d\'alarme': TextEditingController(),
    'Vérification et essai circuit électr. de la centrale':
        TextEditingController(),
    'Examen visuel des connexions': TextEditingController(),
    'Test coupure alim. et déclenchement': TextEditingController(),
    'Vérification des événements': TextEditingController(),
    'Modification date d\'échéance maintenance': TextEditingController(),
    'Vérification du carnet entretien': TextEditingController(),
    'Tension réseau (VAC)': TextEditingController(),
    'Tension de chargement (VDC)': TextEditingController(),
    'Tension sous charge (VDC)': TextEditingController(),
    'Cons. De chargement (mA)': TextEditingController(),
    'Cons. Sous charge (mA)': TextEditingController(),
    'Cons. alarme (mA)': TextEditingController(),
  };
  final TextEditingController incendieQuantiteController =
      TextEditingController();
  final TextEditingController incendieTypeController = TextEditingController();
  final TextEditingController incendieAdaptationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Center(child: Image.asset('assets/logo.png', height: 60)),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Client'),
                Tab(text: 'Intervention'),
                Tab(text: 'Signature'),
                Tab(text: 'Rapport'),
              ],
              indicator: BoxDecoration(color: Colors.blue[100]),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.black, // Selected tab text color
              unselectedLabelColor: Colors.black54, // Unselected tab text color
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 24),
                    Client(
                      clientFacturationControllers:
                          clientFacturationControllers,
                      clientInstallationControllers:
                          clientInstallationControllers,
                      interventionNumController: interventionNumController,
                      interventionDateController: interventionDateController,
                      interventionHeureController: interventionHeureController,
                      technicien: technicien,
                      onTechnicienChanged: (val) =>
                          setState(() => technicien = val!),
                      selectedTags: selectedTags,
                      onTagsChanged: (tags) =>
                          setState(() => selectedTags = tags),
                      motifController: motifController,
                      noteController: noteController,
                      materielController: materielController,
                    ),
                  ],
                ),
              ),
              Intervention(
                panneController: panneController,
                travailController: travailController,
                referenceController: referenceController,
                designationController: designationController,
                qteController: qteController,
                tvaController: tvaController,
                topWidget: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Client Infos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      ...clientInstallationControllers.entries.map(
                        (entry) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text('${entry.key}: ${entry.value.text}'),
                        ),
                      ),
                    ],
                  ),
                ),
                materielLines: materielLines,
                onAddMaterielLine: _addMaterielLine,
                entretienType: entretienType,
                onEntretienTypeChanged: _onEntretienTypeChanged,
                entretienIntrusionControllers: entretienIntrusionControllers,
                centraleControllers: centraleControllers,
                extension12Controllers: extension12Controllers,
                extension34Controllers: extension34Controllers,
                extension34TypeControllers: extension34TypeControllers,
                extension34QteInitialeControllers:
                    extension34QteInitialeControllers,
                extension34QteChangeeControllers:
                    extension34QteChangeeControllers,
                extension12Value1Controllers: extension12Value1Controllers,
                extension12Value2Controllers: extension12Value2Controllers,
                extension34Value1Controllers: extension34Value1Controllers,
                extension34Value2Controllers: extension34Value2Controllers,
                extension34NecessiteController: extension34NecessiteController,
                technicien: technicien,
                entretienIncendieControllers: entretienIncendieControllers,
                incendieQuantiteController: incendieQuantiteController,
                incendieTypeController: incendieTypeController,
                incendieAdaptationController: incendieAdaptationController,
              ),
              SignatureWidget(onSignatureValidated: _onSignatureValidated),
              Rapport(
                clientFacturationControllers: clientFacturationControllers,
                clientInstallationControllers: clientInstallationControllers,
                interventionNumController: interventionNumController,
                interventionDateController: interventionDateController,
                interventionHeureController: interventionHeureController,
                technicien: technicien,
                selectedTags: selectedTags,
                motifController: motifController,
                noteController: noteController,
                materielController: materielController,
                panneController: panneController,
                travailController: travailController,
                referenceController: referenceController,
                designationController: designationController,
                qteController: qteController,
                tvaController: tvaController,
                signatureImage: _signatureImage,
                materielLines: materielLines,
                entretienType: entretienType,
                entretienIntrusionControllers: entretienIntrusionControllers,
                centraleControllers: centraleControllers,
                extension12Controllers: extension12Controllers,
                extension34Controllers: extension34Controllers,
                extension34TypeControllers: extension34TypeControllers,
                extension34QteInitialeControllers:
                    extension34QteInitialeControllers,
                extension34QteChangeeControllers:
                    extension34QteChangeeControllers,
                extension12Value1Controllers: extension12Value1Controllers,
                extension12Value2Controllers: extension12Value2Controllers,
                extension34Value1Controllers: extension34Value1Controllers,
                extension34Value2Controllers: extension34Value2Controllers,
                extension34NecessiteController: extension34NecessiteController,
                entretienIncendieControllers: entretienIncendieControllers,
                incendieQuantiteController: incendieQuantiteController,
                incendieTypeController: incendieTypeController,
                incendieAdaptationController: incendieAdaptationController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
