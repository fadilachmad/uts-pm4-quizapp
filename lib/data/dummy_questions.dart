// lib/data/dummy_questions.dart

import '../models/question_model.dart';

final List<Question> dummyQuestions = [
  Question(
    questionText: "Apa komponen utama dalam Flutter untuk membangun UI?",
    options: ["Widgets", "Components", "Views", "Elements"],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: "Manakah yang merupakan StatefulWidget?",
    options: ["Text", "Container", "Scaffold", "TextField"],
    correctAnswerIndex: 3,
  ),
  Question(
    questionText: "Bagaimana cara menjalankan 'flutter pub get'?",
    options: [
      "Lewat Terminal",
      "Lewat Browser",
      "Lewat Email",
      "Lewat Photoshop",
    ],
    correctAnswerIndex: 0,
  ),
  Question(
    questionText: "Apa fungsi dari 'setState()'?",
    options: [
      "Menghapus state",
      "Memberi tahu Flutter untuk membangun ulang UI",
      "Membuat widget baru",
      "Mengambil data dari API",
    ],
    correctAnswerIndex: 1,
  ),
];
