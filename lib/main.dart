import 'package:flutter/material.dart';
import 'package:git_history_demo/widgets/home_widget.dart';
import 'package:git_history_demo/networking/github_request_wrapper.dart';
import 'package:git_history_demo/common_utils/constants.dart';

void main() {
  runGitHistoryApp(baseUri: Uri.parse(Constants.githubRepoURL));
}

void runGitHistoryApp({Uri baseUri}) {
  GithubRequestWrapper.shared.repoURL = baseUri;
  runApp(HomeWidgetScreen(
    baseUri: baseUri
  ));
}
