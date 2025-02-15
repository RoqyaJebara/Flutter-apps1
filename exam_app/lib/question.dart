class Question {
  String questionText="";//Q
  String questionImage="";//correct answer initial value
  bool questionAnswer=false;
  Question({required String q,required String i,required bool a}) {
    questionText = q;//required
    questionImage = i;
    questionAnswer = a;
  }
}
