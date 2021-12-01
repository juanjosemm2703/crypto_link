import 'package:crypto_link/ui/pages/content/search/widgets/principle_new.dart';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'widgets/search_cards.dart';

class ApiService {
  Future<List<Data>> getData() async {
    var url = Uri.parse(
        'https://newsapi.org/v2/everything?q=cryptocurrency&apiKey=05ec8b950e1943938909d09e98e9c396&language=en');

    Response response = await get(url);

    print('Estado:${response.statusCode}');

    if (response.statusCode != 200) {
      throw Exception(
          "Request to $url failed with status ${response.statusCode}: ${response.body}");
    }
    Map<String, dynamic> json = jsonDecode(response.body);
    List<dynamic> body = json['articles'];

    List<Data> data = body.map((dynamic item) => Data.fromJson(item)).toList();

    return data;
  }
}

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

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: FutureBuilder(
        future: client.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          if (snapshot.hasData) {
            final datos = snapshot.data as List<Data>;
            return Column(
              children: <Widget>[
                PrincipleNew(post: datos[0]),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return SearchCard(
                          date: datos[index].publishedAt,
                          onNews: () {},
                          picUrl: datos[index].urlToImage,
                          title: datos[index].title);
                    })
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
