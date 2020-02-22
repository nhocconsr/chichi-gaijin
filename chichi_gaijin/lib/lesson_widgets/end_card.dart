import 'package:chichi_gaijin/models/word.dart';
import 'package:chichi_gaijin/providers/reviews.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EndCard extends StatelessWidget {
  final List<Word> lessonWords;

  const EndCard({
    @override this.lessonWords,
  });

  @override
  Widget build(BuildContext context) {
    final reviewsProvider = Provider.of<Reviews>(context);
    return RaisedButton(
      onPressed: () => {
        reviewsProvider.addWords(words: lessonWords),
        Navigator.pop(context)
      },
      child: Text('finish'),
    );
  }
}
