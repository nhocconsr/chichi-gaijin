
import 'package:chichi_gaijin/models/word.dart';
import 'package:flutter/cupertino.dart';

class Reviews with ChangeNotifier{
  List<Word> _words = [];

  List<Word> get words {
    return _words;
  }

  addWord(Word word){
    _words.add(word);
    notifyListeners();
  }

  addWords({@required List<Word> words}){
    _words.addAll(words);
    notifyListeners();
  }
}