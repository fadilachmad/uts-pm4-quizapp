import 'package:flutter/material.dart';
import 'welcome_screen.dart'; // Kembali ke halaman awal

class ScoreScreen extends StatelessWidget {
  final String userName;
  final int score;
  final int totalQuestions;

  const ScoreScreen({
    super.key,
    required this.userName,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Kuis Selesai!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Selamat, $userName!",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              Text("Skor Akhir Anda:", style: TextStyle(fontSize: 20)),
              Text(
                "$score / $totalQuestions",
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  // Hapus semua halaman sebelumnya dari tumpukan (stack)
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomeScreen(),
                    ),
                    (route) => false, // Hapus semua route
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text("COBA LAGI"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
