import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles/app_colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.keyboardType,
    required this.isPassword,
  }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: Colors.transparent,
          ),
        ),
        fillColor: kcLightGreyColor,
        filled: true,
        labelText: label,
        hintText: hint,
      ),
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isPassword,
    );
  }
}
