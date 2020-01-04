import 'package:flutter/material.dart';
import 'package:git_history_demo/widgets/home_widget.dart';
import 'package:git_history_demo/networking/github_request_wrapper.dart';

void main() {
  runGitHistoryApp(baseUri: Uri.parse("https://api.github.com/repos/arpandesai/git_history_demo"));
}

void runGitHistoryApp({Uri baseUri}) {
  GithubRequestWrapper.shared.repoURL = baseUri;
  runApp(HomeWidgetScreen(
    baseUri: baseUri
  ));
}
