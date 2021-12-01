class Article {
  String? author;
  String? title;
  String? description;
  String url;
  String? urlToImage;
  String? publisedAt;
  String? content;
  Article(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publisedAt,
      required this.content});
  @override
  String toString() {
    return '$author - $title - $description - $url - $urlToImage - $publisedAt - $content';
  }
}
