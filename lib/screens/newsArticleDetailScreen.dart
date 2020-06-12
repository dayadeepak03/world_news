import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:worldnews/viewmodels/newsArticleViewmodel.dart';

class NewsArticleDetailScreen extends StatefulWidget {
  final NewsArticleViewModel article;

  const NewsArticleDetailScreen({this.article});

  @override
  _NewsArticleDetailScreenState createState() =>
      _NewsArticleDetailScreenState();
}

class _NewsArticleDetailScreenState extends State<NewsArticleDetailScreen> {
  num position = 1;

  final key = UniqueKey();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.article.title}"),
      ),
      body: IndexedStack(
        index: position,
        children: <Widget>[
          WebView(
            initialUrl: widget.article.url,
            javascriptMode: JavascriptMode.unrestricted,
            key: key,
            onPageFinished: doneLoading,
            onPageStarted: startLoading,
          ),
          Container(
            color: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
