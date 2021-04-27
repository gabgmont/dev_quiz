import 'dart:convert';

import 'package:dev_quiz/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        'facil': Level.facil,
        'medio': Level.medio,
        'dificil': Level.dificil,
        'perito': Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: 'facil',
        Level.medio: 'medio',
        Level.dificil: 'dificil',
        Level.perito: 'perito',
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel(
      {required this.title,
      required this.questions,
      this.questionsAnswered = 0,
      required this.image,
      required this.level});

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return new QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'],
      image: map['image'],
      level: map['level'].toString().parse,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'title': this.title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAnswered': this.questionsAnswered,
      'image': this.image,
      'level': level.parse,
    };
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizModel{title: $title, questions: ${questions.toString()}, questionsAnswered: $questionsAnswered, image: $image, level: $level}';
  }
}
