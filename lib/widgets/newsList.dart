import 'package:flutter/material.dart';
import 'package:worldnews/viewmodels/newsArticleViewmodel.dart';
import 'package:worldnews/screens/newsArticleDetailScreen.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;

  NewsList({this.articles, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: ListTile(
              onTap: () {
                this.onSelected(article);
              },
              leading: Container(
                height: 100.0,
                width: 100.0,
                child: article.imageUrl == null
                    ? Image.asset(
                        "images/newsPlace.png",
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        article.imageUrl,
                        fit: BoxFit.cover,
                      ),
              ),
              title: Text(
                article.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        });
  }
}
