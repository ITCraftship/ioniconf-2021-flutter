import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialty.freezed.dart';
part 'specialty.g.dart';

@freezed
class Specialty with _$Specialty {
  factory Specialty({
    @JsonKey(name: 'specialty_title') String? specialtyTitle,
    @JsonKey(name: 'specialty_acronym') String? specialtyAcronym,
  }) = _Specialty;

  factory Specialty.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyFromJson(json);
}
