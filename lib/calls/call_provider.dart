import 'package:flutter/material.dart';

import 'call_model.dart';

class CallProvider with ChangeNotifier {
  final List<Call> _calls = [
    Call(
      id: '1',
      name: 'John Doe',
      time: '10:30 AM',
      avatar: 'https://randomuser.me/api/portraits/men/1.jpg',
      isIncoming: false,
      isVideo: true,
    ),
    Call(
      id: '2',
      name: 'Jane Smith',
      time: 'Yesterday, 9:45 AM',
      avatar: 'https://randomuser.me/api/portraits/women/1.jpg',
      isIncoming: true,
      isMissed: true,
    ),
    // Add more dummy data
  ];

  List<Call> get calls => _calls;

  void addCall(Call call) {
    _calls.insert(0, call);
    notifyListeners();
  }
}