import 'package:flutter/material.dart';

class Client extends StatelessWidget {
  final Map<String, TextEditingController> clientFacturationControllers;
  final Map<String, TextEditingController> clientInstallationControllers;
  final TextEditingController interventionNumController;
  final TextEditingController interventionDateController;
  final TextEditingController interventionHeureController;
  final String technicien;
  final ValueChanged<String?> onTechnicienChanged;
  final List<String> selectedTags;
  final ValueChanged<List<String>> onTagsChanged;
  final TextEditingController motifController;
  final TextEditingController noteController;
  final TextEditingController materielController;

  const Client({
    super.key,
    required this.clientFacturationControllers,
    required this.clientInstallationControllers,
    required this.interventionNumController,
    required this.interventionDateController,
    required this.interventionHeureController,
    required this.technicien,
    required this.onTechnicienChanged,
    required this.selectedTags,
    required this.onTagsChanged,
    required this.motifController,
    required this.noteController,
    required this.materielController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 400,
                child: ClientInfos(
                  'Facturation',
                  controllers: clientFacturationControllers,
                ),
              ),
              SizedBox(width: 32),
              SizedBox(
                width: 400,
                child: ClientInfos(
                  'Installation',
                  controllers: clientInstallationControllers,
                ),
              ),
            ],
          ),
          SizedBox(height: 48),
          InterventionInfos(
            numController: interventionNumController,
            dateController: interventionDateController,
            heureController: interventionHeureController,
            technicien: technicien,
            onTechnicienChanged: onTechnicienChanged,
            selectedTags: selectedTags,
            onTagsChanged: onTagsChanged,
            motifController: motifController,
            noteController: noteController,
            materielController: materielController,
          ),
        ],
      ),
    );
  }
}

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
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 32),
            ...fields.map(
              (field) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${field['label']} :'),
                    TextField(
                      controller: controllers[field['label']!],
                      decoration: InputDecoration(hintText: field['hint']),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InterventionInfos extends StatefulWidget {
  final TextEditingController numController;
  final TextEditingController dateController;
  final TextEditingController heureController;
  final String technicien;
  final ValueChanged<String?>? onTechnicienChanged;
  final List<String> selectedTags;
  final ValueChanged<List<String>> onTagsChanged;
  final TextEditingController motifController;
  final TextEditingController noteController;
  final TextEditingController materielController;
  const InterventionInfos({
    super.key,
    required this.numController,
    required this.dateController,
    required this.heureController,
    required this.technicien,
    required this.onTechnicienChanged,
    required this.selectedTags,
    required this.onTagsChanged,
    required this.motifController,
    required this.noteController,
    required this.materielController,
  });

  @override
  State<InterventionInfos> createState() => _InterventionInfosState();
}

class _InterventionInfosState extends State<InterventionInfos> {
  final List<String> allTags = [
    'Dépannage',
    'Maintenance',
    'Adaptation',
    'Installation',
    'Mise en sécurité',
    'Intrusion',
    'Incendie',
    'CCTV',
    "Contrôle d'accès",
    'Vidéophonie',
  ];
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
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
                        'Intervention Infos',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text('N* :'),
                      TextField(
                        controller: widget.numController,
                        decoration: InputDecoration(
                          hintText: 'Entrez le numéro',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text('Intervention date :'),
                      TextField(
                        controller: widget.dateController,
                        decoration: InputDecoration(
                          hintText: 'Entrez la date',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text('Heure :'),
                      TextField(
                        controller: widget.heureController,
                        decoration: InputDecoration(
                          hintText: 'Entrez l\'heure',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
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
                        'Technicien :',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: widget.technicien,
                        items: [
                          DropdownMenuItem(
                            value: 'Jean Dupont',
                            child: Text('Jean Dupont'),
                          ),
                          DropdownMenuItem(
                            value: 'Marie Martin',
                            child: Text('Marie Martin'),
                          ),
                          DropdownMenuItem(
                            value: 'Ali Ben',
                            child: Text('Ali Ben'),
                          ),
                        ],
                        onChanged: widget.onTechnicienChanged,
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
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Objet de l'intervention :",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  children: widget.selectedTags
                      .map(
                        (tag) => Chip(
                          label: Text(tag),
                          onDeleted: () {
                            final newTags = List<String>.from(
                              widget.selectedTags,
                            );
                            newTags.remove(tag);
                            widget.onTagsChanged(newTags);
                          },
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('Ajouter un objet'),
                  onPressed: () async {
                    final List<String> availableTags = allTags
                        .where((tag) => !widget.selectedTags.contains(tag))
                        .toList();
                    final List<String> tempSelected = [];
                    final List<String>? picked = await showDialog<List<String>>(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setStateDialog) {
                            return AlertDialog(
                              title: Text('Sélectionner des objets'),
                              content: SingleChildScrollView(
                                child: Column(
                                  children: availableTags
                                      .map(
                                        (tag) => CheckboxListTile(
                                          title: Text(tag),
                                          value: tempSelected.contains(tag),
                                          onChanged: (checked) {
                                            setStateDialog(() {
                                              if (checked == true) {
                                                tempSelected.add(tag);
                                              } else {
                                                tempSelected.remove(tag);
                                              }
                                            });
                                          },
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: Text('Annuler'),
                                  onPressed: () => Navigator.pop(context, null),
                                ),
                                ElevatedButton(
                                  child: Text('Valider'),
                                  onPressed: () =>
                                      Navigator.pop(context, tempSelected),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                    if (picked != null && picked.isNotEmpty) {
                      final newTags = List<String>.from(widget.selectedTags);
                      newTags.addAll(picked);
                      widget.onTagsChanged(newTags);
                    }
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: 32),
          // Motif de l'intervention
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Motif de l'intervention",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: widget.motifController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Saisir le motif de l'intervention",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 32),
          // Note intervention
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Note intervention",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: widget.noteController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Saisir une note sur l'intervention",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 32),
          // Matériel
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(24.0),
            margin: const EdgeInsets.symmetric(horizontal: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Matériel",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: widget.materielController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Saisir le matériel utilisé ou nécessaire",
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
