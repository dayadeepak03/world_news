class Constants {
  static String TOP_HEADLINES_URL =
      "http://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=550b7b20b18747bf9898846a580e174a";

  static String headlinesFor(String keyword) {
    return "https://newsapi.org/v2/everything?q=$keyword&apiKey=550b7b20b18747bf9898846a580e174a";
  }
}
