class EventModel {
  final String id;
  final String title;
  final String description;
  final String location;
  final String image;
  final DateTime startDate;
  final DateTime endDate;
  final int price;
  final int minPointsRequired;
  final int minRankRequired;
  final List<Prize> prizes;
  final EventStatus status;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.image,
    required this.startDate,
    required this.endDate,
    required this.price,
    required this.minPointsRequired,
    required this.minRankRequired,
    required this.prizes,
    required this.status,
  });
}

class Prize {
  final String id;
  final String name;
  final String description;

  Prize({
    required this.id,
    required this.name,
    required this.description,
  });
}

enum EventStatus {
  notStarted,
  inProgress,
  paused,
  canceled,
  finished,
}
