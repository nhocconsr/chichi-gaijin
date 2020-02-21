import 'package:chichi_gaijin/models/content_type.dart';
import 'package:flutter/material.dart';

class TranslatorSentence extends StatefulWidget {
  final TranslationType card;

  const TranslatorSentence({
    @required this.card,
  });

  @override
  _TranslatorSentenceState createState() => _TranslatorSentenceState();
}

class _TranslatorSentenceState extends State<TranslatorSentence> {
  int currentPage = 0;
  List<int> currentCard = [];

  @override
  void initState() {
    for (int i = 0; i < widget.card.words.length; i++) currentCard.add(0);
    super.initState();
  }

  changePage() {
    setState(() {
      if (widget.card.translation == null)
        currentPage = (currentPage + 1) % 4;
      else if (widget.card.translation != null)
        currentPage = (currentPage + 1) % 5;
      for (int i = 0; i < currentCard.length; i++) {
        if (currentCard[i] < currentPage || currentPage == 0)
          currentCard.replaceRange(i, i + 1, [currentPage]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: <Widget>[
          if (currentPage != 4)
            for (int cardsIndex = 0;
                cardsIndex < widget.card.words.length;
                cardsIndex++)
              if (currentCard[cardsIndex] == 0)
                Text(widget.card.words[cardsIndex].japanese)
              else if (currentCard[cardsIndex] == 1)
                Text(widget.card.words[cardsIndex].kana)
              else if (currentCard[cardsIndex] == 2)
                Text(widget.card.words[cardsIndex].romaji)
              else
                Text(widget.card.words[cardsIndex].english)
          else if (currentPage == 4)
            Text(widget.card.translation),
          RaisedButton(
            onPressed: () => changePage(),
            child: Text('change'),
          ),
        ],
      ),
    );
  }
}
