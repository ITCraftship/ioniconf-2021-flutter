import 'package:freezed_annotation/freezed_annotation.dart';

import '../specialty/specialty.dart';

part 'job_specialties.freezed.dart';
part 'job_specialties.g.dart';

@freezed
class JobSpecialties with _$JobSpecialties {
  factory JobSpecialties({
    @JsonKey(name: 'specialty') Specialty? specialty,
  }) = _JobSpecialties;

  factory JobSpecialties.fromJson(Map<String, dynamic> json) =>
      _$JobSpecialtiesFromJson(json);
}
