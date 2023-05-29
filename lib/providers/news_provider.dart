import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:new_app/models/news.dart';

class NewsProvider extends ChangeNotifier {
  final List<News> _news = [];
  UnmodifiableListView<News> get news => UnmodifiableListView(_news);

  int get totalNews => _news.length;

  void addNews(News news) {
    _news.add(news);
    notifyListeners();
  }

  void removeNews(News news) {
    _news.remove(news);
    notifyListeners();
  }

  void removeAll() {
    _news.clear();
    notifyListeners();
  }
}
