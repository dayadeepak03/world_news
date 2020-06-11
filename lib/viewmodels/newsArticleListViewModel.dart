import 'package:flutter/cupertino.dart';
import 'package:worldnews/model/newsArticle.dart';
import 'package:worldnews/services/web_service.dart';
import 'package:worldnews/viewmodels/newsArticleViewmodel.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> search(String keyword) async {
    List<NewsArticle> newsArticle =
        await Webservice().fetchHeadlinesByKeyword(keyword);

    this.articles = newsArticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    notifyListeners();
  }

  void populateTopHeadlines() async {
    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadlines();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    notifyListeners();
  }
}
