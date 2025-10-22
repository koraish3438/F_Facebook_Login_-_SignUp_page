import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Flag to determine if the user is authenticated.
  // This is passed via the route arguments.
  final bool isAuthenticated;

  const HomePage({super.key, this.isAuthenticated = false});

  @override
  Widget build(BuildContext context) {
    // If NOT authenticated, redirect to Login Page immediately.
    if (!isAuthenticated) {
      // Use Future.microtask to ensure navigation happens after the widget build.
      Future.microtask(() {
        // Redirect to Login Page, removing the current Home Page from stack
        Navigator.pushReplacementNamed(context, '/login');
      });

      // Show a loading indicator while redirecting
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // --- Home Page UI (Visible only if isAuthenticated is true) ---
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Color(0xFF3b5998), // Facebook Blue
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black54),
            onPressed: () {
              // On Logout, navigate back to Login Page and replace the route
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.feed, size: 80, color: Color(0xFF3b5998)),
            SizedBox(height: 20),
            Text(
              'Welcome to Facebook Home Page!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('This is your main feed content.', textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}