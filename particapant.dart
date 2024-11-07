import 'dart:io';

class Participant {
  String? name;
  String? id;
  int? age;

   Participant({this.name, this.id, this.age});

   
  void addParticipant() {
    print('Input the name of the participant:');
    String? name = stdin.readLineSync();
    print('Input the age:');
    int? age = int.parse(stdin.readLineSync() as String);
    print('Input the ID:');
    String participantId = stdin.readLineSync() as String; 
    this.age = age;
    this.id = participantId;
    this.name = name;
  }
}