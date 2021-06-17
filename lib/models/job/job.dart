import 'package:freezed_annotation/freezed_annotation.dart';

import 'compliance_list/compliance_list.dart';
import 'facility/facility.dart';
import 'job_specialties/job_specialties.dart';
import 'job_status/job_status.dart';
import 'shifts/shifts.dart';
import 'user_compliance/user_compliance.dart';

part 'job.freezed.dart';
part 'job.g.dart';

@freezed
class Job with _$Job {
  factory Job({
    @Default("") @JsonKey(name: 'job_id') String jobId,
    @JsonKey(name: 'job_title') Object? jobTitle,
    @JsonKey(name: 'job_board_job_id') Object? jobBoardJobId,
    @JsonKey(name: 'job_facility_id') String? jobFacilityId,
    @JsonKey(name: 'job_posting_date') Object? jobPostingDate,
    @Default("") @JsonKey(name: 'job_type') String jobType,
    @Default("") @JsonKey(name: 'job_start_date') String jobStartDate,
    @JsonKey(name: 'job_duration') Object? jobDuration,
    @Default("") @JsonKey(name: 'job_shift') String jobShift,
    @JsonKey(name: 'job_speciality') Object? jobSpeciality,
    @JsonKey(name: 'job_description') String? jobDescription,
    @JsonKey(name: 'job_web_link') Object? jobWebLink,
    @JsonKey(name: 'job_status_id') int? jobStatusId,
    @JsonKey(name: 'job_price') double? jobPrice,
    @JsonKey(name: 'job_duration_weeks') Object? jobDurationWeeks,
    @JsonKey(name: 'job_shift_length_hrs') Object? jobShiftLengthHrs,
    @JsonKey(name: 'job_shifts_per_week') Object? jobShiftsPerWeek,
    @JsonKey(name: 'job_time_of_day') Object? jobTimeOfDay,
    @Default("") @JsonKey(name: 'licenseType') String licenseType,
    @JsonKey(name: 'billRate') double? billRate,
    @JsonKey(name: 'isGroupJob') bool? isGroupJob,
    @JsonKey(name: 'isMarketplaceJob') bool? isMarketplaceJob,
    @JsonKey(name: 'createdBy') String? createdBy,
    @JsonKey(name: 'closedBy') Object? closedBy,
    @JsonKey(name: 'isBulkJob') bool? isBulkJob,
    @JsonKey(name: 'closedDate') Object? closedDate,
    @JsonKey(name: 'closedComments') Object? closedComments,
    @JsonKey(name: 'bonus') int? bonus,
    @JsonKey(name: 'insert_date') String? insertDate,
    @JsonKey(name: 'update_date') String? updateDate,
    @JsonKey(name: 'delete_date') Object? deleteDate,
    @JsonKey(name: 'job_board_name') String? jobBoardName,
    @JsonKey(name: 'shift_time') String? shiftTime,
    @JsonKey(name: 'jobSpecialties') List<JobSpecialties>? jobSpecialties,
    @JsonKey(name: 'facility') Facility? facility,
    @JsonKey(name: 'job_status') JobStatus? jobStatus,
    @JsonKey(name: 'shifts') List<Shifts>? shifts,
    @JsonKey(name: 'requests') List<dynamic>? requests,
    @JsonKey(name: 'job_rates_calculator') Object? jobRatesCalculator,
    @JsonKey(name: 'views') List<dynamic>? views,
    @JsonKey(name: 'complianceList') ComplianceList? complianceList,
    @JsonKey(name: 'userCompliance') UserCompliance? userCompliance,
  }) = _Job;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}
