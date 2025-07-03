import 'package:flutter/material.dart';
import 'package:one_on_one/core/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../chats/chatProvider.dart';
import 'messageModel.dart';
import 'messageProvider.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final _ = context.read<MessageProvider>().messages;
    // Load initial messages after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final messageProvider = Provider.of<MessageProvider>(
        context,
        listen: false,
      );
      messageProvider.loadMessages([
        Message(
          name: '',
          id: '1',
          text: 'Hello there!',
          timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
          senderId: 'user2',
          receiverId: 'user1',
          isMe: false,
        ),
        Message(
          name: '',
          id: '2',
          text: 'Hi! How are you?',
          timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
          senderId: 'user1',
          receiverId: 'user2',
          isMe: true,
        ),
      ]);
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    final messageProvider = Provider.of<MessageProvider>(
      context,
      listen: false,
    );
    final newMessage = Message(
      name: '',
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: _messageController.text,
      timestamp: DateTime.now(),
      senderId: 'user1',
      receiverId: 'user2',
      isMe: true,
    );

    messageProvider.addMessage(newMessage);
    _sendAutoReply(_messageController.text);
    _messageController.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<ChatProvider>().selectedUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.appBarColor,
        title: Text(user!.name),
        titleTextStyle: TextStyle(color: Colors.white),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white, // 👈 change color here
            size: 18, // 👈 change size here
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.phone, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).padding.right + 10,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.video_call, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<MessageProvider>(
              builder: (context, messageProvider, child) {
                if (messageProvider.messages.isEmpty) {
                  return const Center(child: Text('No messages yet'));
                }
                return ListView.builder(
                  controller: _scrollController,
                  itemCount: messageProvider.messages.length,
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    final message = messageProvider.messages[index];
                    return _buildMessageBubble(message);
                  },
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Message message) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Align(
        alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              color: message.isMe ? Colors.grey[400] : Colors.grey[300],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  message.text,
                  style: TextStyle(
                    color: message.isMe ? Colors.black : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  DateFormat('HH:mm').format(message.timestamp),
                  style: TextStyle(
                    fontSize: 10.0,
                    color: message.isMe ? Colors.black54 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Attach File')));
                  },
                  icon: const Icon(Icons.attach_file),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.emoji_emotions_outlined),
            onPressed: _sendMessage,
          ),
          IconButton(icon: const Icon(Icons.send), onPressed: _sendMessage),
        ],
      ),
    );
  }

  void _sendAutoReply(dynamic val) {
    Future.delayed(const Duration(seconds: 1), () {
      final messageProvider = Provider.of<MessageProvider>(
        context,
        listen: false,
      );

      final autoReply = Message(
        name: '',
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: 'Auto-reply: $val',
        timestamp: DateTime.now(),
        senderId: 'user2',
        receiverId: 'user1',
        isMe: false,
      );

      messageProvider.addMessage(autoReply);
      _scrollToBottom();
    });
  }
}
