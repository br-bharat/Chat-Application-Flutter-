import 'package:flutter/material.dart';

import 'chatModel.dart';


class ChatProvider with ChangeNotifier {
  ChatUser? _selectedUser;

  ChatUser? get selectedUser => _selectedUser;

  void setUser(ChatUser user) {
    _selectedUser = user;
    notifyListeners();
  }

  void clearUser() {
    _selectedUser = null;
    notifyListeners();
  }
}
