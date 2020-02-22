
import 'package:chichi_gaijin/models/word.dart';
import 'package:flutter/cupertino.dart';

abstract class ReviewType{}

class WordType implements ReviewType{
  final Word word;

  const WordType({
    @required this.word,
  });
}