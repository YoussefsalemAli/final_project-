import 'package:final_project/features/Authentication/controller/async_auth_provider.dart';
import 'package:final_project/Core/Colors/all_colors.dart';
import 'package:final_project/features/Authentication/view/Screens/rest_password.dart';
import 'package:final_project/features/Authentication/view/Screens/sign_up_screen.dart';
import 'package:final_project/Core/widgets/custom_button.dart';
import 'package:final_project/features/Authentication/view/Widgets/custom_pass_text_form_field.dart';
import 'package:final_project/features/Authentication/view/Widgets/custom_text_from_field.dart';
import 'package:final_project/features/Home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SignInScreen extends ConsumerStatefulWidget {
  static String route = "/sign_in_Screen";
  const SignInScreen({super.key});
  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final trimmedEmail = _emailController.text.trim();
    final trimmedPassword = _passwordController.text.trim();
    final asyncAuthState = ref.watch(asyncAuthProvider);
    return Scaffold(
      backgroundColor: backgorundColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  SizedBox(height: 4),
                  Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  CustomTextfromfield(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an Email Address';
                      }
                      return null;
                    },
                    lable: 'Email Address',
                  ),
                  CustomPasswordTextfromfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    passwordController: _passwordController,
                    lable: 'Password',
                  ),
                  if (asyncAuthState.isLoading)
                    Center(child: CircularProgressIndicator())
                  else
                   CustomButton(title: 'Log in',onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final result = await ref
                              .read(asyncAuthProvider.notifier)
                              .loginUser(
                                email: trimmedEmail,
                                password: trimmedPassword,
                              );
                         
                          // context.mounted is used to check if the widget has context after teh future finishes
                          // when you access context in an async method like this make sure to check ( context.mounted )

                          if (context.mounted) {
                            if (result) {
                              Navigator.pushReplacementNamed(
                                context,
                                HomeScreen.route,
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                    'Something went wrong:${asyncAuthState.error} ',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          }
                        }
                      },)
                ],
              ),
            ),
            Row(
              children: [
                Text('Dont have an Account ?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.route);
                  },
                  child: Text(
                    'Create One',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Forgot Your Password?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ForgotPasswordScreen.route);
                  },
                  child: Text(
                    'RestPassword',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
