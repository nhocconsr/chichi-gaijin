import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/providers/create_lesson.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TitleCard extends StatelessWidget {
  final int cardsIndex;

  const TitleCard({
    @required this.cardsIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateLesson>(
      builder: (_, createLesson, __) {
        final card = (createLesson.lessonCards[cardsIndex] as TitleType);
        return Card(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
                initialValue: card.title,
                onChanged: (title) {
                  createLesson.alterTitleCard(
                    cardsIndex: cardsIndex,
                    title: title,
                    subtitle: card.subtitle,
                  );
                },
              ),
              (createLesson.lessonCards[cardsIndex] as TitleType).subtitle ==
                      null
                  ? RaisedButton(
                      onPressed: () => createLesson.addSubtitle(cardsIndex: cardsIndex),
                      child: Text('add subtitle'),
                    )
                  : TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Subtitle',
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      initialValue: card.subtitle == null ? '' : card.subtitle,
                      onChanged: (subtitle) {
                        createLesson.alterTitleCard(
                            cardsIndex: cardsIndex,
                            title: (createLesson.lessonCards[cardsIndex]
                                    as TitleType)
                                .title,
                            subtitle: subtitle);
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
