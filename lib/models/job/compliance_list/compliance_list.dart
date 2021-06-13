import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ioniconf_2021_flutter/models/job/credential_list/credential_list.dart';
import 'package:ioniconf_2021_flutter/models/job/specialties/specialties.dart';

part 'compliance_list.freezed.dart';
part 'compliance_list.g.dart';

@freezed
class ComplianceList with _$ComplianceList {
  factory ComplianceList({
    @JsonKey(name: 'credential_list_id') int? credentialListId,
    @JsonKey(name: 'facility_id') String? facilityId,
    @JsonKey(name: 'specialty_id') int? specialtyId,
    @JsonKey(name: 'licenseType') String? licenseType,
    @JsonKey(name: 'insert_date') String? insertDate,
    @JsonKey(name: 'update_date') String? updateDate,
    @JsonKey(name: 'credentialList') List<CredentialList>? credentialList,
    @JsonKey(name: 'specialties') List<Specialties>? specialties,
  }) = _ComplianceList;

  factory ComplianceList.fromJson(Map<String, dynamic> json) =>
      _$ComplianceListFromJson(json);
}
