import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:worldnews/viewmodels/newsArticleListViewModel.dart';
import 'package:worldnews/viewmodels/newsArticleViewmodel.dart';
import 'package:worldnews/widgets/newsList.dart';

import 'newsArticleDetailScreen.dart';

class NewsListScreen extends StatefulWidget {
  @override
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  void _shownewsArticleDetails(
      BuildContext context, NewsArticleViewModel articleViewModel) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                NewsArticleDetailScreen(article: articleViewModel)));
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Expanded(
          child: Center(child: CircularProgressIndicator()),
        );
      case LoadingStatus.empty:
        return Expanded(
          child: Center(child: Text("No result found!!")),
        );
      case LoadingStatus.completed:
        return Expanded(
          child: NewsList(
            articles: vm.articles,
            onSelected: (article) {
              _shownewsArticleDetails(context, article);
            },
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top News',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: TextField(
              controller: _controller,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  vm.search(value);
                } else {
                  vm.populateTopHeadlines();
                }
              },
              decoration: InputDecoration(
                labelText: "Enter Search term",
                icon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                ),
              ),
            ),
          ),
          _buildList(context, vm)
        ],
      ),
    );
  }
}
