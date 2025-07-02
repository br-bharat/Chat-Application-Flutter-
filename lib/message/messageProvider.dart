import 'package:flutter/foundation.dart';

import 'messageModel.dart';

class MessageProvider extends ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  void setMessage(List<Message> usr) {
    _messages = usr;
  }

  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }

  void loadMessages(List<Message> messages) {
    _messages = messages;
    notifyListeners();
  }

  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }

}
