class Questionclass {

  Questionclass();
  List<Map<String,dynamic>> questionList = [
  ];

  void addQuestion(List<Map<String,dynamic>> questionList,String ques, List<String> rightAnswer, List<String> wrongAnswer){
    Map<String,dynamic> newQues = {
      'question':ques,
      'rightAnswer': rightAnswer,
      'wrong': wrongAnswer
    };
    questionList.add(newQues);
  }

}

void main(List<String> args) {
  Questionclass q1 = Questionclass();
  q1.addQuestion(q1.questionList, 'what is the name of user', ['chanda','Livinda'], ['ratha','makara']);
  print(q1.questionList);
}