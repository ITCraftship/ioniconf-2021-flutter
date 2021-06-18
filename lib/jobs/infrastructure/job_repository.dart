import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:ioniconf_2021_flutter/core/networking/network_manager.dart';
import 'package:ioniconf_2021_flutter/core/networking/retrofit_example.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

@singleton
class JobsRepository {
  final JobsApiDataSource _dataSource;

  JobsRepository(this._dataSource);

  Future<List<Job>> getJobs({int? pageNumber}) async {
    try {
      final List<Job> jobs = await _dataSource.getJobs();
      return jobs;
    } catch (_) {
      return [];
    }
  }

  Future<Job> getJob({required String jobId}) async {
    Job _job = Job();
    try {
      _job = await NetworkManager.instance.getJob(jobId: jobId);
    } catch (_) {}
    return _job;
  }
}
