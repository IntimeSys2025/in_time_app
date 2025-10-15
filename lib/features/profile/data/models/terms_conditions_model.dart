import 'package:equatable/equatable.dart';

class ContentPagesModel extends Equatable {
  final String content;
  const ContentPagesModel({required this.content});
  factory ContentPagesModel.fromJson(Map<String, dynamic> json) {
    return ContentPagesModel(content: json['content']);
  }

  @override
  List<Object?> get props => [content];
}
