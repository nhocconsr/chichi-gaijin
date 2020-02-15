import 'package:chichi_gaijin/build_widgets/title_card.dart';
import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/providers/create_lesson.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Build extends StatelessWidget {
  static const routeName = '/create';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false, //bottom overflowing fix
        appBar: AppBar(
          title: Text('create'),
        ),
        body: Consumer<CreateLesson>(
          builder: (_, createLesson, __) {
            final List<ContentType> lessonCards = createLesson.lessonCards;
            return Column(
              children: <Widget>[
                Container(
                  height: 500,
                  width: 400,
                  child: ListView.builder(
                    itemCount: lessonCards.length,
                    itemBuilder: (BuildContext context, int cardsIndex) {
                      final ContentType card = lessonCards[cardsIndex];
                      if (card is TitleType)
                        return TitleCard(
                          cardsIndex: cardsIndex,
                        );
                      else if (card is BodyType)
                        return Text('body');
                      else if (card is ReadingType)
                        return Text('reading');
                      else
                        return Text('invalid');
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => createLesson.addCard(types.titleType),
                      child: Text('add Title Card'),
                    ),
                    RaisedButton(
                      onPressed: () => createLesson.addCard(types.bodyType),
                      child: Text('add Body Card'),
                    ),
                    RaisedButton(
                      onPressed: () => createLesson.addCard(types.readingType),
                      child: Text('add Reading Card'),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
