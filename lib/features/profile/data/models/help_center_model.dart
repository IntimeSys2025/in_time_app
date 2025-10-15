import 'package:equatable/equatable.dart';


class HelpCenterModel extends Equatable {
  const HelpCenterModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.order,
  });

  final int? id;
  final String? question;
  final String? answer;
  final num? order;

  HelpCenterModel copyWith({
    int? id,
    String? question,
    String? answer,
    num? order,
  }) {
    return HelpCenterModel(
      id: id ?? this.id,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      order: order ?? this.order,
    );
  }

  factory HelpCenterModel.fromJson(Map<String, dynamic> json){
    return HelpCenterModel(
      id: json["id"],
      question: json["question"],
      answer: json["answer"],
      order: json["order"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "question": question,
    "answer": answer,
    "order": order,
  };

  @override
  List<Object?> get props => [
    id, question, answer, order, ];
}
