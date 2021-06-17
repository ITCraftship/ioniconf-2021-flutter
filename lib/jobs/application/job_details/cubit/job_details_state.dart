part of 'job_details_cubit.dart';

@freezed
abstract class JobDetailsState with _$JobDetailsState {
  const factory JobDetailsState.showLoading() = ShowLoading;

  const factory JobDetailsState.showError({required String error}) = ShowError;

  const factory JobDetailsState.showView({required Job job}) = ShowView;
}
