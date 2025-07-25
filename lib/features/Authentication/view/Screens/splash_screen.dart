import 'dart:async';
import 'package:final_project/features/Authentication/view/Screens/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Core/Colors/all_colors.dart';
import 'package:final_project/features/Home/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String route = "/";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), checkAuth);
  }

  void checkAuth() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushReplacementNamed(context, HomeScreen.route);
    } else {
      Navigator.pushReplacementNamed(context, SignInScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: const Center(
        child: Image(
          image: AssetImage('assets/brand.png'),
          color: Colors.white,
        ),
      ),
    );
  }
}
