import 'quiz.dart';

void main(List<String> args) {
  // answerQuiz(90200);
  Quiz qui = Quiz();
  List<Map<String, dynamic>> listQu = qui.getListquestion();
  for(var i = 0;i<listQu.length;i++){
    if(listQu[i]['title'] == 'math'){
      print(listQu[i]);
    }
    
  }
  //print(qui.getListquestion());
}

// void answerQuiz(int? id){
//     Quiz q5 = Quiz();
//     String filePath = 'question.txt'; // Specify the file path
//     String filePath2 = 'participant.txt';
//     List<Map<String, dynamic>> data = readFileToList(filePath); // Read the file
//     List<Map<String, dynamic>> data2 = readFileToListOfparticipat(filePath2);
//     for(var i = 0;i<data.length;i++){
//       q5.listQuestion.add(data[i]);
//     }
//     for(var i = 0; i<data2.length;i++){
//       q5.particapant.add(data2[i]);
//     }
//     print(q5.particapant);
//     bool particapantFound = false;
//     for(var i = 0; i<data2.length;i++){
//       print(q5.listQuestion);
//       if(data2[i]['ID'] == '$id'){
//         particapantFound = true;
//       } 
//     }
//     if(particapantFound){
//       print('quiz start');
//       print('choose the title');
//       for(i = 0;i<data.length;i++){
//         print(data.where((e)=>e[i]['title'] == 'code'));
//       }
//     }
    
//   }