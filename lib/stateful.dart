import 'package:flutter/material.dart';

class SingleCheckbox extends StatefulWidget {
  @override
  _SingleCheckboxState createState() => _SingleCheckboxState();
}

class _SingleCheckboxState extends State<SingleCheckbox> {
  bool _isChecked = false; // State to store checkbox value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckboxItem(
        isChecked: _isChecked,
        onChecked: (bool? value) {
          setState(() {
            _isChecked = value ?? false;
          });
        },
      ),
    );
  }
}

class CheckboxItem extends StatelessWidget {
  final bool isChecked;
  final Function(bool?)? onChecked;

  CheckboxItem({
    required this.isChecked,
    required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: onChecked,
          ),
        ],
      ),
    );
  }
}