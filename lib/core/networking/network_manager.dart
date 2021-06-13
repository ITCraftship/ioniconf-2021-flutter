import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ioniconf_2021_flutter/core/config/config.dart';
import 'dart:developer' as developer;

import 'package:ioniconf_2021_flutter/core/injection/injection.dart';
import 'package:ioniconf_2021_flutter/core/networking/endpoints.dart';
import 'package:ioniconf_2021_flutter/models/job/job.dart';

const String apiBaseUrl = "BaseUrl";

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._internal();

  factory NetworkManager() => _singleton;

  static NetworkManager get instance => _singleton;
  late http.Client client;
  static int _timeOutSeconds = 60;

  static late String _baseURL;
  void prpUrls() => _baseURL = getIt<Config>().apiUrl;

  NetworkManager._internal() {
    client = http.Client();
    prpUrls();
  }

  Future<List<Job>> getJobList({String page = "1"}) async {
    http.Response _response =
        await doGet(url: _baseURL + Endpoints.jobs + '?page=' + page);
    List<Job> _jobList = [];
    try {
      var _list = jsonDecode(_response.body) as List;
      _jobList.addAll(_list.map<Job>((json) => Job.fromJson(json)).toList());
    } catch (e) {
      debugPrint(e.toString());
    }
    return _jobList;
  }

  Future<http.Response> doGet(
      {required String url, Map<String, String>? queryParameters}) async {
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    };
    final parsedUrl = Uri.parse(url).replace(queryParameters: queryParameters);
    http.Response response;
    try {
      response = await NetworkManager.instance.client
          .get(parsedUrl, headers: header)
          .timeout(Duration(seconds: _timeOutSeconds));
    } catch (e) {
      /// TODO: ERROR HANDLER
      throw e;
    }
    return response;
  }

  Future<http.Response> doPost(
      {required String url, dynamic body, bool useToken = true}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final myBody = jsonEncode(body);
    final parsedUrl = Uri.parse(url);
    developer.log(url, name: 'Request Url');
    if (useToken) developer.log(myBody, name: 'Request Body');
    return await NetworkManager.instance.client
        .post(parsedUrl, headers: headers, body: myBody)
        .timeout(Duration(minutes: _timeOutSeconds));
  }
}
