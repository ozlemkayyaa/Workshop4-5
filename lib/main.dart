import 'package:flutter/material.dart';
import 'package:introapp2/data/questions.dart';
import 'package:introapp2/screens/result_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: QuizScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// Stateless Widget

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 147, 157, 207),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/quiz.jpg"),
            const SizedBox(
              height: 30.0,
            ),
            const Text("Flutter Quiz App",
                style: TextStyle(
                    color: Color.fromARGB(255, 218, 243, 247),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5)),
            const SizedBox(
              height: 30.0,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuizScreen()));
              },
              color: const Color.fromARGB(255, 174, 191, 96),
              child: const Text(
                "Start",
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

// Stateful Widget

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizState();
  }
}

// _State
class _QuizState extends State<QuizScreen> {
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;

  Color trueAnswer = Colors.green;
  Color wrongAnswer = Colors.red;
  Color buttonControl = Colors.white;
  int score = 0;

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 147, 157, 207),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Question ${index + 1} / ${questions.length}",
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  questions[index].question!,
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                for (int i = 0; i < questions[index].answer!.length; i++)
                  Container(
                    width: double.infinity, // butonu sonsuz uzatır
                    margin: const EdgeInsets.only(
                        bottom: 25.0), //butonlar arası mesafe ayarlar
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      color: isPressed
                          ? questions[index].answer!.entries.toList()[i].value
                              ? trueAnswer
                              : wrongAnswer
                          : buttonControl,
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      onPressed: isPressed
                          ? () {}
                          : () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answer!
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                              } else {
                                setState(() {
                                  buttonControl = wrongAnswer;
                                });
                              }
                            },
                      child: Text(
                        questions[index].answer!.keys.toList()[i],
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: isPressed
                          ? index + 1 == questions.length
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ResultScreen(score)));
                                }
                              : () {
                                  _controller!.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                  setState(() {
                                    isPressed = false;
                                  });
                                }
                          : null,
                      style: OutlinedButton.styleFrom(
                        shape: const StadiumBorder(),
                        side:
                            const BorderSide(color: Colors.orange, width: 4.0),
                      ),
                      child: Text(
                        index + 1 == questions.length
                            ? "See Reuslt"
                            : "Next Question",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
