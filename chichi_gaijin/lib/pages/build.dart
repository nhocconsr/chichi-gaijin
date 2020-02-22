import 'package:chichi_gaijin/build_widgets/body_card.dart';
import 'package:chichi_gaijin/build_widgets/title_card.dart';
import 'package:chichi_gaijin/build_widgets/translation_card.dart';
import 'package:chichi_gaijin/build_widgets/vocab_card.dart';
//providers
import 'package:chichi_gaijin/providers/create_lesson.dart';
import 'package:chichi_gaijin/providers/deck.dart';
import 'package:chichi_gaijin/providers/proxys/finalize_lesson_proxy.dart';
import 'package:chichi_gaijin/providers/lessons.dart';
import 'package:chichi_gaijin/providers/proxys/search_proxy.dart';
import 'package:chichi_gaijin/providers/search_words.dart';
//models
import 'package:chichi_gaijin/models/content_type.dart';
//external imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Build extends StatelessWidget {
  static const routeName = '/create';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchWords>(create: (_) => SearchWords()),
        //Proxy provider allows ease of management when using two providers at once
        ProxyProvider3<CreateLesson, SearchWords, Deck, SearchProxy>(
          update: (_, createLesson, searchConcepts, deck, __) => SearchProxy(
            createLesson: createLesson,
            searchWords: searchConcepts,
            deck: deck,
          ),
        ),
        ProxyProvider2<CreateLesson, Lessons, FinalizeLessonProxy>(
          update: (_, createLesson, lessons, __) => FinalizeLessonProxy(
            createLesson: createLesson,
            lessons: lessons,
          ),
        ),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true, //bottom overflowing fix
          appBar: AppBar(
            title: Text('create'),
          ),
          body: Consumer<CreateLesson>(
            builder: (_, createLesson, __) {
              final List<ContentType> lessonCards = createLesson.lessonCards;
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Text',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      initialValue: createLesson.title,
                      onChanged: (title) {
                        createLesson.alterTitle(
                          title: title,
                        );
                      },
                    ),
                    Container(
                      height: 550,
                      width: 400,
                      child: ListView.builder(
                        itemCount: lessonCards.length,
                        itemBuilder: (BuildContext context, int cardsIndex) {
                          final ContentType card = lessonCards[cardsIndex];
                          if (card is TitleType)
                            return TitleCard(cardsIndex: cardsIndex);
                          else if (card is BodyType)
                            return BodyCard(cardsIndex: cardsIndex);
                          else if (card is ReadingType)
                            return Text('reading');
                          else if (card is VocabType)
                            return VocabCard(cardsIndex: cardsIndex);
                          else if (card is TranslationType)
                            return TranslationCard(cardsIndex: cardsIndex);
                          else
                            return Text('invalid');
                        },
                      ),
                    ),
                    Wrap(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () =>
                              createLesson.addCard(types.titleType),
                          child: Text('add Title Card'),
                        ),
                        RaisedButton(
                          onPressed: () => createLesson.addCard(types.bodyType),
                          child: Text('add Body Card'),
                        ),
                        RaisedButton(
                          onPressed: () =>
                              createLesson.addCard(types.readingType),
                          child: Text('add Reading Card'),
                        ),
                        RaisedButton(
                          onPressed: () =>
                              createLesson.addCard(types.vocabType),
                          child: Text('add Vocab Card'),
                        ),
                        RaisedButton(
                          onPressed: () =>
                              createLesson.addCard(types.translationType),
                          child: Text('add Translation Card'),
                        ),
                        Consumer<FinalizeLessonProxy>(
                          builder: (_, finalizeLessonProxy, __) {
                            return RaisedButton(
                              onPressed: () => {
                                finalizeLessonProxy.finalize(
                                    lessonCards: lessonCards,
                                    title: createLesson.title),
                                Navigator.pop(context),
                              },
                              child: Text('finish'),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
