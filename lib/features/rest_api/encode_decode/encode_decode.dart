// ignore_for_file: avoid_print - для цього файлу це нормально
// ignore_for_file: omit_local_variable_types - лишаємо явні типи, щоб сирий
// JSON-рядок візуально відрізнявся від розпарсеного Map

/// Покроковий розбір серіалізації JSON.
///
/// Показаний тут потік: сирий JSON-рядок -> `jsonDecode` -> динамічний
/// `Map<String, dynamic>` -> типізований [PersonDto] (data transfer object,
/// що повторює форму відповіді API) -> [PersonEntity] (доменна модель, яку
/// насправді використовує UI). Розділення DTO та Entity ізолює застосунок
/// від змін в API.
///
/// DTO-класи можна писати вручну, генерувати через `json_serializable` або
/// формувати зі зразка JSON за допомогою інструментів на кшталт
/// https://dart-quicktype.netlify.app/ чи розширення VS Code "JSON to Dart".
/// `jsonEncode` робить зворотне (об'єкт -> рядок), напр. для кешування.
library;

import 'dart:convert';

import 'package:flutter_lab/features/rest_api/encode_decode/models/person_dto/person_dto.dart';
import 'package:flutter_lab/features/rest_api/encode_decode/models/person_entity/person_entity.dart';

void main() {
  const String json = personJson;
  final personMap = jsonDecode(json) as Map<String, dynamic>;

  final person = PersonDto.fromJson(personMap);

  final personEntity = PersonEntity.fromDto(person);

  final currentLesson = personEntity.totalScore;
  final totalScore = personEntity.totalScore;
  final rating = personEntity.totalScore;

  print('currentLesson: $currentLesson');
  print('totalScore: $totalScore');
  print('rating: $rating');
}

const personJson = '''
{
   "name":"Pavlo",
   "lastName":"Avdonin",
   "age":30,
   "progress":{
      "currentLesson":26,
      "totalScore":78,
      "rating":4.5
   }
}
''';
