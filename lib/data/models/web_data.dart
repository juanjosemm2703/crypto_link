class Data {
  final author;
  final title;
  final url;
  final description;
  final urlToImage;
  final publishedAt;
  final content;
  final source;

  Data(
      {this.source,
      this.author,
      this.title,
      this.url,
      this.description,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'],
      url: json['url'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }
}

class Source {
  final id;
  final name;

  Source({this.name, this.id});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(name: json['name'], id: json['id']);
  }
}
