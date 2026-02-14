import 'package:equatable/equatable.dart';
import 'package:in_time_app/features/home/data/models/sub_service_model.dart';

class ServiceModel extends Equatable {
  final int id;
  final String name;
  final String title;
  final String description;
  final num price;
  final String category;
  final String specialty;
  final String imageUrl;
  final List<SubServiceItemModel> subServices;

  const ServiceModel(
      {required this.name,
      required this.title,
      required this.description,
      required this.price,
      required this.category,
      required this.specialty,
      required this.imageUrl,
      required this.id,
      required this.subServices});
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      category: json['category'] ?? '',
      specialty: json['specialty'] ?? '',
      imageUrl: json['image'] ?? '',
      subServices: json["sub_services"] == null
          ? []
          : (json["sub_services"] as List<dynamic>)
              .map((e) => SubServiceItemModel.fromJson(e))
              .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'specialty': specialty,
      'image': imageUrl,
      'sub_services': subServices.map((x) => x).toList(),
    };
  }

  @override
  List<Object?> get props => [
        name,
        title,
        description,
        price,
        category,
        specialty,
        imageUrl,
      ];
}
