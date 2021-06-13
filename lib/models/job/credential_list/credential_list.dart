import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ioniconf_2021_flutter/models/job/credential_type/credential_type.dart';


part 'credential_list.freezed.dart';
part 'credential_list.g.dart';

@freezed
class CredentialList with _$CredentialList {
  factory CredentialList({
    @JsonKey(name: 'requirementType') Object? requirementType,
    @JsonKey(name: 'comment') Object? comment,
    @JsonKey(name: 'credential_list_id') int? credentialListId,
    @JsonKey(name: 'credential_id') int? credentialId,
    @JsonKey(name: 'insert_date') String? insertDate,
    @JsonKey(name: 'update_date') String? updateDate,
    @JsonKey(name: 'credentialType') CredentialType? credentialType,
  }) = _CredentialList;

  factory CredentialList.fromJson(Map<String, dynamic> json) =>
      _$CredentialListFromJson(json);
}
