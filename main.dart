import 'dart:io';
import 'particapant.dart';
import 'singleChoice.dart';
import 'multipleChoice.dart';
import 'question.dart';
import 'quiz.dart';

void main(List<String> args) async {
  var questionFile = File('question.txt');
  var participantFile = File('participant.txt');
  
  // Initialize lists to hold quizzes and participants
  List<Quiz> quizees = [];
  List<Quiz> participants = [];

  print('Please input your ID');
  int id = int.parse(stdin.readLineSync() as String);

  if (id == 1) {
    int opt = 0;

    while (opt != 3) {
      print('Choose the option (1, 2 or 3)');
      print('1. Add question');
      print('2. Add participant');
      print('3. Exit');
      opt = int.parse(stdin.readLineSync() as String);

      switch (opt) {
        case 1:
          print('Enter the title of the question');
          String? title = stdin.readLineSync();
          print('Enter the question');
          String? question = stdin.readLineSync();
          print('Enter the Score');
          int? score = int.parse(stdin.readLineSync() as String);
          print('Does your question have multiple correct answers (yes/no)?');
          String? multi = stdin.readLineSync()!.toLowerCase();

          if (multi == 'yes') {
            print('Please input your answers separated by commas:');
            List<String> correct = stdin.readLineSync()!.split(',');
            print('Input your wrong answers separated by commas:');
            List<String> wrong = stdin.readLineSync()!.split(',');

            Question questions = Question(title: title, question: question, score: score);
            Multiplechoice multiplechoice = Multiplechoice(correctAnswer: correct, wrongAnswer: wrong);
            quizees.add(Quiz(q: questions, m: multiplechoice));
          } else if (multi == 'no') {
            print('Please input your correct answer:');
            String? correct = stdin.readLineSync();
            print('Input your wrong answer:');
            String? wrong = stdin.readLineSync();

            Question questions = Question(title: title, question: question, score: score);
            Singlechoice singleChoice = Singlechoice(correctAnswer: correct, wrongAnswer: wrong);
            quizees.add(Quiz(q: questions, s: singleChoice));
          }
          break;

        case 2:
          print('Input the name of the participant:');
          String? name = stdin.readLineSync();
          print('Input the age:');
          int? age = int.parse(stdin.readLineSync() as String);
          print('Input the ID:');
          int? participantId = int.parse(stdin.readLineSync() as String);

          Particapant participant = Particapant(id: participantId, name: name, age: age);
          participants.add(Quiz(p: participant));
          break;

        case 3:
          break;

        default:
          print('Invalid option, please try again.');
          break;
      }
    }

    // Write questions to file
    var questionSink = questionFile.openWrite(mode: FileMode.append);
    for (Quiz quiz in quizees) {
      quiz.addQuestion();
      for (var question in quiz.listQuestion) {
        questionSink.writeln(question);
      }
    }
    await questionSink.flush();
    await questionSink.close();

    // Write participants to file
    var participantSink = participantFile.openWrite(mode: FileMode.append);
    for(Quiz parti in participants){
      parti.addParticipant();
        for (var participan in parti.particapant) {
      participantSink.writeln(participan);
    }
    }
    
    await participantSink.flush();
    await participantSink.close();
  }
}
