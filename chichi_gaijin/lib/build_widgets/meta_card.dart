import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/providers/create_lesson.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MetaCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateLesson>(
      builder: (_, createLesson, __) {
        final MetaType card = createLesson.lessonCards[0];
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
                    child: Text('Give The Lesson a Title'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Title',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    initialValue: card.title,
                    onChanged: (title) {
                      createLesson.alterMetaCard(
                        title: title,
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
