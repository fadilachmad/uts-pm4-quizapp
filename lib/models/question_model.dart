// lib/models/question_model.dart

class Question {
  final String questionText;
  final List<String> options; // Daftar pilihan jawaban
  final int correctAnswerIndex; // Index jawaban yang benar

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
  });
}
