import 'package:createuser/pages/auth/forgot_password.dart';
import 'package:createuser/pages/auth/login_page.dart';
import 'package:createuser/pages/auth/sign_up.dart';
import 'package:createuser/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(
          
        ),
        routes: {
          "/loginPage": (context) => LoginPage(),
          "/signUp": (context) => SignUp(),
          "/homePage":(context) => HomePage(),
          "/forgotpasswordscreen":(context) => ForgotPassword(),
        });
  }
}
