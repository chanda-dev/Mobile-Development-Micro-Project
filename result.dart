import 'dart:io';

class Result {
  String? question;
  String? name;
  String? id;
  String? answer;
  bool? isCorrect;

Result({this.id,this.isCorrect,this.name,this.question,this.answer});

  void saveResult(String Id,List<Result> results,int total) async {
    final file = File('quiz_results.txt');
    final sink = file.openWrite(mode: FileMode.append);

    for (Result result in results) {

      sink.writeln('Participant ID: $Id');
      sink.writeln('Name:${result.name}');
      sink.writeln('Question: ${result.question}');
      sink.writeln('Answer: ${result.answer}');
      sink.writeln('Correct: ${result.isCorrect}');
      sink.writeln('Score: $total');
      sink.writeln('--------------------');
    }

    await sink.flush();
    await sink.close();
  }

}