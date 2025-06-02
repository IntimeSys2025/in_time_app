import 'package:equatable/equatable.dart';

class SliderModel extends Equatable{
  final String title;
  final String text;
  final int isButton;
  final String buttonText;
  final String buttonLink;
  final String media;

  const SliderModel({
    required this.title,
    required this.text,
    required this.isButton,
    required this.buttonText,
    required this.buttonLink,
    required this.media,
  });
  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      title: json['title'] ?? '',
      text: json['text'] ?? '',
      isButton: json['is_button'] ?? 0,
      buttonText: json['button_text'] ?? '',
      buttonLink: json['button_link'] ?? '',
      media: json['media'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
    title,
    text,
    isButton,
    buttonText,
    buttonLink,
    media,
  ];

}