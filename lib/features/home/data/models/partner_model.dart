import 'package:equatable/equatable.dart';

class Partner extends Equatable {
  const Partner({
    required this.id,
    required this.name,
    required this.specialty,
    required this.category,
    required this.address,
    required this.phone,
    required this.experience,
    required this.media,
  });

  final int? id;
  final String? name;
  final String? specialty;
  final String? category;
  final String? address;
  final String? phone;
  final String? experience;
  final String? media;

  Partner copyWith({
    int? id,
    String? name,
    String? specialty,
    String? category,
    String? address,
    String? phone,
    String? experience,
    String? media,
  }) {
    return Partner(
      id: id ?? this.id,
      name: name ?? this.name,
      specialty: specialty ?? this.specialty,
      category: category ?? this.category,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      experience: experience ?? this.experience,
      media: media ?? this.media,
    );
  }

  factory Partner.fromJson(Map<String, dynamic> json){
    return Partner(
      id: json["id"],
      name: json["name"],
      specialty: json["specialty"],
      category: json["category"],
      address: json["address"],
      phone: json["phone"],
      experience: json["experience"],
      media: json["media"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "specialty": specialty,
    "category": category,
    "address": address,
    "phone": phone,
    "experience": experience,
    "media": media,
  };

  @override
  List<Object?> get props => [
    id, name, specialty, category, address, phone, experience, media, ];
}
