import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:new_app/models/news.dart';

class HttpHelper {
  var client = http.Client();
  Future<List<News>> getNews(String category) async {
    var uri = Uri.parse(
        "https://newsapi.org/v2/everything?q=$category&apiKey=c0dd0cfd4aef4f268e422c99d2b912e4");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var articlesJson = jsonResponse["articles"] as List<dynamic>;

      var articles = articlesJson.map((json) => News.fromJson(json)).toList();
      return articles;
    } else {
      throw Exception("Unable to load articles");
    }
  }

  void postNews(Map data, String url) async {
    final response = await client.post(Uri.parse(url));
    if (response.statusCode == 201) {
      debugPrint('Saved data successfully');
    } else {
      debugPrint('Unable to saved data successfully');
    }
  }
}
