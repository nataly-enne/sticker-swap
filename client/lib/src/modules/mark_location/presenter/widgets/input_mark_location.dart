import 'package:flutter/material.dart';

class InputMarkLocation extends StatelessWidget {

  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  InputMarkLocation({
    required this.hintText,
    required this.inputType,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xfff8f8f8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Colors.transparent, width: 1,),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Colors.transparent, width: 1,),
        ),
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
      ),
    );
  }
}
