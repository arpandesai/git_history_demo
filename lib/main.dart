import 'package:flutter/material.dart';
import 'package:git_history_demo/widgets/home_widget.dart';

void main() {
  runGitHistoryApp(baseUri: Uri.parse(""));
}

void runGitHistoryApp({Uri baseUri}) {
  runApp(HomeWidgetScreen(
    baseUri: baseUri
  ));
}
