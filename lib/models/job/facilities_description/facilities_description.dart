import 'package:freezed_annotation/freezed_annotation.dart';

part 'facilities_description.freezed.dart';
part 'facilities_description.g.dart';

@freezed
class FacilitiesDescription with _$FacilitiesDescription {
  factory FacilitiesDescription({
    @JsonKey(name: 'state_abbreviation') String? stateAbbreviation,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'insert_date') String? insertDate,
  }) = _FacilitiesDescription;

  factory FacilitiesDescription.fromJson(Map<String, dynamic> json) =>
      _$FacilitiesDescriptionFromJson(json);
}
