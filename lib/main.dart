import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worldnews/screens/newsListScreen.dart';
import 'package:worldnews/viewmodels/newsArticleListViewModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "World News",
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: ChangeNotifierProvider(
        builder: (_) => NewsArticleListViewModel(),
        child: NewsListScreen(),
      ),
    );
  }
}
