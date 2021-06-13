import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:ioniconf_2021_flutter/core/networking/network_manager.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

@singleton
class JobsRepository {
  Future<List<Job>> getJobs({int? pageNumber}) async {
    try {
      /// TODO: Handle Error states
      final List<Job> jobs =
          await NetworkManager.instance.getJobList(page: pageNumber.toString());
      return jobs;
    } catch (_) {
      return [];
    }
  }
}
