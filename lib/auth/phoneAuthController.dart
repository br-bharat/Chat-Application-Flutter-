import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'otp_screen.dart';

class PhoneAuthController {
  final String verificationId = '';
  String statusMessage = '';

  Future<void> verifyPhone(dynamic phoneNumber, BuildContext context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber.trim(),
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (verificationId, int? resendToken) async {
        try {
          await FirebaseFirestore.instance
              .collection('usersList')
              .doc(phoneNumber)
              .set({'phone_number': phoneNumber, 'joinDate': DateTime.now()});
        } catch (exception) {
          print("Error Saving Data at FireStore $exception");
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpScreen(
              verificationId: verificationId,
              phoneNumber: phoneNumber,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  // Future<void> verifyOTP(String smsCode) async {
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId,
  //       smsCode: smsCode,
  //     );
  //
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     statusMessage = 'Phone number verified!';
  //   } catch (e) {
  //     statusMessage = 'Invalid OTP: $e';
  //   }
  // }
}
