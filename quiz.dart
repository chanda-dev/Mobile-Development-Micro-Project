import 'dart:io';
import 'multipleChoice.dart';
import 'particapant.dart';
import 'question.dart';
import 'result.dart';
import 'singleChoice.dart';

class Quiz {
  List<Question> questions = [];
  List<Participant> particapants = [];
  List<Result> results = [];

  void addQuestion(){
      print('Enter the title of the question:');
    String? title = stdin.readLineSync();
    print('Enter the question:');
    String?  ques = stdin.readLineSync();
    print('Enter the Score:');
    int score = int.parse(stdin.readLineSync() as String);
    print('Does your question have multiple correct answers (yes/no)?');
    String? multi = stdin.readLineSync()!.toLowerCase();

    if (multi == 'yes') {
      print('Please input your correct answers separated by commas:');
      List<String> correct = stdin.readLineSync()!.split(',');
      print('Input your wrong answers separated by commas:');
      List<String> wrong = stdin.readLineSync()!.split(',');
      MultipleChoice multipleChoice = MultipleChoice(correctAnswers: correct, wrongAnswers: wrong);

      Question question = Question(multipleChoice: multipleChoice,title: title,score: score,question: ques);
      questions.add(question);
    } else if (multi == 'no') {
      print('Please input your correct answer:');
      String? correct = stdin.readLineSync() as String;
      print('Input your wrong answer:');
      String? wrong = stdin.readLineSync() as String;
      SingleChoice singleChoice = SingleChoice(correctAnswer: correct, wrongAnswer: wrong);
      Question question = Question(singleChoice: singleChoice,title: title,score: score,question: ques);
      questions.add(question);
    }

    
  }

  void addParticipant() {
    print('Input the name of the participant:');
    String? name = stdin.readLineSync();
    print('Input the age:');
    int? age = int.parse(stdin.readLineSync() as String);
    print('Input the ID:');
    String participantId = stdin.readLineSync() as String; 
    Participant participant = Participant(name: name,age: age,id: participantId);
    particapants.add(participant);

  }

  void startQuiz(String inputid){
    int totalScore = 0;
    if (particapants.any((p) => p.id == inputid)) {
      //totalScore = 0;
      for (Question quiz in questions) {
        quiz.displayQuestion();
        String answer = stdin.readLineSync()!;
        bool isCorrect = quiz.checkAnswer(answer);
        if (isCorrect) {
          totalScore += quiz.score!; 
        }

        for(Participant parti in particapants){
          results.add(Result(question: quiz.question,name: parti.name,id: parti.id,isCorrect: isCorrect,answer: answer));
        }
          
      }
      Result re = Result();
      re.saveResult(inputid,results,totalScore);

    } else {
      print('Invalid ID, please try again.');
    }
  }

}