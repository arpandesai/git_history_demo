import 'package:git_history_demo/models/GitUser.dart';
import 'dart:core';

class GitCommit {

  String shaHash;

  String summary;

  String externalURL;

  GitUser user;

  String timeStamp;

  GitCommit(Map<String, dynamic> commitObject) {
    this.shaHash = commitObject["sha"];
    Map<String, dynamic> commit = commitObject["commit"];
    this.summary = commit["message"];
    this.user = GitUser(commitObject["author"]);
    this.externalURL = commitObject["html_url"];

    DateTime dateTime = DateTime.parse(commit["author"]["date"]);
    this.timeStamp = "${dateTime.hour.toString().padLeft(2,'0')}:${dateTime.minute.toString().padLeft(2,'0')} ${dateTime.year.toString()}-${dateTime.month.toString().padLeft(2,'0')}-${dateTime.day.toString().padLeft(2,'0')} ${dateTime.timeZoneName}";

  }
}