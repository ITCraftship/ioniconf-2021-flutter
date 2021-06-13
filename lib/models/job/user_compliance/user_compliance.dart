import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_compliance.freezed.dart';
part 'user_compliance.g.dart';

@freezed
class UserCompliance with _$UserCompliance {
  factory UserCompliance({
    @JsonKey(name: 'compliantRating') int? compliantRating,
    @JsonKey(name: 'maxCompliantRating') int? maxCompliantRating,
    @JsonKey(name: 'credentials') List<dynamic>? credentials,
  }) = _UserCompliance;

  factory UserCompliance.fromJson(Map<String, dynamic> json) =>
      _$UserComplianceFromJson(json);
}
