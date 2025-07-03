import 'package:flutter/material.dart';
import 'package:one_on_one/status/status_provider.dart';
import 'package:provider/provider.dart';

import '../core/constants/constants.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    final statuses = statusProvider.statuses;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Constant.appBarColor),
        body: Column(
          children: [
            ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(statuses[0].avatar),
                  ),
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.green,
                      child: Icon(Icons.add, size: 15, color: Colors.white),
                    ),
                  ),
                ],
              ),
              title: const Text('My status'),
              subtitle: const Text('Tap to add status update'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent updates',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: statuses.length - 1,
                itemBuilder: (context, index) {
                  final status = statuses[index + 1]; // Skip "My Status"
                  return ListTile(
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: status.isViewed ? Colors.grey : Colors.green,
                          width: 2,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(status.avatar),
                      ),
                    ),
                    title: Text(status.name),
                    subtitle: Text(status.time),
                    onTap: () {
                      statusProvider.markAsViewed(status.id);
                      // Show status view
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
