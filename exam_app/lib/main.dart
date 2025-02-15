import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();
void main() {
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 208, 114),
        appBar: AppBar(
          title: Text("Exam"),
          backgroundColor: Color.fromARGB(198, 243, 165, 40),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answerResult = [];
  int rightAnswers = 0;

  var alertStyle = AlertStyle(
    backgroundColor: const Color.fromARGB(255, 246, 208, 114),
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: const TextStyle(fontWeight: FontWeight.bold),
    descTextAlign: TextAlign.start,
    animationDuration: const Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
      side: const BorderSide(
        color: Colors.green,
      ),
    ),
    titleStyle: const TextStyle(
      color: Colors.red,
    ),
    alertAlignment: Alignment.topCenter,
  );

  void checkAnswer({required whatUserPicked}) {
    bool correctAnswer = false;
    // correctAnswer = appBrain.questionGroup[questionNumber].questionAnswer = false; // abstraction
    correctAnswer = appBrain.getQuestionAnswer();
    // (correctAnswer == true) ? print("true1") : print("false2");
    setState(() {
      (whatUserPicked == correctAnswer)
          ? {
              rightAnswers++,
              // print(question1.questionText),
              answerResult.add(
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.thumb_up,
                    color: Colors.green,
                  ),
                ),
              ),
            }
          : {
              answerResult.add(
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Icon(
                    Icons.thumb_down,
                    color: Colors.red,
                  ),
                ),
              ),
            };
      appBrain.isFinished()
          ? {
              Alert(
                context: context,
                style: alertStyle,
                type: AlertType.none,
                title: "ُExam Finish",
                desc:
                    "You answered $rightAnswers questions correctly out of 7.",
                buttons: [
                  DialogButton(
                    color: const Color.fromARGB(198, 243, 165, 40),
                    onPressed: () => Navigator.pop(context),
                    width: 120,
                    child: const Text(
                      "start again",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              ).show(),
              appBrain.reset(),
              answerResult = [],
              rightAnswers = 0,
            }
          : appBrain.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(appBrain.getQuestionImage()),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                // appBrain.questionGroup[questionNumber].questionText,
                appBrain.getQuestionText(),
                // (questionNumber == 3)? questionNumber=0 ,questions[questionNumber]: questions[questionNumber],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(whatUserPicked: true);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigo),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    // side: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              child: const Text(
                "true",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(whatUserPicked: false);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    // side: BorderSide(color: Colors.green),
                  ),
                ),
              ),
              child: const Text(
                "false",
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
