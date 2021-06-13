import 'package:freezed_annotation/freezed_annotation.dart';

part 'shifts.freezed.dart';
part 'shifts.g.dart';

@freezed
class Shifts with _$Shifts {
  factory Shifts({
    @JsonKey(name: 'job_id') String? jobId,
    @JsonKey(name: 'shift_id') int? shiftId,
    @JsonKey(name: 'from_date') String? fromDate,
    @JsonKey(name: 'to_date') String? toDate,
    @JsonKey(name: 'from_time') String? fromTime,
    @JsonKey(name: 'to_time') String? toTime,
    @JsonKey(name: 'from_date_time_timestamp') String? fromDateTimeTimestamp,
    @JsonKey(name: 'to_date_time_timestamp') String? toDateTimeTimestamp,
    @JsonKey(name: 'shift_status_id') int? shiftStatusId,
    @JsonKey(name: 'payment_status_id') Object? paymentStatusId,
    @JsonKey(name: 'payment_transaction_id') Object? paymentTransactionId,
    @JsonKey(name: 'payment_date') Object? paymentDate,
    @JsonKey(name: 'insert_date') String? insertDate,
  }) = _Shifts;

  factory Shifts.fromJson(Map<String, dynamic> json) => _$ShiftsFromJson(json);
}
