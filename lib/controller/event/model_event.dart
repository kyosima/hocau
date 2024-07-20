class EventModel {
   String id;
   String title;
   String description;
   String location;
   String image;
   DateTime startDate;
   DateTime endDate;
   int ticket;
   int totalTicket;
   int price;
   int minPointsRequired;
   int minRankRequired;
   List<Prize> prizes;
   EventStatus status;

  EventModel({
    this.id ='',
    this.title='',
    this.image = '',
    this.description = '',
    this.location = '',
    this.prizes = const [],
    this.price = 0,
    DateTime? startDate,
    DateTime? endDate,
    this.status = EventStatus.notStarted ,
    this.ticket = 0,
    this.totalTicket = 0,
    this.minRankRequired = 0,
    this.minPointsRequired = 0,
  })  : startDate = startDate ?? DateTime.now(),
        endDate = endDate ?? DateTime.now().add(Duration(days: 1));
}

class Prize {
   String id;
   String name;
   String description;

  Prize({
     this.id ='',
     this.name = '',
     this.description='', 
  });
}

enum EventStatus {
  notStarted,
  inProgress,
  paused,
  canceled,
  finished,
}
