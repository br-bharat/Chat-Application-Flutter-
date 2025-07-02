import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';
import '../widget/scaffoldMessengerWidget.dart';

class OtpController {
  //final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> verifyOtp(dynamic phoneNumber ,String otp, String id, context) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: id,
      smsCode: otp,
    );

    try {
      // await FirebaseFirestore.instance
      //     .collection('usersList')
      //     .doc(phoneNumber)
      //     .set({'phone_number': phoneNumber, 'joinDate': DateTime.now()});

      FirebaseAuth.instance
          .signInWithCredential(credential)
          .then(
            (value) => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              ),

              // ScaffoldMessenger.of(
              //   context,
              // ).showSnackBar(SnackBar(content: Text("Welcome to Firebase"))),
              ScaffoldMessengerWidget.showSnackBar(
                context: context,
                message: "Welcome to Firebase",
              ),
            },
          );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'firebase_auth/invalid-verification-code') {
        ScaffoldMessengerWidget.showSnackBar(
          context: context,
          message: "Invalid Otp",
        );
      }
    }
  }
}
