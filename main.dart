
import 'dart:io';

import 'quiz.dart';

void main(List<String> args) {
  Quiz quiz = Quiz();
  

  int opt = 0;

  while (opt != 3) {
    print('Choose the option (1, 2 or 3)');
    print('1. Add question');
    print('2. Add participant');
    print('3. Exit');
    opt = int.parse(stdin.readLineSync() as String);

    switch (opt) {
      case 1:
        //question.addQuestion();
        quiz.addQuestion();
        break;

      case 2:
        
        quiz.addParticipant();
        break;

      case 3:
        break;

      default:
        print('Invalid option, please try again.');
        break;
    }
  }
    print('Start quiz');
    print('Please input your ID');
    String inputId = stdin.readLineSync() as String;
    quiz.startQuiz(inputId);
    print('Results saved for participant ID: $inputId');
  
    

    
  }
