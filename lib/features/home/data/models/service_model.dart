import 'package:equatable/equatable.dart';

class ServiceModel extends Equatable {
  final int id;
  final String name;
  final String title;
  final String description;
  final num price;
  final String category;
  final String specialty;
  final String imageUrl;

  const ServiceModel({
    required this.name,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.specialty,
    required this.imageUrl,
    required this.id,
  });
  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'] as int,
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      category: json['category']  ?? '',
      specialty: json['specialty'] ?? '',
      imageUrl: json['image'] ?? '',
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
