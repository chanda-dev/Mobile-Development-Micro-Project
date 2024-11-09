import 'dart:io';
import 'particapant.dart';
import 'question.dart';
import 'result.dart';

class Quiz {
  List<Participant> participants = [];
  List<Result> results = [];
  List<Question> questions = [];
  void addAllQuestion(Question question){
    questions.add(question);
  }
  

  void addAllParticipant(Participant participant){
    participants.add(participant);
  }

  bool checkAnswer(String answer, Question ques) {
    if (ques.multipleChoice != null) {
      return ques.multipleChoice!.correctAnswers.contains(answer);
    } else if (ques.singleChoice != null) {
      return ques.singleChoice!.correctAnswer == answer;
    }
    return false;
  }

  void startQuiz(List<Question> questions, List<Participant> participants) {
  print('Start quiz');
  print('Please input your ID');
  String inputId = stdin.readLineSync() as String;
  int totalScore = 0;

  Participant? participant = participants.firstWhere((p) => p.id == inputId);
  for (Question quiz in questions) {
    quiz.displayQuestion();
    String answer = stdin.readLineSync()!;
    bool isCorrect = checkAnswer(answer, quiz);

    if (isCorrect) {
      totalScore += quiz.score!;
    }
    results.add(Result(question: quiz.question,id: participant.id,name: participant.name,isCorrect: isCorrect,answer: answer,));
  }

  // Save results for participant
  Result re = Result(name: participant.name);
  re.saveResult(inputId, results, totalScore);
  print('Results saved for participant ID: $inputId');
}

}