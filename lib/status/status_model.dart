class Status {
  final String id;
  final String name;
  final String time;
  final String avatar;
  final bool isViewed;

  Status({
    required this.id,
    required this.name,
    required this.time,
    required this.avatar,
    this.isViewed = false,
  });
}