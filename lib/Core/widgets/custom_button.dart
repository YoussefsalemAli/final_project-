import 'package:final_project/Core/Colors/all_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 56,
    this.onPressed,
  });
  final String title;
  final void Function()? onPressed;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Text(title, style: TextStyle(fontSize: 17, color: Colors.white)),
      ),
    );
  }
}