import 'multipleChoice.dart';
import 'singleChoice.dart';

class Question {
  String? title;
  String? question;
  int? score;
  MultipleChoice? multipleChoice;
  SingleChoice? singleChoice;
  Question( {this.title, this.question, this.score,this.multipleChoice, this.singleChoice,});

  void displayQuestion() {
    print('Question: ${question} (Score: ${score})');
    List<String> allAnswers = [];
    
    if (multipleChoice != null) {
      allAnswers.addAll(multipleChoice!.correctAnswers);
      allAnswers.addAll(multipleChoice!.wrongAnswers);
    } else if (singleChoice != null) {
      allAnswers.add(singleChoice!.correctAnswer);
      allAnswers.add(singleChoice!.wrongAnswer);
    }

    // Shuffle the answers
    allAnswers.shuffle();
    
    print('Possible answers:');
    for (var answer in allAnswers) {
      print(answer);
    }
  }

  bool checkAnswer(String answer) {
    if (multipleChoice != null) {
      return multipleChoice!.correctAnswers.contains(answer);
    } else if (singleChoice != null) {
      return singleChoice!.correctAnswer == answer;
    }
    return false;
  }


}