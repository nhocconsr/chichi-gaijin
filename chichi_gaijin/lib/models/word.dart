
import 'package:flutter/cupertino.dart';
//can contain multiple kanji
//word != lexeme
//as in, each word only represents a single definition and not all of its constiuents
class Word{
  //most common reading for this word; kanji included
  final String japanese;
  //no kanji
  final String romaji;
  //the smallest possible translation for this word
  //do not included multiple definitions here
  final String english;
  //if this kanji has multiple uses, only explain the one you are using in the english category
  final String definition;

  const Word({
    @required this.japanese,
    @required this.romaji,
    @required this.english,
    @required this.definition,
  });

}