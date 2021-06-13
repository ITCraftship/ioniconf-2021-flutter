import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_status.freezed.dart';
part 'job_status.g.dart';

@freezed
class JobStatus with _$JobStatus {
  factory JobStatus({
    @Default(0) @JsonKey(name: 'job_status_id') int jobStatusId,
    @Default("") @JsonKey(name: 'job_status_text') String jobStatusText,
  }) = _JobStatus;

  factory JobStatus.fromJson(Map<String, dynamic> json) =>
      _$JobStatusFromJson(json);
}
