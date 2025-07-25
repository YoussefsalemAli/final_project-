import 'package:final_project/Core/widgets/back_arrwo.dart';
import 'package:final_project/features/Authentication/controller/async_auth_provider.dart';
import 'package:final_project/features/Authentication/view/Screens/sign_in_screen.dart';
import 'package:final_project/Core/widgets/custom_button.dart';
import 'package:final_project/features/Authentication/view/Widgets/custom_text_from_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static String route = '/Sign_up_Screen';
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    final asyncAuthState = ref.watch(asyncAuthProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
    leading: BackArrow(
      onPressed: ()=>Navigator.pop(context),
    ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextfromfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an FirstName';
                      }
                      return null;
                    },
                    lable: 'DisplayName',
                    controller: _displayNameController,
                  ),
                  SizedBox(height: 10),
                  
                  SizedBox(height: 10),
                  CustomTextfromfield(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an Email Address';
                      }
                      return null;
                    },
                    lable: 'Email Address',
                    controller: _emailController,
                  ),
                  SizedBox(height: 10),
                  CustomTextfromfield(
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    lable: 'Password',
                  ),
                  SizedBox(height: 10),
                  CustomTextfromfield(
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    lable: 'Confirm Password',
                    controller: _passwordConfirmController,
                  ),
                  SizedBox(height: 10),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  if (asyncAuthState.isLoading)
                    Center(child: CircularProgressIndicator())
                  else
                    CustomButton(
                      title: 'Continue',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final result = await ref
                              .read(asyncAuthProvider.notifier)
                              .createUser(
                                username: _displayNameController.text.trim() ,
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim(),
                              );
ref.read(asyncAuthProvider.notifier).clearUserData(ref);
                          if (context.mounted) {
                            if (result) {
                              Navigator.pushReplacementNamed(context, SignInScreen.route);
                            }
                          }
                        }
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
