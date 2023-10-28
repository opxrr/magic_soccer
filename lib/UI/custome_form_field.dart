import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);

class CustomFormField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;
  final MyValidator validator;
  final TextEditingController controller;

  CustomFormField({
    required this.label,
    required this.validator,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(

        labelStyle: TextStyle(
        color: Colors.white
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellowAccent, // Set the focused border color to gold
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.yellowAccent, // Set the enabled border color to gold
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        labelText: label,
      ),
      keyboardType: keyboardType,
      cursorColor: Colors.yellowAccent, // Set the cursor color to gold
      style: TextStyle(color: Colors.white),
    );
  }
}
