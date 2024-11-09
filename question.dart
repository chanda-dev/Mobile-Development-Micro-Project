import 'dart:io';
import 'multipleChoice.dart';
import 'singleChoice.dart';

class Question {
  String? title;
  String? question;
  int? score;
  MultipleChoice? multipleChoice;
  SingleChoice? singleChoice;
  Question( {this.title, this.question, this.score,this.multipleChoice, this.singleChoice,});

  void addQuestion(){
    print('Enter the title of the question:');
    title = stdin.readLineSync();
    print('Enter the question:');
    question = stdin.readLineSync();
    print('Enter the Score:');
    score = int.parse(stdin.readLineSync() as String);
    print('Does your question have multiple correct answers (yes/no)?');
    String? multi = stdin.readLineSync()!.toLowerCase();

    if (multi == 'yes') {
      print('Please input your correct answers separated by commas:');
      List<String> correct = stdin.readLineSync()!.split(',');
      print('Input your wrong answers separated by commas:');
      List<String> wrong = stdin.readLineSync()!.split(',');
       multipleChoice = MultipleChoice(correctAnswers: correct, wrongAnswers: wrong);

    } else if (multi == 'no') {
      print('Please input your correct answer:');
      String? correct = stdin.readLineSync() as String;
      print('Input your wrong answer:');
      String? wrong = stdin.readLineSync() as String;
      singleChoice = SingleChoice(correctAnswer: correct, wrongAnswer: wrong); 
    }
  }

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



}