import 'package:flutter/material.dart';

import 'chats/chatScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chats')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('John Doe'),
            subtitle: const Text('Last message...'),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/men/1.jpg',
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChatScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
