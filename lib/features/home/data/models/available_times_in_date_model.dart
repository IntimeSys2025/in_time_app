import 'package:equatable/equatable.dart';

class AvailableTimesInDateModel extends Equatable {
  const AvailableTimesInDateModel({
    required this.id,
    required this.adminId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
    required this.startDatetime,
    required this.endDatetime,
    required this.type,
  });

  final int? id;
  final int? adminId;
  final String? day;
  final String? startTime;
  final String? endTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? startDatetime;
  final DateTime? endDatetime;
  final String? type;

  AvailableTimesInDateModel copyWith({
    int? id,
    int? adminId,
    String? day,
    String? startTime,
    String? endTime,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? startDatetime,
    DateTime? endDatetime,
    String? type,
  }) {
    return AvailableTimesInDateModel(
      id: id ?? this.id,
      adminId: adminId ?? this.adminId,
      day: day ?? this.day,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      startDatetime: startDatetime ?? this.startDatetime,
      endDatetime: endDatetime ?? this.endDatetime,
      type: type ?? this.type,
    );
  }

  factory AvailableTimesInDateModel.fromJson(Map<String, dynamic> json) {
    return AvailableTimesInDateModel(
      id: json["id"],
      adminId: json["admin_id"],
      day: json["day"],
      startTime: json["start_time"],
      endTime: json["end_time"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      startDatetime: DateTime.tryParse(json["start_datetime"] ?? ""),
      endDatetime: DateTime.tryParse(json["end_datetime"] ?? ""),
      type: json["type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "day": day,
        "start_time": startTime,
        "end_time": endTime,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "start_datetime": startDatetime?.toIso8601String(),
        "end_datetime": endDatetime?.toIso8601String(),
        "type": type,
      };

  @override
  List<Object?> get props => [
        id,
        adminId,
        day,
        startTime,
        endTime,
        createdAt,
        updatedAt,
        startDatetime,
        endDatetime,
        type,
      ];
}
