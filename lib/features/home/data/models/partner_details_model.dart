import 'package:equatable/equatable.dart';
import 'package:in_time_app/features/home/data/models/service_model.dart';
import 'package:in_time_app/features/home/data/models/slider_model.dart';

class PartnerDetailsModel extends Equatable {
  const PartnerDetailsModel({
    required this.id,
    required this.sliderModel,
    // required this.name,
    // required this.title,
    // required this.text,
    // required this.isButton,
    // required this.buttonText,
    // required this.buttonLink,
    // required this.specialty,
    // required this.category,
    // required this.address,
    // required this.phone,
    // required this.experience,
    // required this.media,
    required this.services,
  });

  final int? id;
  // final String? name;
  // final dynamic title;
  // final dynamic text;
  // final bool? isButton;
  // final dynamic buttonText;
  // final dynamic buttonLink;
  // final dynamic specialty;
  // final dynamic category;
  // final dynamic address;
  // final dynamic phone;
  // final dynamic experience;
  // final String? media;
  final SliderModel sliderModel;
  final List<ServiceModel> services;

  PartnerDetailsModel copyWith({
    int? id,
    // String? name,
    // dynamic title,
    // dynamic text,
    // bool? isButton,
    // dynamic buttonText,
    // dynamic buttonLink,
    // dynamic specialty,
    // dynamic category,
    // dynamic address,
    // dynamic phone,
    // dynamic experience,
    // String? media,
    List<ServiceModel>? services,
  }) {
    return PartnerDetailsModel(
      id: id ?? this.id,
      // name: name ?? this.name,
      // title: title ?? this.title,
      // text: text ?? this.text,
      // isButton: isButton ?? this.isButton,
      // buttonText: buttonText ?? this.buttonText,
      // buttonLink: buttonLink ?? this.buttonLink,
      // specialty: specialty ?? this.specialty,
      // category: category ?? this.category,
      // address: address ?? this.address,
      // phone: phone ?? this.phone,
      // experience: experience ?? this.experience,
      // media: media ?? this.media,
      sliderModel: sliderModel,
      services: services ?? this.services,
    );
  }

  factory PartnerDetailsModel.fromJson(Map<String, dynamic> json){
    return PartnerDetailsModel(
      id: json["id"],
      // name: json["name"],
      // title: json["title"],
      // text: json["text"],
      // isButton: json["is_button"],
      // buttonText: json["button_text"],
      // buttonLink: json["button_link"],
      // specialty: json["specialty"],
      // category: json["category"],
      // address: json["address"],
      // phone: json["phone"],
      // experience: json["experience"],
      // media: json["media"],
      sliderModel: SliderModel.fromJson(json),
      // services: json["services"] == null ? [] : List<ServiceModel>.from(json["services"]!.map((x) => x)),
      //   (json['sub-services'] as List<dynamic>).map((e) => SubServiceItemModel.fromJson(e)).toList()
      services: json["services"] == null ? [] :( json["services"] as List<dynamic>).map((e) => ServiceModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    // "name": name,
    // "title": title,
    // "text": text,
    // "is_button": isButton,
    // "button_text": buttonText,
    // "button_link": buttonLink,
    // "specialty": specialty,
    // "category": category,
    // "address": address,
    // "phone": phone,
    // "experience": experience,
    // "media": media,
    "slider" : sliderModel.toJson(),
    "services": services.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    id,
    // name, title, text, isButton, buttonText, buttonLink, specialty, category, address, phone, experience, media,
    sliderModel,
    services, ];
}
