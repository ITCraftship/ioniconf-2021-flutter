import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ioniconf_2021_flutter/jobs/infrastructure/job_repository.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

part 'jobs_state.dart';
part 'jobs_cubit.freezed.dart';

@singleton
class JobsCubit extends Cubit<JobsState> {
  final JobsRepository _jobsRepository;

  List<Job> _jobList = [];

  JobsCubit(this._jobsRepository) : super(JobsState.showLoading());

  Future<void> initialize() async {
    try {
      _jobList = await _jobsRepository.getJobs(pageNumber: 1);
      if (_jobList.length == 0)
        _buildError("Empty Elements");
      else
        _buildView();
    } catch (error) {
      emit(ShowError(error: error.toString()));
    }
  }

  void _buildView() => emit(ShowView(jobList: List.from(_jobList)));

  void _buildError(String error) => emit(ShowError(error: error));
}
