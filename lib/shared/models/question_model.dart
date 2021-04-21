import 'dart:convert';

import 'package:dev_Quiz/shared/models/answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.title,
    required this.answers,
  }) : assert(answers.length == 4);

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return new QuestionModel(
      title: map['title'],
      answers: List<AnswerModel>.from(map['answers']?.map((x) => AnswerModel.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) => QuestionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuestionModel{title: $title, answers: ${answers.toString()}}';
  }
}
