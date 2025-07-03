import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:one_on_one/auth/phoneAuthController.dart';

import '../core/constants/constants.dart';
import '../widget/elevatedButtonWidget.dart';
import 'otp_screen.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  final TextEditingController _textEditingController = TextEditingController();
  String? _completeNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Constant.appBarColor),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Verify Phone Number',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),

            child: IntlPhoneField(
              controller: _textEditingController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.phone_android_outlined,
                  color: Colors.white,
                  size: 15,
                ),
                labelText: 'Phone Number',
                labelStyle: TextStyle(color: Colors.white),

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
              initialCountryCode: 'IN',
              dropdownTextStyle: TextStyle(color: Colors.white),
              dropdownIcon: Icon(
                Icons.arrow_drop_down,
                size: 23,
                color: Colors.white,
              ),
              onChanged: (phone) {
                _completeNumber = phone.completeNumber;
                print('You Entered ${phone.completeNumber}');
              },
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30),
          //   child: TextFormField(
          //     style: TextStyle(color: Colors.white),
          //     controller: _textEditingController,
          //     keyboardType: TextInputType.phone,
          //     decoration: InputDecoration(
          //       suffixIcon: Icon(Icons.phone_android, color: Colors.white),
          //       hintText: 'XXXX XXX 123',
          //       hintStyle: TextStyle(color: Colors.white60),
          //
          //       // Border when not focused
          //       enabledBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(16),
          //         borderSide: BorderSide(width: 1.5, color: Colors.white),
          //       ),
          //
          //       // Border when focused
          //       focusedBorder: OutlineInputBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(12)),
          //         borderSide: BorderSide(color: Colors.white, width: 1.5),
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 140),

            child: ElevatedButtonWidget(
              bgColor: Colors.white,
              btnIcon: Icon(
                CupertinoIcons.arrow_turn_down_right,
                color: Color(0xff6E5694),
              ),
              onPressed: () async {
                if (_textEditingController.text.toString().isEmpty) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Enter Valid Number")));
                } else {
                  PhoneAuthController().verifyPhone(_completeNumber!, context);
                }
              },
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 140),
          //
          //   child: ElevatedButtonWidget(
          //     bgColor: Colors.white,
          //     btnIcon: Icon(
          //       CupertinoIcons.arrow_turn_down_right,
          //       color: Color(0xff6E5694),
          //     ),
          //     onPressed: () async {
          //       if (_textEditingController.text.toString().isEmpty ||
          //           _textEditingController.text.length < 10) {
          //         ScaffoldMessenger.of(
          //           context,
          //         ).showSnackBar(SnackBar(content: Text("Enter Valid Number")));
          //       } else if (!_textEditingController.text.startsWith('+91')) {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(content: Text("Please Add Country Code")),
          //         );
          //       } else {
          //         PhoneAuthController().verifyPhone(
          //           _textEditingController.text.trim(),
          //           context,
          //         );
          //       }
          //     },
          //   ),
          // ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
