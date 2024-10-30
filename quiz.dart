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
      'singleCorrectAnswer':'${s!.correctAnswer}',
      'singleWrongAnswer':'${s!.wrongAnswer}',
      'multipleCorrectAnswer':'${m!.correctAnswer}',
      'multipleWrongAnswer':'${m!.wrongAnswer}'
    };
    for(var i = 0;i<listQuestion.length;i++){
      if(newList['title'] == listQuestion[i]['title'] && newList['question'] == listQuestion[i]['question']){
        throw Exception('This question "${newList['question']}" already exist in ${newList['title']}');
      }
    }
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

  void answerQuiz(int id){
    
  }
  
}


void main(List<String> args) async {
  var file = File('file.txt');
  // var sink = file.openWrite();
  var sink = file.openWrite(mode: FileMode.append);
  List<Quiz> quizees = [];
  
    Question q1 = Question(title: 'code',question: 'what is java',score: 10);
    Singlechoice s1 = Singlechoice(correctAnswer: 'programing language', wrongAnswer: 'makeup language');
    Multiplechoice m1 = Multiplechoice(correctAnswer: ['sript language','Pos language'], wrongAnswer: ['GG','XOXO']);
    quizees.add( Quiz(q: q1,s: s1,m: m1));

    //print(qu1.listQuestion);
    Question q2 = Question(title: 'code',question: 'what is HTML',score: 20);
    Singlechoice s2 = Singlechoice(correctAnswer: 'makeup language', wrongAnswer: 'programing language');
    Multiplechoice m2 = Multiplechoice(correctAnswer: ['sript language','Pos language'], wrongAnswer: ['XOXO','GGG']);
    quizees.add(Quiz(q: q2,s: s2,m: m2));
    print(quizees);
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
    await sink.flush();
    await sink.close();
    
  
}