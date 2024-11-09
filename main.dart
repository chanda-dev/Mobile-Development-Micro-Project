
import 'dart:io';

import 'particapant.dart';
import 'question.dart';
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
        Question question = Question();
        question.addQuestion();
        quiz.addAllQuestion(question);
        break;

      case 2:
        
        Participant participant = Participant();
        participant.addParticipant();
        quiz.addAllParticipant(participant);
        break;

      case 3:
        break;

      default:
        print('Invalid option, please try again.');
        break;
    }
  }
    
    quiz.startQuiz();
  }
