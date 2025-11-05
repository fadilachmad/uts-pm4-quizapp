// lib/data/dummy_questions.dart

import '../models/question_model.dart';

final List<Question> dummyQuestions = [
  Question(
    questionText: "5 * 5",
    options: ["25", "20", "15", "30"],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: "45-10",
    options: ["15", "25", "40", "35"],
    correctAnswerIndex: 3,
  ),
  Question(
    questionText: "280 + 30",
    options: ["310", "300", "320", "330"],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: "80 / 4",
    options: ["80", "20", "2", "8"],
    correctAnswerIndex: 1,
  ),
];
