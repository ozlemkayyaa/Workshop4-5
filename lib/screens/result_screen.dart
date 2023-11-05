import 'package:flutter/material.dart';
import 'package:introapp2/main.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 147, 157, 207),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "CONGRATULATIONS!",
              style: TextStyle(
                color: Color.fromARGB(255, 234, 255, 1),
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            const Text(
              "SCORE",
              style: TextStyle(
                color: Color.fromARGB(255, 99, 17, 162),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              "${widget.score}",
              style: const TextStyle(
                color: Color.fromARGB(255, 99, 17, 162),
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 80.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
              color: Colors.orange,
              child: const Text(
                "Try Again",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
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
