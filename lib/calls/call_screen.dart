import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'call_provider.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final callProvider = Provider.of<CallProvider>(context);
    final calls = callProvider.calls;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: calls.length,
          itemBuilder: (context, index) {
            final call = calls[index];
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(call.avatar)),
              title: Text(call.name),
              subtitle: Row(
                children: [
                  Icon(
                    call.isIncoming ? Icons.call_received : Icons.call_made,
                    size: 16,
                    color: call.isMissed ? Colors.red : Colors.green,
                  ),
                  const SizedBox(width: 4),
                  Text(call.time),
                ],
              ),
              trailing: call.isVideo
                  ? const Icon(Icons.videocam, color: Colors.green)
                  : const Icon(Icons.call, color: Colors.green),
              onTap: () {
                // Initiate call
              },
            );
          },
        ),
      ),
    );
  }
}
