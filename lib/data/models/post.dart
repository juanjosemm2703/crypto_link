class Post {
  final String uid, name, message, picUrl, date;

  Post(
      {required this.uid,
      required this.name,
      required this.message,
      required this.picUrl,
      required this.date});

  static Post fromJson(Map<String, dynamic> json) => Post(
      uid: json['uid'],
      name: json['name'],
      message: json['message'],
      picUrl: json['picUrl'],
      date: json['date']);

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'message': message,
        'picUrl': picUrl,
        'date': date,
      };
}
