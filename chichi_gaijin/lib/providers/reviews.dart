import 'package:chichi_gaijin/models/confidence_word.dart';
import 'package:chichi_gaijin/models/word.dart';
import 'package:flutter/cupertino.dart';

class Reviews with ChangeNotifier {
  List<ConfidenceWord> _confidence = [];

  List<ConfidenceWord> get confidence {
    return _confidence;
  }

  addConfidence(Word word) {
    _confidence.add(
      ConfidenceWord(
        word: word,
        timesCorrect: 0,
        nextAppearance: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  addConfidences({@required List<Word> words}) {
    for (int i = 0; i < words.length; i++)
      _confidence.add(
        ConfidenceWord(
          word: words[i],
          timesCorrect: 0,
          nextAppearance: DateTime.now(),
        ),
      );
    notifyListeners();
  }
}
