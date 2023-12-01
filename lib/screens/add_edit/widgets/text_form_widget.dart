import 'package:flutter/material.dart';

class TextFormItem extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const TextFormItem({
    Key? key,
    required this.label,
    required this.controller,
    required this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      validator: validator,
    );
  }
}
