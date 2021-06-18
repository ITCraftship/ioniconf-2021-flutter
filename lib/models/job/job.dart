import 'package:freezed_annotation/freezed_annotation.dart';

import 'facility/facility.dart';
import 'job_specialties/job_specialties.dart';
import 'job_status/job_status.dart';

part 'job.freezed.dart';
part 'job.g.dart';

@freezed
class Job with _$Job {
  factory Job({
    @JsonKey(name: 'job_id') String? jobId,
    @JsonKey(name: 'job_price') double? jobPrice,
    @JsonKey(name: 'job_status') JobStatus? jobStatus,
    @JsonKey(name: 'facility') Facility? facility,
    @JsonKey(name: 'billRate') double? billRate,
    @JsonKey(name: 'jobSpecialties') List<JobSpecialties>? jobSpecialties,
    @JsonKey(name: 'job_shift') String? jobShift,
    @JsonKey(name: 'job_start_date') String? jobStartDate,
    @JsonKey(name: 'licenseType') String? licenseType,
    @JsonKey(name: 'job_type') String? jobType,
    @JsonKey(name: 'job_description') String? jobDescription,
  }) = _Job;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}
