import 'dart:developer';
import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../core/constants/constants.dart';
import '../widget/textWidget.dart';
import 'otpController.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const OtpScreen({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.primaryColor,
      appBar: AppBar(backgroundColor: Constant.primaryColor, centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(txt: "Verify Otp", txtColor: Colors.white, txtSize: 20.0),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),

            child: TextField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              controller: _otpController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Otp",
                hintStyle: TextStyle(color: Colors.white),
                suffixIcon: Icon(Icons.password, color: Colors.white),

                // Border when not focused
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(width: 1.5, color: Colors.white),
                ),

                // Border when focused
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.white, width: 1.5),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              try {
                OtpController().verifyOtp(
                  widget.phoneNumber,
                  _otpController.text,
                  widget.verificationId,
                  context,
                );
              } catch (ex) {
                log("The Error is = $ex.toString()");
              }
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
