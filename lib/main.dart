import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:one_on_one/calls/call_provider.dart';
import 'package:one_on_one/calls/call_screen.dart';
import 'package:one_on_one/chats/chatHome.dart';
import 'package:one_on_one/chats/chatScreen.dart';
import 'package:one_on_one/chats/newMessageScreen.dart';
import 'package:one_on_one/message/messageProvider.dart';
import 'package:one_on_one/message/messageScreen.dart';
import 'package:one_on_one/screens/splashScreen.dart';
import 'package:one_on_one/status/status_provider.dart';
import 'package:one_on_one/status/status_screen.dart';
import 'package:provider/provider.dart';
import 'chats/chatProvider.dart';
import 'homeScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MessageProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => StatusProvider()),
        ChangeNotifierProvider(create: (context) => CallProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ChatHomeScreen(),
    );
  }
}
