class Post {
  final String name, content, picUrl, date;

  Post(
      {required this.name,
      required this.content,
      required this.picUrl,
      required this.date});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        name: json['name'],
        content: json['content'],
        picUrl: json['picUrl'],
        date: json['date']);
  }
}
