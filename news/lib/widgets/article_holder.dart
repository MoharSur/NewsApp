import 'package:flutter/material.dart';
import 'package:news/api/article.dart';

class ArticleHolder extends StatelessWidget {
  Article news;
  ArticleHolder(this.news);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/viewer', arguments: {
            'url' : news.url
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.0),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(news.urlToImage ?? '', width: double.infinity)),
              const SizedBox(height: 12.0),
              Text(news.title ?? '',
                  style: Theme.of(context).textTheme.caption),
              const SizedBox(height: 8.0),
              Text(news.description ?? '',
                  style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Text(
                    news.author ?? '',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 10.0,
                    ),
                  ),
                  const SizedBox(width: 3.0),
                  Text(
                    '.',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 10.0,
                    ),
                  ),
                  const SizedBox(width: 3.0),
                  Text(
                    news.publisedAt ?? '',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 10.0,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
