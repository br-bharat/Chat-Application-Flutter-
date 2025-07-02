class ChatUser {
  final String id;
  final String name;
  final String avatarUrl;

  ChatUser({
    required this.id,
    required this.name,
    required this.avatarUrl,
  });

  // Optional: Factory constructor for creating from JSON (for Firebase/REST APIs)
  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
    );
  }

  // Optional: Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
    };
  }
}
