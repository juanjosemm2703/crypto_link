class Post {
  final String name, message, picUrl, date;

  Post(
      {required this.name,
      required this.message,
      required this.picUrl,
      required this.date});

  static Post fromJson(Map<String, dynamic> json) => Post(
      name: json['name'],
      message: json['message'],
      picUrl: json['picUrl'],
      date: json['date']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'message': message,
        'picUrl': picUrl,
        'date': date,
      };
}
