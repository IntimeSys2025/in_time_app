import 'package:equatable/equatable.dart';
import 'package:in_time_app/features/home/data/models/service_model.dart';

import 'available_times_in_date_model.dart';

class SubServiceModel extends Equatable {
  final ServiceModel service;
  final List<SubServiceItemModel> subServices;
  final num? price;
   DateTime? selectedDate;
   AvailableTimesInDateModel? selectedTime;
  String? selectedTimeFormat12Hours;
   SubServiceModel({
    required this.service,
    required this.subServices,
    this.price,
    this.selectedDate,
    this.selectedTime,
    this.selectedTimeFormat12Hours,
  });
  factory SubServiceModel.fromJson(Map<String, dynamic> json) {
    return SubServiceModel(
        service: ServiceModel.fromJson(json),
        // subServices: (json['sub-services'] != null && json['sub-services'] != [])
        //     ? ((json['sub-services'])
        //         .map((e) =>
        //             SubServiceItemModel.fromJson(e as Map<String, dynamic>))
        //         .toList())
        //     : [],
        subServices: (json['sub-services'] != null)
            ? (json['sub-services'] as List<dynamic>)
                .map((e) => SubServiceItemModel.fromJson(e))
                .toList()
            : []);
  }
  Map<String, dynamic> toJson() {
    return {
      'service': service.toJson(),
      'sub_services': subServices.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [service, subServices];
}

class SubServiceItemModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final String stateLabel;
  final num price;
  bool isSelected = false;

  SubServiceItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.stateLabel,
    required this.price,
  });
  factory SubServiceItemModel.fromJson(Map<String, dynamic> json) {
    return SubServiceItemModel(
      id: json['id'] as int,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      stateLabel: json['state_label'] ?? '',
      price: json['price'] as num,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'state_label': stateLabel,
      'price': price,
    };
  }

  @override
  List<Object?> get props => [];
}
