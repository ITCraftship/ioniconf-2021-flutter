import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ioniconf_2021_flutter/models/job/required/required.dart';

part 'configuration.freezed.dart';
part 'configuration.g.dart';

@freezed
class Configuration with _$Configuration {
  factory Configuration({
    @JsonKey(name: 'required') List<RequiredConfiguration>? required,
  }) = _Configuration;

  factory Configuration.fromJson(Map<String, dynamic> json) =>
      _$ConfigurationFromJson(json);
}
