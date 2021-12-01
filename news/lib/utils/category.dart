class NewsCategory {
  static const sports = 'sports';
  static const business = 'business';
  static const political = 'political';
  static const indian = 'india';
  static const gaming = 'gaming';
  static const crypto = 'crypto';
  static const weather = 'weather';

  static List<String> getCategories() {
    return <String>[sports, business, political, indian, gaming, crypto, weather];
  }
}
