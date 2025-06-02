import 'package:equatable/equatable.dart';

class AppointmentModel extends Equatable{
  final int id;
  final int adminId;
  final String day;
  final String startTime;
  final String endTime;
  final String createdAt;
  final String updatedAt;
  final String startDateTime;

  const AppointmentModel({
    required this.id,
    required this.adminId,
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
    required this.startDateTime,
  });
  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      id: json['id'] as int,
      adminId: json['admin_id'] as int,
      day: json['day'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      startDateTime: json['start_date_time'] as String,
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