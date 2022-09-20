import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.controller,
    required this.label,
    required this.keyboardType,
    required this.isPassword,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
      ),
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isPassword,
    );
  }
}
