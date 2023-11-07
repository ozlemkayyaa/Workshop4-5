import 'package:flutter/material.dart';

import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 116, 40, 143),
        title: const Text(
          'FlutterQuiz',
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/quiz.jpg"),
            const SizedBox(
              height: 70.0,
            ),
            const Text(
              "Let's Start!",
              style: TextStyle(
                color: Color.fromARGB(255, 93, 50, 249),
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(
              height: 70.0,
            ),
            MaterialButton(
              padding: const EdgeInsets.all(12.0),
              shape: const StadiumBorder(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizScreen(),
                  ),
                );
              },
              color: const Color.fromARGB(255, 251, 147, 3),
              child: const Text(
                "  START  ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
