import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  const EventModel({
    required this.id,
    required this.title,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.briefAddress,
    required this.link,
    required this.detailedAddress,
    required this.locationType,
    required this.eventType,
    required this.description,
    required this.price,
    required this.image,
  });

  final int? id;
  final String? title;
  final DateTime? date;
  final String? startTime;
  final String? endTime;
  final String? briefAddress;
  final String? link;
  final String? detailedAddress;
  final String? locationType;
  final String? eventType;
  final String? description;
  final num? price;
  final String? image;

  EventModel copyWith({
    int? id,
    String? title,
    DateTime? date,
    String? startTime,
    String? endTime,
    String? briefAddress,
    String? link,
    String? detailedAddress,
    String? locationType,
    String? eventType,
    String? description,
    num? price,
    String? image,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      briefAddress: briefAddress ?? this.briefAddress,
      link: link ?? this.link,
      detailedAddress: detailedAddress ?? this.detailedAddress,
      locationType: locationType ?? this.locationType,
      eventType: eventType ?? this.eventType,
      description: description ?? this.description,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json["id"],
      title: json["title"],
      date: DateTime.tryParse(json["date"] ?? ""),
      startTime: json["start_time"],
      endTime: json["end_time"],
      briefAddress: json["brief_address"],
      link: json["link"],
      detailedAddress: json["detailed_address"],
      locationType: json["location_type"],
      eventType: json["event_type"],
      description: json["description"],
      price: json["price"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "brief_address": briefAddress,
        "link": link,
        "detailed_address": detailedAddress,
        "location_type": locationType,
        "event_type": eventType,
        "description": description,
        "price": price,
        "image": image,
      };

  @override
  List<Object?> get props => [
        id,
        title,
        date,
        startTime,
        endTime,
        briefAddress,
        link,
        detailedAddress,
        locationType,
        eventType,
        description,
        price,
        image,
      ];
}
