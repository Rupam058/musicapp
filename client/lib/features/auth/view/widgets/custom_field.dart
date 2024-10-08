// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObsureText;

  const CustomField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isObsureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      controller: controller,
      obscureText: isObsureText,
      validator: (val) {
        if (val!.trim().isEmpty) {
          return '$hintText is missing !!!';
        }
        return null;
      },
    );
  }
}
