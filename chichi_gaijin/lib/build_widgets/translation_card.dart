import 'package:chichi_gaijin/build_widgets/display_or_search_words.dart';
import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/providers/create_lesson.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//A card with a phrase, sentence, or a few small sentences
//each word in the sentence can be tapped, revealing it's japanese/romaji/english/translation
//english is machine typed, whereas translation is natural language
class TranslationCard extends StatelessWidget {
  final int cardsIndex;

  const TranslationCard({
    @required this.cardsIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateLesson>(
      builder: (_, createLesson, __) {
        final TranslationType translationType =
            createLesson.lessonCards[cardsIndex];
        return Card(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orangeAccent,
                width: 2.0,
              ),
            ),
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Translation Card'),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(border: Border.all()),
                  child: Wrap(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => createLesson.addWord(cardsIndex: cardsIndex),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text('add word'),
                          ),
                        ),
                      ),
                      for (int translationIndex = 0;
                          translationIndex < translationType.words.length;
                          translationIndex++)
                        DisplayOrSearchWords(cardsIndex: cardsIndex, translationIndex: translationIndex,)
                    ],
                  ),
                ),
                translationType.translation == null
                    ? RaisedButton(
                        onPressed: () => createLesson.addNaturalTranslation(
                            cardsIndex: cardsIndex),
                        child: Text('add natural english'),
                      )
                    : TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Translation',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        initialValue: translationType.translation == null
                            ? ''
                            : translationType.translation,
                        onChanged: (translation) {
                          createLesson.alterNaturalTranslation(
                            cardsIndex: cardsIndex,
                            translation: translation,
                          );
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
