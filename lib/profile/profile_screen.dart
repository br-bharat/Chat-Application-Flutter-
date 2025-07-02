import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_on_one/chats/chatHome.dart';
import 'package:one_on_one/profile/profile_controller.dart';
import 'package:provider/provider.dart';

import '../chats/chatScreen.dart';
import '../core/constants/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileController(),
      child: GestureDetector(
        child: Scaffold(
          backgroundColor: Constant.primaryColor,
          appBar: AppBar(
            backgroundColor: Constant.primaryColor,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text('Profile', style: TextStyle(color: Colors.white)),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Consumer<ProfileController>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      SizedBox(height: 20),

                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: AssetImage('assets/images/avatar.jpg'),
                      ),

                      //Display Name -----------
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                          left: 40,
                          right: 40,
                        ),
                        child: TextFormField(
                          controller: nameController,
                          //obscureText: true,
                          decoration: const InputDecoration(
                            filled: true,
                            // Enable background fill
                            fillColor: Colors.white,
                            // Set background color to white
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Display Name',
                            labelStyle: TextStyle(color: Colors.black),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                          validator: (value) =>
                              value!.length < 6 ? 'Minimum 6 characters' : null,
                        ),
                      ),

                      //AGE -----------
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                          left: 40,
                          right: 40,
                        ),
                        child: TextFormField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            filled: true,
                            // Enable background fill
                            fillColor: Colors.white,
                            // Set background color to white
                            prefixIcon: Icon(Icons.numbers),
                            labelText: 'Age',
                            labelStyle: TextStyle(color: Colors.black),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                          validator: (value) =>
                              value!.length < 6 ? 'Minimum 6 characters' : null,
                        ),
                      ),

                      const SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () async {
                          try {
                            await value.saveData(
                              nameController.text.toString(),
                              int.parse(ageController.text),
                            );

                            if (mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatHomeScreen(),
                                ),
                              );
                            }
                          } catch (ex) {}
                        },
                        child: Icon(CupertinoIcons.arrow_turn_down_right),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
