// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDto _$PersonDtoFromJson(Map<String, dynamic> json) => PersonDto(
  name: json['name'] as String?,
  lastName: json['lastName'] as String?,
  age: (json['age'] as num?)?.toInt(),
  progress: json['progress'] == null
      ? null
      : ProgressDto.fromJson(json['progress'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PersonDtoToJson(PersonDto instance) => <String, dynamic>{
  'name': instance.name,
  'lastName': instance.lastName,
  'age': instance.age,
  'progress': instance.progress,
};
