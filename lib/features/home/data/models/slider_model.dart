import 'package:equatable/equatable.dart';

class SliderModel extends Equatable {
  final String title;
  final String text;
  final bool isButton;
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
    // setIsButton(json['is_button']);
    return SliderModel(
      title: json['title'] ?? json['name'],
      text: json['text'] ?? '',
      isButton: (json['is_button'] == 1)
          ? true
          : ((json['is_button'] == 0)
              ? false
              : (json['is_button'] == true ? true : false)),
      buttonText: json['button_text'] ?? '',
      buttonLink: json['button_link'] ?? '',
      media: json['media'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "title": title,
    "text": text,
    "is_button" : isButton,
    "button_text" : buttonText,
    "button_link" : buttonLink,
    "media": media


  };

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
