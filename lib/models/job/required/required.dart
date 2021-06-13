import 'package:freezed_annotation/freezed_annotation.dart';

part 'required.freezed.dart';
part 'required.g.dart';

@freezed
class RequiredConfiguration with _$RequiredConfiguration {
  factory RequiredConfiguration({
    @JsonKey(name: 'checked') bool? checked,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'icon') String? icon,
    @JsonKey(name: 'label') String? label,
  }) = _RequiredConfiguration;

  factory RequiredConfiguration.fromJson(Map<String, dynamic> json) =>
      _$RequiredConfigurationFromJson(json);
}
