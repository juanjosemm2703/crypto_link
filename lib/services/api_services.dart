import 'package:crypto_link/data/models/web_data.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

class ApiService {
  Future<List<Data>> getData() async {
    var url = Uri.parse(
        'https://newsapi.org/v2/everything?q=cryptocurrency&sortBy=publishedAt&apiKey=05ec8b950e1943938909d09e98e9c396');

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
