import 'package:json_annotation/json_annotation.dart';

part 'progress_dto.g.dart';

@JsonSerializable()
class ProgressDto {
  ProgressDto({this.currentLesson, this.totalScore, this.rating});

  factory ProgressDto.fromJson(Map<String, dynamic> json) {
    return _$ProgressDtoFromJson(json);
  }

  int? currentLesson;
  int? totalScore;
  double? rating;
}
