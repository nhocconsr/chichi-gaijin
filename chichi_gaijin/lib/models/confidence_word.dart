import 'package:chichi_gaijin/models/word.dart';
import 'package:flutter/cupertino.dart';

class ConfidenceWord {
  final Word word;
  final int timesCorrect;
  final DateTime nextAppearance;

  const ConfidenceWord({
    @required this.word,
    @required this.timesCorrect,
    @required this.nextAppearance,
  });
}
