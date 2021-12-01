import 'dart:convert';

import 'package:http/http.dart';

import 'package:news/api/article.dart';

class NewsApi {

  // Singleton
  NewsApi._init();
  static final NewsApi _instance = NewsApi._init();
  factory NewsApi() => _instance;

  final _baseURL = 'https://newsapi.org/v2';
  final _apiKey = '3459fe8335f6487a85141dbc9ad444c0';

  Future<List<Article>> getNews({required String category}) async {

    // Fetches news based on the category passed and returns a list of articles objects
    // that contains details of the article
     
    List<Article> news = [];
    String url = '$_baseURL/everything?q=$category&apikey=$_apiKey';
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      var articles = data['articles']; // return list of articles
      for (int i = 0; i < 20; i++) {
        var article = articles[i];
        news.add(_createNewsModel(article));
      }
      return news;
    } else {
      throw Exception('Failed to fetch Data ...');
    }
  }

  Article _createNewsModel(var article) {
    return Article(
        author: article['author'],
        title: article['title'],
        description: article['description'],
        url: article['url'],
        urlToImage: article['urlToImage'],
        publisedAt: article['publishedAt'],
        content: article['content']);
  }
}
