import 'package:flutter/cupertino.dart';

import 'package:chichi_gaijin/models/word.dart';
//Each ContentType represents a single Card that will be displayed on the screen at a time
abstract class ContentType {}

class TitleType implements ContentType {
  final String title;
  final String subtitle;

  const TitleType({@required this.title, this.subtitle});
}

class BodyType implements ContentType {
  final String body;

  const BodyType ({@required this.body});
}
//A placeholder for potentially many types of cards
class ReadingType implements ContentType {
  final List<Word> sentence;
  
  const ReadingType({@required this.sentence});
}