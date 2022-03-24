import 'package:apidictionary/models/dictionaryModel.dart';
import 'package:flutter/material.dart';

class HistoryProvider extends ChangeNotifier {

  List<String> _history = [];

  List<String> get history => _history;

  void appendHistory(String word) {
    if (!_history.contains(word.toLowerCase())) {
      _history.add(word);
      notifyListeners();
    }
  }

  void removeHistoryAt(int index) {
    _history.removeAt(index);
    notifyListeners();
  }

  void clearHistory() {
    _history = [];
    notifyListeners();
  }
}