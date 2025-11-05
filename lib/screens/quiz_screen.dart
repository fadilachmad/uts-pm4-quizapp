import 'package:flutter/material.dart';
import '../data/dummy_questions.dart';
import '../widgets/option_card.dart';
import 'score_screen.dart';

class QuizScreen extends StatefulWidget {
  final String userName; // Menerima nama dari WelcomeScreen

  const QuizScreen({super.key, required this.userName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex; // null berarti belum memilih

  void _answerQuestion(int selectedIndex) {
    setState(() {
      _selectedAnswerIndex = selectedIndex;
    });

    // Cek apakah jawaban benar
    bool isCorrect =
        selectedIndex ==
        dummyQuestions[_currentQuestionIndex].correctAnswerIndex;
    if (isCorrect) {
      _score++; // Tambah skor jika benar
    }

    // Beri jeda 1 detik sebelum pindah ke pertanyaan berikutnya
    Future.delayed(Duration(seconds: 1), () {
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    // Cek apakah masih ada pertanyaan
    if (_currentQuestionIndex < dummyQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++; // Pindah ke pertanyaan berikutnya
        _selectedAnswerIndex = null; // Reset pilihan jawaban
      });
    } else {
      // Kuis Selesai
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreScreen(
            userName: widget.userName,
            score: _score,
            totalQuestions: dummyQuestions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ambil data pertanyaan saat ini
    final currentQuestion = dummyQuestions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Soal ${_currentQuestionIndex + 1} dari ${dummyQuestions.length}',
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // Sembunyikan tombol back
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 2,
              child: Center(
                child: Text(
                  currentQuestion.questionText,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),

            Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: currentQuestion.options.length,
                itemBuilder: (context, index) {
                  bool isSelected = _selectedAnswerIndex == index;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: OptionCard(
                      optionText: currentQuestion.options[index],
                      isSelected: isSelected,
                      onTap: () {
                        // Jangan biarkan pengguna memilih lagi jika sudah memilih
                        if (_selectedAnswerIndex == null) {
                          _answerQuestion(index);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
