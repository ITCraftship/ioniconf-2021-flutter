import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ioniconf_2021_flutter/models/job/specialty/specialty.dart';

part 'job_specialties.freezed.dart';
part 'job_specialties.g.dart';

@freezed
class JobSpecialties with _$JobSpecialties {
  factory JobSpecialties({
    @JsonKey(name: 'job_id') String? jobId,
    @JsonKey(name: 'specialty_id') int? specialtyId,
    @JsonKey(name: 'insert_date') String? insertDate,
    @JsonKey(name: 'specialty') Specialty? specialty,
  }) = _JobSpecialties;

  factory JobSpecialties.fromJson(Map<String, dynamic> json) =>
      _$JobSpecialtiesFromJson(json);
}
