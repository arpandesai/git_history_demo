import 'package:dio/dio.dart';
import 'package:git_history_demo/models/GitCommit.dart';
import 'package:flutter/material.dart';

class GithubRequestWrapper extends Object {
  static GithubRequestWrapper shared = GithubRequestWrapper();

  Uri repoURL;

  //Common dio object
  Dio _dio = () {
    Dio dio = Dio();
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (Options options) async {
      options.headers[Headers.acceptHeader] = "application/vnd.github.v3+json";
      return options;
    }));
    return dio;
  }();

  Future<List<GitCommit>> getCommitsFor(String branch) async {
    var pathSegments = this.repoURL.pathSegments.toList(growable: true);
    pathSegments.add("commits");
    Uri commitsURI = this.repoURL.replace(pathSegments: pathSegments);

    List<GitCommit> commits = List<GitCommit>();
    await this._dio.getUri(commitsURI).then((value) {
      if (value.data is List) {
        List<dynamic> commitsObjects = value.data as List;
        commitsObjects.forEach((commitObject){
          commits.add(GitCommit(commitObject));
        });
      }
    }).catchError((Object error) {
      if (Object is DioError) {
        throw (error as DioError).error;
      }
      throw error;
    });
    return commits;
  }
}
