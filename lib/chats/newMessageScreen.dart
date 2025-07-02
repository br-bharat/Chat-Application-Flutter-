import 'package:flutter/material.dart';
import 'package:one_on_one/chats/chatProvider.dart';
import 'package:provider/provider.dart';

class NewMessageScreen extends StatefulWidget {
  const NewMessageScreen({super.key});

  @override
  _NewMessageScreenState createState() => _NewMessageScreenState();
}

class _NewMessageScreenState extends State<NewMessageScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final user = context.read<ChatProvider>().selectedUser;
    _controller = TextEditingController(text: user?.name ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final message = _controller.text.trim();
    final user = context.read<ChatProvider>().selectedUser;

    if (message.isNotEmpty && user != null) {
      print('Message to ${user.name}: $message');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<ChatProvider>().selectedUser;

    if (user == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Error')),
        body: Center(child: Text('No user selected.')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(user.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              // controller: _controller,
              decoration: InputDecoration(
                labelText: 'Message to ${user.name}',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendMessage,
              child: Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
