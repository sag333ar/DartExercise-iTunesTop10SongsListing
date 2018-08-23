import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import 'models/rss_feed.dart';
import 'widgets/song_list.dart';

class App extends StatefulWidget {

  @override
  createState() {
    return AppState();
  }

}

class AppState extends State<App> {

  List<RssSong> entries = [];

  void fetchData() async {
    final result = await get('http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=10/json');
    final feedResponse = RssFeedResponse.fromJson(json.decode(result.body));
    setState(() {
      print(feedResponse.feed.entries.length);
      entries = feedResponse.feed.entries;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SongList(entries),
        ),
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: fetchData,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

}