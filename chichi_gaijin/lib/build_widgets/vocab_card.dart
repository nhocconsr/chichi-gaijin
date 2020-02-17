import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/providers/create_lesson.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VocabCard extends StatelessWidget {
  final int cardsIndex;

  const VocabCard({
    @required this.cardsIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateLesson>(
      builder: (_, createLesson, __) {
        final VocabType card = createLesson.lessonCards[cardsIndex];
        return Card(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.greenAccent, width: 2.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Vocab Card'),
                  ),
                  //japanese
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Japanese',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    initialValue: card.word.japanese,
                    onChanged: (japanese) {
                      createLesson.alterVocabCard(
                        cardsIndex: cardsIndex,
                        japanese: japanese,
                        romaji: card.word.romaji,
                        english: card.word.english,
                        definition: card.word.definition,
                      );
                    },
                  ),
                  //romaji
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Romaji',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    initialValue: card.word.romaji,
                    onChanged: (romaji) {
                      createLesson.alterVocabCard(
                        cardsIndex: cardsIndex,
                        japanese: card.word.japanese,
                        romaji: romaji,
                        english: card.word.english,
                        definition: card.word.definition,
                      );
                    },
                  ),
                  //english
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'English',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    initialValue: card.word.english,
                    onChanged: (english) {
                      createLesson.alterVocabCard(
                        cardsIndex: cardsIndex,
                        japanese: card.word.japanese,
                        romaji: card.word.romaji,
                        english: english,
                        definition: card.word.definition,
                      );
                    },
                  ),
                  //definition
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Definition',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    initialValue: card.word.definition,
                    onChanged: (definition) {
                      createLesson.alterVocabCard(
                        cardsIndex: cardsIndex,
                        japanese: card.word.japanese,
                        romaji: card.word.romaji,
                        english: card.word.english,
                        definition: definition,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
