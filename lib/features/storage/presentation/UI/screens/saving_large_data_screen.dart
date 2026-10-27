// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_lab/core/storage/file_storage/file_storage.dart';
import 'package:flutter_lab/core/storage/prefs_storage/prefs_storage.dart';

// 1. Показати через DevTools як забивається пам'ять у разі використання Shared Preferences
// 2. Показати через DevTools як забивається пам'ять у разі використання File Storage

class SavingLargeDataScreen extends StatelessWidget {
  const SavingLargeDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saving Large Data'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: PrefsStorage.instance.saveLargeString,
              child: const Text('Save Large String in Shared Preferences'),
            ),
            ElevatedButton(
              onPressed: FileStorage.instance.saveLargeString,
              child: const Text('Save Large String in Internal Storage'),
            ),
            ElevatedButton(
              onPressed: FileStorage.instance.printLargeStringToConsole,
              child: const Text('Print Large String to console'),
            ),
          ],
        ),
      ),
    );
  }
}
