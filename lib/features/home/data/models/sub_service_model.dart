import 'package:equatable/equatable.dart';
import 'package:in_time_app/features/home/data/models/service_model.dart';

class SubServiceModel extends Equatable {
  final ServiceModel service;
  final List<SubServiceItemModel> subServices;
  const SubServiceModel({
    required this.service,
    required this.subServices,
  });
  factory SubServiceModel.fromJson(Map<String, dynamic> json) {
    return SubServiceModel(
      service: ServiceModel.fromJson(json),
      subServices: (json['sub_services'] != null && json['sub_services'] != [])?((json['sub_services'])
          .map((e) => SubServiceItemModel.fromJson(e as Map<String, dynamic>))
          .toList()): [],
    );
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

  const SubServiceItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.stateLabel,
    required this.price,
  });
  factory SubServiceItemModel.fromJson(Map<String, dynamic> json) {
    return SubServiceItemModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      stateLabel: json['state_label'] as String,
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
