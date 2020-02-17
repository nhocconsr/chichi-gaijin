import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/providers/create_lesson.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyCard extends StatelessWidget {
  final int cardsIndex;

  const BodyCard({
    @required this.cardsIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateLesson>(
      builder: (_, createLesson, __) {
        final BodyType card = createLesson.lessonCards[cardsIndex];
        return Card(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 2.0,),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Body Card'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Text',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    initialValue: card.body,
                    onChanged: (body) {
                      createLesson.alterBodyCard(
                        cardsIndex: cardsIndex,
                        body: body,
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
