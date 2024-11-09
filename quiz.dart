import 'dart:io';
import 'multipleChoice.dart';
import 'particapant.dart';
import 'question.dart';
import 'result.dart';
import 'singleChoice.dart';

class Quiz {
  Question? question;
  // MultipleChoice? multipleChoice;
  // SingleChoice? singleChoice;

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
    //Question questionss = Question();
    
    if (ques.multipleChoice != null) {
      return ques.multipleChoice!.correctAnswers.contains(answer);
    } else if (ques.singleChoice != null) {
      return ques.singleChoice!.correctAnswer == answer;
    }
    return false;
  }

  void startQuiz(){
    print('Start quiz');
    print('Please input your ID');
    String inputId = stdin.readLineSync() as String;
    int totalScore = 0;
    if (participants.any((p) => p.id == inputId)) {
      //totalScore = 0;
      for (Question quiz in questions) {
        quiz.displayQuestion();
        String answer = stdin.readLineSync()!;
        bool isCorrect = checkAnswer(answer,quiz);
        if (isCorrect) {
          totalScore += quiz.score!; 
        }

        for(Participant parti in participants){
          results.add(Result(question: quiz.question,name: parti.name,id: parti.id,isCorrect: isCorrect,answer: answer));
        }
          
      }
      Result re = Result();
      re.saveResult(inputId,results,totalScore);

    } else {
      print('Invalid ID, please try again.');
    }

    print('Results saved for participant ID: $inputId');
  }

}