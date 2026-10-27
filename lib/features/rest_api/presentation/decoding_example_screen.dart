// ignore_for_file: unused_field - it is ok for this file

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_lab/features/rest_api/encode_decode/models/person_dto/person_dto.dart';
import 'package:flutter_lab/features/rest_api/encode_decode/models/person_entity/person_entity.dart';

class JsonDecodingExampleScreen extends StatefulWidget {
  const JsonDecodingExampleScreen({super.key});

  @override
  State<JsonDecodingExampleScreen> createState() =>
      _JsonDecodingExampleScreenState();
}

class _JsonDecodingExampleScreenState extends State<JsonDecodingExampleScreen> {
  PersonEntity? _personEntity;

  @override
  void initState() {
    super.initState();
    final json = _getJson();
    final personMap = jsonDecode(json) as Map<String, dynamic>;

    final person = PersonDto.fromJson(personMap);

    _personEntity = PersonEntity.fromDto(person);
  }

  @override
  Widget build(BuildContext context) {
    if (_personEntity == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cabinet'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green.shade200,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Person info',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'First name: ${_personEntity?.name}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Last name: ${_personEntity?.lastName}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'Total score: ${_personEntity?.totalScore}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getJson() => '''
{
   "name":"Pavlo",
   "lastName":"Avdonin ",
   "age":30,
   "progress":{
      "currentLesson":26,
      "totalScore":78,
      "rating":4.5
   }
}
''';
}
