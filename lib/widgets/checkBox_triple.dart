import 'package:flutter/material.dart';

enum TripleCheckState { unchecked, checked, notVerified }

class TripleCheckBox extends StatelessWidget {
  final TripleCheckState value;
  final ValueChanged<TripleCheckState> onChanged;

  const TripleCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color;
    switch (value) {
      case TripleCheckState.checked:
        icon = Icons.check_box;
        color = Colors.green;
        break;
      case TripleCheckState.notVerified:
        icon = Icons.indeterminate_check_box;
        color = Colors.red;
        break;
      case TripleCheckState.unchecked:
      default:
        icon = Icons.check_box_outline_blank;
        color = Colors.grey;
        break;
    }
    return IconButton(
      icon: Icon(icon, color: color, size: 28),
      onPressed: () {
        TripleCheckState next;
        if (value == TripleCheckState.unchecked) {
          next = TripleCheckState.checked;
        } else if (value == TripleCheckState.checked) {
          next = TripleCheckState.notVerified;
        } else {
          next = TripleCheckState.unchecked;
        }
        onChanged(next);
      },
      tooltip: value == TripleCheckState.checked
          ? 'OK'
          : value == TripleCheckState.notVerified
              ? 'Non vérifié'
              : 'Non coché',
    );
  }
}