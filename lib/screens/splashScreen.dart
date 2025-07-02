import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:one_on_one/chats/chatHome.dart';

import '../auth/phone_auth.dart';
import '../chats/chatScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //----------1ST METHOD------------------

    // Delay for 3 seconds then navigate to HomeScreen
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.of(
    //     context,
    //   ).pushReplacement(MaterialPageRoute(builder: (_) => const SignInScreen()));
    // });

    //   //----------2ND METHOD------------------

    Timer(Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PhoneAuth()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ChatHomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff6E5694),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.flutter_dash, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              "Welcome to Chat App",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
