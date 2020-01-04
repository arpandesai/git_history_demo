import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:git_history_demo/models/GitCommit.dart';
import 'package:git_history_demo/networking/github_request_wrapper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class HistoryWidget extends StatefulWidget {
  HistoryWidget({Key key}) : super(key: key);

  @override
  _HistoryWidgetState createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  List<GitCommit> commits;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.refreshCommits(context);
  }

  @override
  void didUpdateWidget(HistoryWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    this.commits = null;
    this.refreshCommits(context);
  }

  @override
  Widget build(BuildContext context) {
    return commits == null
        ? Center(child: Text("Retrieving Commits..."))
        : ListView.builder(
            itemCount: commits.length,
            itemBuilder: (context, index) => commitWidget(this.commits[index]));
  }

  Widget commitWidget(GitCommit commit) {
    return ListTile(
      enabled: true,
      onTap: (){
        _openURLinBrowser(commit.externalURL);
      },
      title: Text(commit.summary),
      subtitle: Text(commit.shaHash),
      leading: Column(
        children: <Widget>[
          Text(commit.user.login),
          Image(
              width: 30,
              height: 30,
              fit: BoxFit.fitHeight,
              image: CachedNetworkImageProvider(commit.user.avatar_url)),
        ],
      ),
      trailing: FlatButton(
          child: Icon(Icons.open_in_new)),
    );
  }

  void refreshCommits(context) async {
    GithubRequestWrapper.shared.getCommitsFor("master").then((commits) {
      setState(() {
        this.commits = commits;
      });
    }).catchError((error) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
    });
  }

  _openURLinBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
