import 'quiz.dart';

class Question {
  final String? title;
  final String? question;
  List<String> option = [];
  int? score;

  Question({required this.title,required this.question,required this.score});


  bool isCorrect(List<String> answer){
    return false;
  }

}

