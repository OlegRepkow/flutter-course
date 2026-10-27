// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressDto _$ProgressDtoFromJson(Map<String, dynamic> json) => ProgressDto(
  currentLesson: (json['currentLesson'] as num?)?.toInt(),
  totalScore: (json['totalScore'] as num?)?.toInt(),
  rating: (json['rating'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ProgressDtoToJson(ProgressDto instance) =>
    <String, dynamic>{
      'currentLesson': instance.currentLesson,
      'totalScore': instance.totalScore,
      'rating': instance.rating,
    };
