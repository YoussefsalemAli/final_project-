import 'package:final_project/Core/widgets/custom_button.dart';
import 'package:final_project/features/Authentication/controller/async_auth_provider.dart';
import 'package:final_project/features/Authentication/view/Widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});
   static String route = "/rest_password_screen";

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _sent = false;

  Future<void> _reset() async {
    final success = await ref.read(asyncAuthProvider.notifier).resetPassword(
          email: _emailController.text.trim(),
        );
    if (success) {
      setState(() {
        _sent = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Check your email to reset your password.")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to send reset email.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextfromfield(
              controller: _emailController,
             lable: 'Enter Your Email',
            ),
            const SizedBox(height: 20),
            CustomButton(
              onPressed: _reset,
              title: 'Send',
            ),
            if (_sent)
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "Reset link sent! Check your inbox.",
                  style: TextStyle(color: Colors.green),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
