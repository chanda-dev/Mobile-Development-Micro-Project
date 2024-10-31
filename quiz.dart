import 'dart:io';
import 'read.dart';
import 'multipleChoice.dart';
import 'particapant.dart';
import 'question.dart';
import 'singleChoice.dart';
class Quiz {
  final List<Map<String,dynamic>> listQuestion = [
    // {
    //   'title':'code',
    //   'question':'what is java',
    //   'singleCorrectAnswer':'dd',
    //   'singleWrongAnswer':'dd',
    //   'multipleCorrectAnswer':'dd',
    //   'multipleWrongAnswer':'dd'
    // },
    // {

    // }
  ];
  final List<Map<String,dynamic>> particapant = [];

  
  Question? q;
  Particapant? p;
  Singlechoice? s;
  Multiplechoice? m;
  Quiz({this.q,this.p,this.m,this.s});
  void addQuestion() {
    
    Map<String,String> newList = {
      'title':'${q!.title}',
      'question':'${q!.question}',
      'singleCorrectAnswer':'${s?.correctAnswer}',
      'singleWrongAnswer':'${s?.wrongAnswer}',
      'multipleCorrectAnswer':'${m?.correctAnswer}',
      'multipleWrongAnswer':'${m?.wrongAnswer}'
    };
    listQuestion.add(newList);
  }

  void addParticipant(){
    Map<String,dynamic> newParticapant = {
      'name':p!.name,
      'age':p!.age,
      'ID':p!.id
    };
    for(var i = 0;i<listQuestion.length;i++){
      if(newParticapant['ID'] == particapant[i]['ID']){
        throw Exception('This ID "${newParticapant['ID']}" already added');
      }
    }
    particapant.add(newParticapant);
  }

  List<Map<String, dynamic>> getListquestion(){
    String filePath = 'question.txt'; 
    List<Map<String, dynamic>> data = readFileToList(filePath);
    for(var i = 0;i<data.length;i++){
      listQuestion.add(data[i]);
    }
    return listQuestion;
  }

  List<Map<String, dynamic>> getListParticipant(){
    String filePath2 = 'participant.txt';
    List<Map<String, dynamic>> data2 = readFileToListOfparticipat(filePath2);
    for(var i = 0; i<data2.length;i++){
      particapant.add(data2[i]);
    }
    return particapant;
  }
  
  
  
}




void main(List<String> args) async {
  var file = File('question.txt');
  // var sink = file.openWrite();
  var sink = file.openWrite(mode: FileMode.append);
  var file2 = File('participant.txt');
  var sink2 = file2.openWrite(mode: FileMode.append);
  
    List<Quiz> quizees = [];
    List<Quiz> particapants = [];
    Question q1 = Question(title: 'math',question: '3+2',score: 10);
    Singlechoice s1 = Singlechoice(correctAnswer: '5', wrongAnswer: '6');
    quizees.add( Quiz(q: q1,s: s1));
    Question q2 = Question(title: 'code',question: 'what is HTML',score: 20);
    Singlechoice s2 = Singlechoice(correctAnswer: 'makeup language', wrongAnswer: 'programing language');
    Multiplechoice m2 = Multiplechoice(correctAnswer: ['sript language','Pos language'], wrongAnswer: ['XOXO','GGG']);
    quizees.add(Quiz(q: q2,s: s2,m: m2));
    Particapant p1 = Particapant(id: 090200);
    Particapant p2 = Particapant(id: 090300);
    particapants.add(Quiz(p: p1,));
    particapants.add(Quiz(p: p2));
    for (Quiz quiz in quizees) {
      try{
        quiz.addQuestion();
        
      }catch(e){
        print(e);
      }
      for(var i = 0;i<quiz.listQuestion.length;i++){
        sink.write('${quiz.listQuestion[i]}\n');
      }
  }
  for(Quiz particapant in particapants){
    particapant.addParticipant();
    for(var i = 0;i<particapant.particapant.length;i++){
      sink2.write('${particapant.particapant[i]}\n');
    }
  }
  
    await sink.flush();
    await sink.close();
    await sink2.flush();
    await sink2.close();

    
  
}