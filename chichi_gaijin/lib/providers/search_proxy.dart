
import 'package:chichi_gaijin/models/word.dart';
import 'package:chichi_gaijin/providers/lessons.dart';
import 'package:chichi_gaijin/providers/search_words.dart';
import 'package:flutter/cupertino.dart';

import 'create_lesson.dart';

class SearchProxy {
  final CreateLesson createLesson;
  final SearchWords searchWords;
  final Lessons lessons;

  SearchProxy({
    @required this.createLesson,
    @required this.searchWords,
    @required this.lessons,
  });

  List<Word> get filteredList {
    return searchWords.filteredList;
  }

  bool get alive{
    return searchWords.alive;
  }

  int get current{
    return searchWords.current;
  }


  live({@required int current}){
    searchWords.live(current: current);
  }

  Word currentWord({@required int cardsIndex, @required int translationIndex}){
    return createLesson.currentWord(cardsIndex: cardsIndex, translationIndex: translationIndex);
  }

  openSearch(int newCurrent) {
    searchWords.live();
    searchWords.setCurrent(newCurrent);
  }

  kill() {
    searchWords.dead();

    searchWords.setCurrent(-1);
  }

  kill2(int cardsIndex, int translationIndex) {
    searchWords.dead();

    Word first = searchWords.filteredList.isEmpty
        ? Word(japanese: '', kana: '', romaji: '', english: '', definition: '')
        : searchWords.filteredList[0];

    createLesson.alterTranslationListWord(
      cardsIndex: cardsIndex,
      translationIndex: translationIndex,
      word: first,
    );

    searchWords.setCurrent(-1);
  }

  kill3(int cardsIndex, int translationIndex, Word word) {
    searchWords.dead();

    createLesson.alterTranslationListWord(
      cardsIndex: cardsIndex,
      translationIndex: translationIndex,
      word: word,
    );

    searchWords.setCurrent(-1);
  }

  updateFilteredList(String romaji) {
    List<Word> words = [...createLesson.words, ...lessons.words];
    searchWords.updateFiltered(romaji, words);
  }
}
