import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String placeholder;
  final bool notSowText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.icon,
    required this.notSowText,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey))),
      child: TextFormField(
        controller: controller,
        obscureText: notSowText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white60,
          border: InputBorder.none,
          hintText: placeholder,
          icon: Icon(icon),
          hintStyle: TextStyle(
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
