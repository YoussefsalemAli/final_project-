import 'package:final_project/Config/Realm_config.dart';
import 'package:final_project/features/Authentication/view/Screens/rest_password.dart';
import 'package:final_project/features/Authentication/view/Screens/sign_in_screen.dart';
import 'package:final_project/features/Authentication/view/Screens/sign_up_screen.dart';
import 'package:final_project/features/Authentication/view/Screens/splash_screen.dart';
import 'package:final_project/features/Cart/view/Screens/cart_screen.dart';
import 'package:final_project/features/Home/view/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   initRealm();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.route,
      routes: { 
        ForgotPasswordScreen.route:(context)=>ForgotPasswordScreen(),
        SplashScreen.route: (context) => SplashScreen(),
        SignInScreen.route: (context) => SignInScreen(),
        SignUpScreen.route: (context) => SignUpScreen(),
        HomeScreen.route: (context) => HomeScreen(),
        CartScreen.route:(context)=> CartScreen(),
      },
    );
  }
}