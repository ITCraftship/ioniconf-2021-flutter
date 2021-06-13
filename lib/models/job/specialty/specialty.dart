import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialty.freezed.dart';
part 'specialty.g.dart';

@freezed
class Specialty with _$Specialty {
  factory Specialty({
    @JsonKey(name: 'specialty_id') int? specialtyId,
    @JsonKey(name: 'specialty_acronym') String? specialtyAcronym,
    @JsonKey(name: 'specialty_title') String? specialtyTitle,
    @JsonKey(name: 'specialty_desc') String? specialtyDesc,
    @JsonKey(name: 'specialty_color') String? specialtyColor,
    @JsonKey(name: 'specialty_meta_description')
        Object? specialtyMetaDescription,
    @JsonKey(name: 'insert_date') String? insertDate,
  }) = _Specialty;

  factory Specialty.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyFromJson(json);
}
