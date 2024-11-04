import 'dart:io';

class Participant {
  final String? name;
  final int id; // ID must be required
  final int? age;

  Participant({this.name, required this.id, this.age});

  // Method to create and return a new participant instance
  static Participant addParticipant() {
    print('Input the name of the participant:');
    String? name = stdin.readLineSync();
    print('Input the age:');
    int? age = int.parse(stdin.readLineSync() as String); // Use tryParse for safety
    print('Input the ID:');
    int? participantId = int.parse(stdin.readLineSync() as String) ?? 0; // Use tryParse for safety

    return Participant(name: name, id: participantId, age: age);
  }
}