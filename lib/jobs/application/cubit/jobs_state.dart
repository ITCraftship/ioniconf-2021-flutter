part of 'jobs_cubit.dart';

@freezed
abstract class JobsState with _$JobsState {
  const factory JobsState.showLoading() = ShowLoading;

  const factory JobsState.showError({required String error}) = ShowError;

  const factory JobsState.showView({List<Job>? jobList}) = ShowView;
}
