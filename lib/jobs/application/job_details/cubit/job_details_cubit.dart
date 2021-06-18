import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ioniconf_2021_flutter/jobs/infrastructure/job_repository.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

part 'job_details_state.dart';
part 'job_details_cubit.freezed.dart';

@injectable
class JobDetailsCubit extends Cubit<JobDetailsState> {
  final JobsRepository _jobsRepository;
  late Job _job;
  JobDetailsCubit(this._jobsRepository) : super(JobDetailsState.showLoading());

  Future<void> initialize({required Job job}) async {
    try {
      _job = await _jobsRepository.getJob(jobId: job.jobId!);
      _buildView();
    } catch (error) {
      _buildError(error.toString());
    }
  }

  void _buildView() => emit(ShowView(job: _job));

  void _buildError(String error) => emit(ShowError(error: error));
}
