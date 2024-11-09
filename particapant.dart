
import 'dart:io';

class Participant {
  String? name;
  String? id;
  int? age;
   Participant({this.name, this.id, this.age});

   void addParticipant() {
    print('Input the name of the participant:');
    name = stdin.readLineSync();
    print('Input the age:');
    age = int.parse(stdin.readLineSync() as String);
    print('Input the ID:');
    id = stdin.readLineSync() as String; 

  }

}