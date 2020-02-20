import 'package:chichi_gaijin/models/word.dart';
import 'package:flutter/material.dart';
//search by romaji
class SearchWords with ChangeNotifier {
  List<Word> _filteredList = [];

  bool _alive = false;
  int _current = -1;

  List<Word> get filteredList {
    return _filteredList;
  }

  bool get alive {
    return _alive;
  }

  int get current {
    return _current;
  }

  setCurrent(int newCurrent) {
    _current = newCurrent;
    notifyListeners();
  }

  updateFiltered(String romaji, List<Word> words) {
    _filteredList
        .clear(); //for the next time that we search we want the list to be unfilterted
    if (!(romaji == ''))
      _filteredList.addAll(words); //getting list to original state
    //removing items that do not contain the entered Text
    filteredList
        .removeWhere((i) => i.romaji.contains(romaji.toString()) == false);
    notifyListeners();
  }

  startProxy() {
    //reset filteredlist
    _alive = true;
  }

  live({int current}) {
    _current = current;
    _alive = true;
    notifyListeners();
  }

  dead() {
    _alive = false;
    notifyListeners();
  }
}
