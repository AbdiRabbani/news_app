class Article {
  String author;
  String tittle;
  String content;
  String urlToImage;
  String publishedAt;

  Article(
      { //! Parameter
      required this.author,
      required this.tittle,
      required this.content,
      required this.urlToImage,
      required this.publishedAt});

  //! memetakan json object ke model
  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"] ?? "Null",
        tittle: json["tittle"] ?? "Null",
        content: json["content"] ?? "Null",
        urlToImage: json["urlToImage"] ??
            "https://propertywiselaunceston.com.au/wp-content/themes/property-wise/images/no-image@2x.png",
        publishedAt: json['publishedAt'] ?? "Null",
      );
}
