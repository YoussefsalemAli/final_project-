import 'package:flutter/material.dart';

class SocailLogin extends StatelessWidget {
  const SocailLogin({required this.name, required this.imagePath, super.key});
  final String name;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFF5F5F5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(imagePath),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Continue With $name',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
