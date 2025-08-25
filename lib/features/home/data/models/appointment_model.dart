import 'package:equatable/equatable.dart';

class AvailableAppointmentModel extends Equatable {
  final int id;
  final int adminId;
  final String day;
  final String startTime;
  final String endTime;
  final String createdAt;
  final String updatedAt;
  final String startDateTime;
  final String endDateTime;

  const AvailableAppointmentModel({
    required this.id,
    required this.adminId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
    required this.startDateTime,
    required this.endDateTime,
  });
  factory AvailableAppointmentModel.fromJson(Map<String, dynamic> json) {
    return AvailableAppointmentModel(
      id: json['id'] as int,
      adminId: json['admin_id'] as int,
      day: json['day'] as String,
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      startDateTime: json['start_datetime'] ?? '',
      endDateTime: json['end_datetime'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'admin_id': adminId,
      'day': day,
      'start_time': startTime,
      'end_time': endTime,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'start_datetime': startDateTime,
      'end_datetime': endDateTime,
    };
  }

  @override
  List<Object?> get props => [
        id,
        adminId,
        day,
        startTime,
        endTime,
        createdAt,
        updatedAt,
        startDateTime,
      ];
}
