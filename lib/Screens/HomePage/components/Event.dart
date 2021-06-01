import 'package:integrative/Model/UserBoundary.dart';

class EventItem {
  final String title;
  final String category;
  final String owner;
  final String hours;
  final String description;
  final DateTime date;
  String? itemId;
  final List<UserBoundary>? participants;

  EventItem({
    required this.title,
    required this.date,
    required this.hours,
    required this.category,
    required this.owner,
    required this.description,
    this.itemId,
    this.participants,
  });

  EventItem.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        date = DateTime.parse(json['date']),
        hours = json['hours'],
        category = json['category'],
        owner = json['owner'],
        itemId = null,
        description = json['description'],
        participants = [];

  String toString() {
    return "Title: " +
        this.title +
        ", Date: " +
        this.date.day.toString() +
        "/" +
        this.date.month.toString() +
        "/" +
        this.date.year.toString() +
        ", Hour: " +
        this.hours +
        " Category: " +
        this.category +
        ", Owner: " +
        this.owner +
        ", itemId: " +
        this.itemId! +
        ", Description: " +
        this.description +
        ", Participants: " +
        this.participants.toString();
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'date': date.toString(),
        'hours': hours,
        'category': category,
        'owner': owner,
        'participants': participants.toString(),
        'description': description,
      };
}
