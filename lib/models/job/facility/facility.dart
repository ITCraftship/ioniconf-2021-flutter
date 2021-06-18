import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility.freezed.dart';
part 'facility.g.dart';

@freezed
class Facility with _$Facility {
  factory Facility({
    @JsonKey(name: 'fac_dp_primary_id') String? facDpPrimaryId,
    @JsonKey(name: 'fac_name') String? facName,
    @JsonKey(name: 'fac_street_address') String? facStreetAddress,
    @JsonKey(name: 'fac_city') String? facCity,
    @JsonKey(name: 'fac_zip_code') String? facZipCode,
    @JsonKey(name: 'fac_state_abbreviation') String? facStateAbbreviation,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'fac_system') Object? facSystem,
    @JsonKey(name: 'no_distance') bool? noDistance,
    @JsonKey(name: 'fac_number_of_beds') int? facNumberOfBeds
  }) = _Facility;

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);
}
