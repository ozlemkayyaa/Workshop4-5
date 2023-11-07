import 'package:flutter/material.dart';
import 'package:introapp2/data/questions.dart';

import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<QuizScreen> {
  // ignore: prefer_final_fields
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;

  Color trueAnswer = Colors.green;
  Color wrongAnswer = Colors.red;
  Color buttonControl = Colors.white;
  int score = 0;

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 116, 40, 143),
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: PageView.builder(
          physics:
              const NeverScrollableScrollPhysics(), // yana kaydırma özelliği kapalı, next question butonuna basılmadan geçilmiyor.
          controller: _controller,
          onPageChanged: (page) {
            setState(
              () {
                isPressed = false;
              },
            );
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
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 10.0,
                  thickness: 2.0,
                ),
                const SizedBox(
                  height: 25.0,
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
                      // butona tıklandığında doğru ve yanlış cevaplara göre renkler değişiyor
                      color: isPressed
                          ? questions[index].answer!.entries.toList()[i].value
                              ? trueAnswer
                              : wrongAnswer
                          : buttonControl,
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      // cevap doğruysa 10 puan alır
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
                                setState(
                                  () {
                                    buttonControl;
                                  },
                                );
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
                                      builder: (context) => ResultScreen(score),
                                    ),
                                  );
                                }
                              : () {
                                  _controller!.nextPage(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.linear);
                                  setState(
                                    () {
                                      isPressed = false;
                                    },
                                  );
                                }
                          : null,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        backgroundColor: const Color.fromARGB(255, 251, 147, 3),
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        index + 1 == questions.length
                            ? "See Reuslt"
                            : "Next Question",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
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
