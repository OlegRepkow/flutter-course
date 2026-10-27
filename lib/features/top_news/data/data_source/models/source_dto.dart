import 'package:json_annotation/json_annotation.dart';

part 'source_dto.g.dart';

@JsonSerializable()
class SourceDto {
  SourceDto({this.id, this.name});

  factory SourceDto.fromJson(Map<String, dynamic> json) {
    return _$SourceDtoFromJson(json);
  }

  dynamic id;
  String? name;
}
