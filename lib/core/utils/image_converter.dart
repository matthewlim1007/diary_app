import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart'; // Import the necessary package for XFile

/// Function to convert XFile to base64
String xFileToBase64(XFile xFile) {
  final imageBytes = File(xFile.path).readAsBytesSync();
  return base64Encode(imageBytes);
}

/// Function to convert a list of XFile to a list of base64 strings
List<String> xFilesToBase64List(List<XFile> xFiles) {
  final base64List = <String>[];
  for (final xFile in xFiles) {
    base64List.add(xFileToBase64(xFile));
  }
  return base64List;
}
