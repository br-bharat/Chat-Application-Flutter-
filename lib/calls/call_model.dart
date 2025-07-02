class Call {
  final String id;
  final String name;
  final String time;
  final String avatar;
  final bool isIncoming;
  final bool isVideo;
  final bool isMissed;

  Call({
    required this.id,
    required this.name,
    required this.time,
    required this.avatar,
    this.isIncoming = true,
    this.isVideo = false,
    this.isMissed = false,
  });
}