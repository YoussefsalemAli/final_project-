import 'package:flutter/material.dart';

class CustomPasswordTextfromfield extends StatefulWidget {
  final String? lable;
  final TextEditingController passwordController;
  final FormFieldValidator<String>? validator;

  const CustomPasswordTextfromfield({
    required this.lable,
    required this.passwordController,
    this.validator,
    super.key,
  });

  @override
  State<CustomPasswordTextfromfield> createState() =>
      _CustomPasswordTextfromfieldState();
}

class _CustomPasswordTextfromfieldState
    extends State<CustomPasswordTextfromfield> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscured,
      controller: widget.passwordController,
      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your ${widget.lable}';
            }
            return null;
          },
      decoration: InputDecoration(
        hintText: 'Enter Your ${widget.lable}',
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
          icon: Icon(
            isObscured ? Icons.visibility_off : Icons.visibility,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
