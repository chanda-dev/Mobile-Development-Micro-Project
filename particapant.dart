import 'dart:io';

class Participant {
  final String? name;
  final int id;
  final int? age;

  Participant({this.name, required this.id, this.age});
  static Participant addParticipant() {
    print('Input the name of the participant:');
    String? name = stdin.readLineSync();
    print('Input the age:');
    int? age = int.parse(stdin.readLineSync() as String);
    print('Input the ID:');
    int? participantId = int.parse(stdin.readLineSync() as String); 

    return Participant(name: name, id: participantId, age: age);
  }
}