import 'package:injectable/injectable.dart';
import 'package:ioniconf_2021_flutter/core/networking/endpoints.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'retrofit_example.g.dart';

@RestApi()
@injectable
abstract class JobsApiDataSource {
  @factoryMethod
  factory JobsApiDataSource(Dio dio) = _JobsApiDataSource;

  @GET(Endpoints.jobs)
  Future<List<Job>> getJobs();
}