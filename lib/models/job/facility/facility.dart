import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ioniconf_2021_flutter/models/job/facilities_description/facilities_description.dart';


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
    @JsonKey(name: 'fac_latitude') double? facLatitude,
    @JsonKey(name: 'fac_longitude') double? facLongitude,
    @JsonKey(name: 'fac_number_of_beds') int? facNumberOfBeds,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'facilities_description')
        FacilitiesDescription? facilitiesDescription,
  }) = _Facility;

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);
}
