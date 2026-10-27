// ignore_for_file: avoid_print

import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_provider;

class FileStorage {
  FileStorage._();

  static final FileStorage instance = FileStorage._();

  Future<void> saveLargeString() async {
    const targetSizeInMB = 200;
    const charsCount = (targetSizeInMB * 1024 * 1024) ~/ 2;
    final bigString = 'A' * charsCount;

    final file = await _localFile;

    await file.writeAsString(bigString, mode: FileMode.append);
  }

  Future<void> printLargeStringToConsole() async {
    final file = await _localFile;
    final content = await file.readAsString();

    print('File content ${content.length} ');
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/large_string.txt');
  }

  Future<String> get _localPath async {
    final directory = await path_provider.getApplicationDocumentsDirectory();

    return directory.path;
  }
}
