import 'package:flutter/material.dart';
import 'package:auth/src/screens/forgot_password.dart';
import 'package:auth/src/screens/home_screen.dart';
import 'package:auth/src/screens/login_screen.dart';
import 'package:auth/src/screens/signup_screen.dart';
import 'package:auth/src/services/auth_service.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Afalagi",
        home: LoginScreen(),
        routes: {
          '/home': (_) => HomeScreen(),
          '/login': (_) => new LoginScreen(),
          '/signup': (_) => new SignupScreen(),
          '/forgot_password': (_) => new ForgotPassword(),
        },
      );
  }
}
