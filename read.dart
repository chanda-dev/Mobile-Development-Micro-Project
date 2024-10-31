import 'dart:io';

/// Reads a file and converts its contents into a list of maps.
List<Map<String, dynamic>> readFileToList(String filePath) {
  try {
    // Read all lines from the file and filter out empty lines.
    List<String> lines = File(filePath).readAsLinesSync();
    List<Map<String, dynamic>> dataList = lines
        .where((line) => line.isNotEmpty) // Keep only non-empty lines
        .map((line) => parseLine(line)) // Parse each line into a map
        .toList(); // Convert the iterable to a list

    return dataList;
  } catch (e) {
    print('Error reading file: $e');
    return []; // Return an empty list on error
  }
}

/// Parses a line of text into a map of key-value pairs.
Map<String, dynamic> parseLine(String line) {
  // Remove curly braces and whitespace, then split by comma.
  List<String> pairs = line.replaceAll(RegExp(r'[\{\}\s]'), '').split(',');

  // Create an empty map to hold the key-value pairs.
  Map<String, dynamic> dataMap = {};

  // Iterate through each pair and split it into key and value.
  for (var pair in pairs) {
    List<String> keyValue = pair.split(':');
    if (keyValue.length == 2) { // Ensure there's both a key and a value
      String key = keyValue[0].trim(); // Get the key
      String value = keyValue[1].trim(); // Get the value
      
      // Check if the value is a list (enclosed in brackets).
      if (value.startsWith('[') && value.endsWith(']')) {
        // Remove brackets and split into a list, trimming each item.
        value = value.substring(1, value.length - 1);
        dataMap[key] = value.split(',').map((v) => v.trim()).toList();
      } else {
        dataMap[key] = value; // Store the value directly
      }
    }
  }
  return dataMap; // Return the constructed map
}

List<Map<String, dynamic>> readFileToListOfparticipat(String filePath) {
  try {
    // Read all lines from the file and filter out empty lines.
    List<String> lines = File(filePath).readAsLinesSync();
    List<Map<String, dynamic>> dataList = lines
        .where((line) => line.isNotEmpty) // Keep only non-empty lines
        .map((line) => parseLineOfParticipant(line)) // Parse each line into a map
        .toList(); // Convert the iterable to a list

    return dataList;
  } catch (e) {
    print('Error reading file: $e');
    return []; // Return an empty list on error
  }
}

/// Parses a line of text into a map of key-value pairs.
Map<String, dynamic> parseLineOfParticipant(String line) {
  // Remove curly braces and whitespace, then split by comma.
  List<String> pairs = line.replaceAll(RegExp(r'[\{\}\s]'), '').split(',');

  // Create an empty map to hold the key-value pairs.
  Map<String, dynamic> dataMap = {};

  // Iterate through each pair and split it into key and value.
  for (var pair in pairs) {
    List<String> keyValue = pair.split(':');
    if (keyValue.length == 2) { // Ensure there's both a key and a value
      String key = keyValue[0].trim(); // Get the key
      String value = keyValue[1].trim(); // Get the value
      
      // Check if the value is a list (enclosed in brackets).
      if (value.startsWith('[') && value.endsWith(']')) {
        // Remove brackets and split into a list, trimming each item.
        value = value.substring(1, value.length - 1);
        dataMap[key] = value.split(',').map((v) => v.trim()).toList();
      } else {
        dataMap[key] = value; // Store the value directly
      }
    }
  }
  return dataMap; // Return the constructed map
}

void main() {
  String filePath = 'participant.txt'; // Specify the file path
  List<Map<String, dynamic>> data = readFileToListOfparticipat(filePath); // Read the file
  print(data); // Print the list of maps
}
