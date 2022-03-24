import 'package:apidictionary/models/dictionaryModel.dart';
import 'package:flutter/material.dart';

class FavouriteProvider extends ChangeNotifier {
  List<DictionaryModel> _favourite = [];

  List<DictionaryModel> get favourites => _favourite;

  void addToFavourite(DictionaryModel word) {
    _favourite.add(word);
    notifyListeners();
  }

  void removeWordAt(int index) {
    _favourite.removeAt(index);
    notifyListeners();
  }
}