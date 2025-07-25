import 'package:flutter/material.dart';

class CustomTextfromfield extends StatefulWidget {
  final String? lable;
  final bool isPassword;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  const CustomTextfromfield({
    this.isPassword = false,
    required this.lable,
    required this.controller,
    this.validator,
    super.key,
  });

  @override
  State<CustomTextfromfield> createState() => _CustomTextfromfieldState();
}

class _CustomTextfromfieldState extends State<CustomTextfromfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword,
      controller: widget.controller,
      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your ${widget.lable}';
            }
            return null;
          },
      decoration: InputDecoration(
        hintText: ' ${widget.lable}', // <- fix here: use `hintText` not `hint`
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
