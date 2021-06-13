import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ioniconf_2021_flutter/models/job/configuration/configuration.dart';


part 'credential_type.freezed.dart';
part 'credential_type.g.dart';

@freezed
class CredentialType with _$CredentialType {
  factory CredentialType({
    @JsonKey(name: 'configuration') Configuration? configuration,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'subtype') String? subtype,
    @JsonKey(name: 'isDisabled') Object? isDisabled,
    @JsonKey(name: 'nursecredential_type_id') int? nursecredentialTypeId,
    @JsonKey(name: 'create_date') String? createDate,
    @JsonKey(name: 'update_date') String? updateDate,
    @JsonKey(name: 'delete_date') Object? deleteDate,
  }) = _CredentialType;

  factory CredentialType.fromJson(Map<String, dynamic> json) =>
      _$CredentialTypeFromJson(json);
}
