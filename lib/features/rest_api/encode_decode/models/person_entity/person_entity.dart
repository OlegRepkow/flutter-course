import 'package:flutter_lab/features/rest_api/encode_decode/models/person_dto/person_dto.dart';

class PersonEntity {
  PersonEntity({
    required this.name,
    required this.lastName,
    required this.totalScore,
  });

  PersonEntity.fromDto(PersonDto dto)
    : name = dto.name ?? '',
      lastName = dto.lastName ?? '',
      totalScore = dto.progress?.totalScore ?? 0;

  final String name;
  final String lastName;
  final int totalScore;
}
