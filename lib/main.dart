import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook UI Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Start at the home route, which will immediately check authentication status
      initialRoute: '/home',
      routes: {
        // This initial route will check isAuthenticated=false and redirect to Login
        '/home': (context) => const HomePage(isAuthenticated: false),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        // This is the secure route for the authenticated user
        '/authenticated_home': (context) => const HomePage(isAuthenticated: true),
      },
    );
  }
}