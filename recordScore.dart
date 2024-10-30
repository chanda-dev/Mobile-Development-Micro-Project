import 'dart:io';

// Abstract class for Question
abstract class Question {
  String title;
  List<String> options;
  int score;

  Question(this.title, this.options, this.score);

  bool isCorrect(List<String> answer);
}

// SingleChoice subclass
class SingleChoice extends Question {
  String correctAnswer;

  SingleChoice(
      String title, List<String> options, this.correctAnswer, int score)
      : super(title, options, score);

  @override
  bool isCorrect(List<String> answer) {
    return answer.length == 1 && answer[0] == correctAnswer;
  }
}

// MultipleChoice subclass
class MultipleChoice extends Question {
  List<String> correctAnswers;

  MultipleChoice(
      String title, List<String> options, this.correctAnswers, int score)
      : super(title, options, score);

  @override
  bool isCorrect(List<String> answer) {
    return answer.toSet().containsAll(correctAnswers) &&
        correctAnswers.toSet().containsAll(answer);
  }
}

// Participant class
class Participant {
  String firstName;
  String lastName;
  int totalScore = 0;
  List<String> answers = [];

  Participant(this.firstName, this.lastName);

  String getFullName() => '$firstName $lastName';
}

// Quiz class
class Quiz {
  String title;
  List<Question> questions = [];
  List<Participant> participants = [];

  Quiz(this.title);

  void addQuestion(Question question) {
    questions.add(question);
  }

  void addParticipant(Participant participant) {
    participants.add(participant);
  }

  void startQuiz() {
    for (var participant in participants) {
      print('\nStarting quiz for ${participant.getFullName()}:');
      for (var question in questions) {
        print('\nQuestion: ${question.title}');
        for (int i = 0; i < question.options.length; i++) {
          print('${i + 1}. ${question.options[i]}');
        }

        print('\nEnter your answer(s):');
        var answers =
            stdin.readLineSync()!.split(',').map((s) => s.trim()).toList();
        participant.answers
            .add('Q: ${question.title}, Your Answer: ${answers.join(", ")}');

        if (question.isCorrect(answers)) {
          print("Correct! You earned ${question.score} points.");
          participant.totalScore += question.score;
        } else {
          print("Incorrect.");
        }
      }
    }
  }

  void saveResults() {
    var file = File('quiz_results.txt');
    var sink = file.openWrite();

    sink.writeln('Quiz Results for: $title\n');
    for (var participant in participants) {
      sink.writeln(
          '${participant.getFullName()} scored: ${participant.totalScore}');
      sink.writeln('Answers:');
      for (var answer in participant.answers) {
        sink.writeln(answer);
      }
      sink.writeln('---\n');
    }

    sink.close();
    print('Results saved to quiz_results.txt');
  }
}

void main() {
  var quiz = Quiz('General Knowledge Quiz');

  // Input for questions and scores
  while (true) {
    print('\nAdd a question to the quiz:');
    print('Enter question title:');
    String title = stdin.readLineSync()!;

    print('Enter answer options (comma-separated):');
    List<String> options =
        stdin.readLineSync()!.split(',').map((s) => s.trim()).toList();

    print('Is this a single-choice question? (yes/no)');
    bool isSingleChoice = stdin.readLineSync()!.toLowerCase() == 'yes';

    print('Enter correct answer(s) (comma-separated):');
    List<String> correctAnswers =
        stdin.readLineSync()!.split(',').map((s) => s.trim()).toList();

    print('Enter the score for this question:');
    int score = int.parse(stdin.readLineSync()!);

    if (isSingleChoice) {
      quiz.addQuestion(SingleChoice(title, options, correctAnswers[0], score));
    } else {
      quiz.addQuestion(MultipleChoice(title, options, correctAnswers, score));
    }

    print('Do you want to add another question? (yes/no)');
    if (stdin.readLineSync()!.toLowerCase() != 'yes') break;
  }

  // Input for participants
  while (true) {
    print('\nEnter participant first name:');
    String firstName = stdin.readLineSync()!;

    print('Enter participant last name:');
    String lastName = stdin.readLineSync()!;

    quiz.addParticipant(Participant(firstName, lastName));

    print('Do you want to add another participant? (yes/no)');
    if (stdin.readLineSync()!.toLowerCase() != 'yes') break;
  }

  // Start quiz and show results
  quiz.startQuiz();

  // Save results to a file
  quiz.saveResults();
}
