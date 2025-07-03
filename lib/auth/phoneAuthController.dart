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
          DocumentSnapshot doc = await FirebaseFirestore.instance
              .collection('usersList') // change this to your collection name
              .doc(phoneNumber)
              .get();

          if (doc.exists) {
            await FirebaseFirestore.instance
                .collection('usersList')
                .doc(phoneNumber)
                .update({'phone_number': phoneNumber, 'joinDate': DateTime.now()});
          }

          // await FirebaseFirestore.instance
          //     .collection('usersList')
          //     .doc(phoneNumber)
          //     .set({'phone_number': phoneNumber, 'joinDate': DateTime.now()});
        } catch (exception) {
          debugPrint("Error Saving Data at FireStore $exception");
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

  void checkDocument() async {
    bool exists = await checkIfDocumentExists('users', 'user123');

    if (exists) {
      debugPrint('Document exists ✅');
    } else {
      debugPrint('Document does not exist ❌');
    }
  }

  Future<bool> checkIfDocumentExists(
    String collectionPath,
    String docId,
  ) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(docId)
        .get();

    return doc.exists;
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
