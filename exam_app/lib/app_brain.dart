import 'question.dart';

class AppBrain {
  int _questionNumber = 0;

  final List<Question> _questionGroup = [
    Question(
        q: "The number of planets in the solar system is 8 planets",
        i: "images/image-1.jpg",
        a: true),
    Question(q: "Cats are carnivores", i: "images/image-2.jpg", a: true),
    Question(
        q: "China is located on the African continent",
        i: "images/image-3.jpg",
        a: false),
    Question(
        q: "The Earth is flat, not spherical",
        i: "images/image-4.jpg",
        a: false),
    Question(
        q: "Humans can survive without eating meat",
        i: "images/image-5.jpg",
        a: true),
    Question(
        q: "The sun revolves around the earth and the earth revolves around the moon",
        i: "images/image-6.jpg",
        a: false),
    Question(q: "Animals do not feel pain", i: "images/image-7.jpg", a: false)
  ];
  // String getQuestionText(int questionNumber) {
  //  int _questionNumber = 0; // in main

  void nextQuestion() {
    // _questionNumber<_questionGroup.length-1?++_questionNumber;
    if (_questionNumber < _questionGroup.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    //named parameter
    return _questionGroup[_questionNumber].questionText;
  }

  String getQuestionImage() {
    return _questionGroup[_questionNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return _questionGroup[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    return _questionNumber >= _questionGroup.length - 1 ? true : false;
  }

  void reset() {
    _questionNumber = 0;
  }
}
