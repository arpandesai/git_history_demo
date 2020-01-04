import 'package:flutter/material.dart';
import 'package:git_history_demo/models/GitCommit.dart';
import 'package:git_history_demo/networking/github_request_wrapper.dart';
import 'package:git_history_demo/widgets/history_widget.dart';

class HomeWidgetScreen extends StatefulWidget {
  final Uri baseUri;

  HomeWidgetScreen({@required this.baseUri});

  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Git History Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'History'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<GitCommit> commits;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
          actions: <Widget>[FlatButton(onPressed: null, child: Icon(Icons.refresh))],
      ),
      body: HistoryWidget());

  }
}



