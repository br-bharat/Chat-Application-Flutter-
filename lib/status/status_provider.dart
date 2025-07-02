import 'package:flutter/material.dart';
import 'package:one_on_one/status/status_model.dart';

class StatusProvider extends ChangeNotifier {
  final List<Status> _statuses = [
    Status(
      id: '1',
      name: 'My Status',
      time: 'Just now',
      avatar: 'https://randomuser.me/api/portraits/men/1.jpg',
    ),
    Status(
      id: '2',
      name: 'Jane Smith',
      time: 'Today, 9:45 AM',
      avatar: 'https://randomuser.me/api/portraits/women/1.jpg',
    ),
    // Add more dummy data
  ];

  List<Status> get statuses => _statuses;

  void addStatus(Status status) {
    _statuses.insert(1, status); // Insert after "My Status"
    notifyListeners();
  }

  void markAsViewed(String statusId) {
    final index = _statuses.indexWhere((status) => status.id == statusId);
    if (index != -1) {
      _statuses[index] = _statuses[index].copyWith(isViewed: true);
      notifyListeners();
    }
  }
}

extension StatusExtension on Status {
  Status copyWith({
    String? id,
    String? name,
    String? time,
    String? avatar,
    bool? isViewed,
  }) {
    return Status(
      id: id ?? this.id,
      name: name ?? this.name,
      time: time ?? this.time,
      avatar: avatar ?? this.avatar,
      isViewed: isViewed ?? this.isViewed,
    );
  }
}