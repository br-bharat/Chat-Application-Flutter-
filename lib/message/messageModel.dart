

enum MessageType { text, image, video, document }

class Message {
  final String name;
  final String id;
  final String text;
  final DateTime timestamp;
  final String senderId;
  final String receiverId;
  final bool isMe;
  final MessageType type;

  Message({
    required this.name,
    required this.id,
    required this.text,
    required this.timestamp,
    required this.senderId,
    required this.receiverId,
    required this.isMe,
    this.type = MessageType.text
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      name: json['name'],
      id: json['id'],
      text: json['text'],
      timestamp: DateTime.parse(json['timestamp']),
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      isMe: json['isMe'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'timestamp': timestamp.toIso8601String(),
      'senderId': senderId,
      'receiverId': receiverId,
      'isMe': isMe,
    };
  }
}