import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialties.freezed.dart';
part 'specialties.g.dart';

@freezed
class Specialties with _$Specialties {
  factory Specialties({
    @JsonKey(name: 'specialty_id') int? specialtyId,
    @JsonKey(name: 'specialty_acronym') String? specialtyAcronym,
    @JsonKey(name: 'specialty_title') String? specialtyTitle,
    @JsonKey(name: 'specialty_desc') String? specialtyDesc,
    @JsonKey(name: 'specialty_color') String? specialtyColor,
    @JsonKey(name: 'specialty_meta_description')
        Object? specialtyMetaDescription,
    @JsonKey(name: 'insert_date') String? insertDate,
  }) = _Specialties;

  factory Specialties.fromJson(Map<String, dynamic> json) =>
      _$SpecialtiesFromJson(json);
}
