import 'package:git_history_demo/models/GitUser.dart';


class GitCommit {

  String shaHash;

  String summary;

  String externalURL;

  GitUser user;

  GitCommit(Map<String, dynamic> commitObject) {
    this.shaHash = commitObject["sha"];
    Map<String, dynamic> commit = commitObject["commit"];
    this.summary = commit["message"];
    this.user = GitUser(commitObject["author"]);
    this.externalURL = commitObject["html_url"];
  }
}