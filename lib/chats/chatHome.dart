import 'package:flutter/material.dart';
import 'package:one_on_one/calls/call_screen.dart';
import 'package:one_on_one/chats/chatScreen.dart';
import 'package:one_on_one/status/status_screen.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({super.key});

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [ChatScreen(), StatusScreen(), CallsScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5649B2),
        title: Text('Chat'),
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
          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).padding.right + 10,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.white,size: 18,),
            ),
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.schedule), label: ''),
        ],
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('WhatsApp'),
//       actions: [
//         IconButton(icon: const Icon(Icons.search), onPressed: () {}),
//         IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
//       ],
//       bottom: TabBar(
//         controller: _tabController,
//         tabs: const [
//           Tab(text: 'CHATS'),
//           Tab(text: 'STATUS'),
//           Tab(text: 'CALLS'),
//         ],
//       ),
//     ),
//     body: TabBarView(
//       controller: _tabController,
//       children: [
//         ChatScreen(),
//         StatusScreen(),
//         CallsScreen(),
//       ],
//     ),
//   );
// }
