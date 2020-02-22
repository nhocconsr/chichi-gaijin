import 'package:flutter/cupertino.dart';

import 'package:chichi_gaijin/models/word.dart';
//Each ContentType represents a single Card that will be displayed on the screen at a time
abstract class ContentType {}

class MetaType implements ContentType{
  final String title;

  const MetaType({@required this.title});  
}

//Data in a Title Card, contains one title and optionally one subtitle
class TitleType implements ContentType {
  final String title;
  final String subtitle;

  const TitleType({@required this.title, this.subtitle});
}
//Contains only one string, representing a body
class BodyType implements ContentType {
  final String body;

  const BodyType ({@required this.body});
}
//Any Japanese word that is introduced gets one of these
//displaying these cards is optional
class VocabType implements ContentType{
  final Word word;

  const VocabType ({@required this.word});
}
//a list of japanese words with their translations attached
//translation is an optional parameter for including natural language
class TranslationType implements ContentType{
  final List<Word> words;
  final String translation;

  const TranslationType({@required this.words, this.translation});
}

//A placeholder for potentially many types of cards
class ReadingType implements ContentType {
  final List<Word> sentence;
  
  const ReadingType({@required this.sentence});
}

