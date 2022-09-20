// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextInputAction? textInputAction = TextInputAction.next;

  TextEditingController? controller;

  final int maxLine;
  IconData icon;
  String labelText;

  CustomTextFormField({
    Key? key,
    this.textInputAction,
    required this.controller,
    required this.maxLine,
    required this.icon,
    required this.labelText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      textInputAction: textInputAction,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.all(5),
        prefixIcon: Icon(
          icon,
          size: 30,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.amber,
            width: 2,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
