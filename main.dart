import 'dart:io';

import 'multipleChoice.dart';
import 'particapant.dart';
import 'question.dart';
import 'quiz.dart';
import 'singleChoice.dart';


void saveResults(int participantId, int totalScore) async {
  final file = File('quiz_results.txt');
  final sink = file.openWrite(mode: FileMode.append); // Open file for writing

  // Write the results
  sink.writeln('Participant ID: $participantId, Total Score: $totalScore');

  // Close the sink
  await sink.flush();
  await sink.close();
}

void main(List<String> args) {
  // Initialize lists to hold quizzes and participants
  List<Quiz> quizzes = [];
  List<Participant> participants = [];

  int opt = 0;
  int totalScore = 0;

  while (opt != 3) {
    print('Choose the option (1, 2 or 3)');
    print('1. Add question');
    print('2. Add participant');
    print('3. Exit');
    opt = int.parse(stdin.readLineSync() as String);

    switch (opt) {
      case 1:
        print('Enter the title of the question:');
        String? title = stdin.readLineSync();
        print('Enter the question:');
        String? question = stdin.readLineSync();
        print('Enter the Score:');
        int? score = int.parse(stdin.readLineSync() as String);
        print('Does your question have multiple correct answers (yes/no)?');
        String? multi = stdin.readLineSync()!.toLowerCase();

        if (multi == 'yes') {
          print('Please input your correct answers separated by commas:');
          List<String> correct = stdin.readLineSync()!.split(',');
          print('Input your wrong answers separated by commas:');
          List<String> wrong = stdin.readLineSync()!.split(',');

          Question newQuestion = Question(title: title, question: question, score: score);
          MultipleChoice mc = MultipleChoice(correctAnswers: correct, wrongAnswers: wrong);
          quizzes.add(Quiz(question: newQuestion, multipleChoice: mc));
        } else if (multi == 'no') {
          print('Please input your correct answer:');
          String? correct = stdin.readLineSync() as String;
          print('Input your wrong answer:');
          String? wrong = stdin.readLineSync() as String;

          Question newQuestion = Question(title: title, question: question, score: score);
          SingleChoice sc = SingleChoice(correctAnswer: correct, wrongAnswer: wrong);
          quizzes.add(Quiz(question: newQuestion, singleChoice: sc));
        }
        break;

      case 2:
        
        Participant participant = Participant.addParticipant();
        participants.add(participant); 
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
    int inputId = int.parse(stdin.readLineSync() as String);
    if (participants.any((p) => p.id == inputId)) {
      totalScore = 0; // Reset score for each participant
      for (Quiz quiz in quizzes) {
        quiz.displayQuestion(); // Display the question
        String answer = stdin.readLineSync()!;
        bool isCorrect = quiz.checkAnswer(answer); // Check if the answer is correct
        if (isCorrect) {
          totalScore += quiz.question.score!; // Add score if correct
        }
      }
      // Save results to a file
      saveResults(inputId, totalScore);
    } else {
      print('Invalid ID, please try again.');
    }

    print('Results saved for participant ID: $inputId');
  }
