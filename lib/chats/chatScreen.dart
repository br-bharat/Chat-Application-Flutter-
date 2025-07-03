// import 'package:flutter/material.dart';
// import 'package:one_on_one/chats/chatModel.dart';
// import 'package:one_on_one/chats/chatProvider.dart';
// import 'package:one_on_one/chats/contactList.dart';
// import 'package:one_on_one/message/messageModel.dart';
// import 'package:one_on_one/message/messageScreen.dart';
// import 'package:provider/provider.dart';
//
// import '../info.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   final List<ChatUser> usersLst = [
//     ChatUser(id: '1', name: 'Alice', message: 'Hey, how are you doing?', time: '1:00 am', profilePic: 'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'),
//     ChatUser(id: '2', name: 'Paul', message: 'Hello, whats up', time: '4:56 am', profilePic: 'https://images.unsplash.com/photo-1619194617062-5a61b9c6a049?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHJhbmRvbSUyMHBlb3BsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'),
//     ChatUser(id: '3', name: 'David', message: 'Hello, I want to sleep.', time: '6:02 am', profilePic: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'),
//     ChatUser(id: '4', name: 'Steve', message: 'Call me, have some work', time: '7:25 am', profilePic: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'),
//     ChatUser(id: '5', name: 'Kelly', message: 'You ate food?', time: '9:53 am', profilePic: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60'),
//     ChatUser(id: '6', name: 'Mark', message: 'Yo!!!!! Long time, no see!?', time: '10:00 am', profilePic: 'https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?auto=compress%2Cformat&ixlib=php-3.3.0'),
//     ChatUser(id: '7', name: 'Trump', message: 'Am I fat?', time: '12:06 pm', profilePic: 'https://pbs.twimg.com/profile_images/1419974913260232732/Cy_CUavB.jpg'),
//     ChatUser(id: '8', name: 'Meloni', message: 'I am from International Olym...', time: '1:03 pm', profilePic: 'https://media.cntraveler.com/photos/60596b398f4452dac88c59f8/16:9/w_3999,h_2249,c_limit/MtFuji-GettyImages-959111140.jpg'),
//     ChatUser(id: '9', name: 'Dooley', message: 'Images by Unsplash', time: '2:25 pm', profilePic: 'https://www.socialketchup.in/wp-content/uploads/2020/05/fi-vill-JOHN-DOE.jpg'),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       Provider.of<ChatProvider>(context, listen: false).fetchChats();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer<ChatProvider>(
//         builder: (context, value, _) {
//           final users = value.users;
//
//           if (users.isEmpty) {
//             value.fetchChats(); // Fetch on first build
//             return Center(child: CircularProgressIndicator());
//           }
//
//           return Padding(
//             padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//             child: ListView.separated(
//               addAutomaticKeepAlives: true,
//               itemCount: value.users.length,
//               separatorBuilder: (context, index) => const Divider(
//                 height: 0,
//                 color: Colors.amber,
//                 indent: 39,
//                 endIndent: 39,
//               ),
//               itemBuilder: (context, index) {
//                 final us = value.users[index];
//                 return InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MessageScreen()),
//                     );
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ListTile(
//                       tileColor: Colors.grey[300],
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       contentPadding: EdgeInsets.symmetric(
//                         vertical: 0,
//                         horizontal: 0,
//                       ),
//                       title: Text(
//                         // info[index]['name'].toString(),
//                         // style: TextStyle(fontSize: 16),
//                         us.name,
//                       ),
//                       subtitle: Padding(
//                         padding: EdgeInsets.only(top: 2),
//                         child: Text(
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           // info[index]['message'].toString(),
//                           // style: TextStyle(fontSize: 13),
//                           us.message
//                         ),
//                       ),
//                       leading: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         child: CircleAvatar(
//                           radius: 20,
//                           backgroundImage: NetworkImage(
//                             //info[index]['profilePic'].toString(),
//                             us.profilePic
//                           ),
//                         ),
//                       ),
//                       trailing: Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: Text(
//                           // info[index]['time'].toString(),
//                           // style: TextStyle(fontSize: 13, color: Colors.grey),
//                           us.time
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

//----------------------------------------------------------------------
//----------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_on_one/chats/chatProvider.dart';
import 'package:one_on_one/message/messageScreen.dart';
import 'package:provider/provider.dart';

import '../core/constants/constants.dart';
import 'chatModel.dart';
import 'newMessageScreen.dart';

class ChatScreen extends StatelessWidget {
  final List<ChatUser> users = [
    ChatUser(id: '1', name: 'Alice', avatarUrl: ''),
    ChatUser(id: '2', name: 'Bob', avatarUrl: ''),
    ChatUser(id: '3', name: 'Charlie', avatarUrl: ''),
    ChatUser(id: '4', name: 'David', avatarUrl: ''),
    ChatUser(id: '5', name: 'Gurmanroop', avatarUrl: ''),
  ];

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.appBarColor,
        title: Text('Welcome Chats',style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(height: 8, indent: 39, endIndent: 39),
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            return ListTile(
              leading: CircleAvatar(child: Text(user.name[0])),
              title: Text(user.name),
              trailing: Text(
                DateFormat('HH:mm').format(DateTime.timestamp()),
                style: TextStyle(fontSize: 10.0),
              ),
              onTap: () {
                context.read<ChatProvider>().setUser(user);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => MessageScreen()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------
//----------------------------------------------------------------------
