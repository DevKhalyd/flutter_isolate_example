// An example with simple Dart code.

import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

// An IsolateGroup object provides information about an isolate group in the VM.

/*
 Isolate groups enable performance optimizations such as sharing code; 
 a new isolate immediately runs the code owned by the isolate group. Also, 
 Isolate.exit() works only when the isolates are in the same isolate group.
 */
void main() async {
  // Read some data.
  final jsonData = await _parseInBackground();

  // Use that data
  print('Number of JSON keys: ${jsonData.length}');
}

// Spawns an isolate and waits for the first message
Future<Map<String, dynamic>> _parseInBackground() async {
  // Enables the worker isolate to send messages to the main isolate.
  final p = ReceivePort();
  // Creates a new isolate class in the same Isolate Group
  await Isolate.spawn(_readAndParseJson, p.sendPort);
  // Wait for the isolate to send a message. This case the first one
  return await p.first as Map<String, dynamic>;
}

Future<void> _readAndParseJson(SendPort p) async {
  final fileData = await File('.add/some/file/path').readAsString();
  final jsonData = jsonDecode(fileData);
  // Send the data back to the main isolate but not kill the isolate. Instead
  // copy the data and send it back. Which it's slower than the last case.
  // Ref: https://dart.dev/guides/language/concurrency#implementing-a-simple-worker-isolate (Last part)
  // p.send(jsonData);
  // Send the data back to the main isolate and kills the isolate
  Isolate.exit(p, jsonData);
}
