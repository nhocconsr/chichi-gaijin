import 'package:chichi_gaijin/models/content_type.dart';
import 'package:chichi_gaijin/models/word.dart';
import 'package:flutter/cupertino.dart';

//Holds a single Lesson in the process of being created
class CreateLesson with ChangeNotifier {
  List<ContentType> _lessonCards = [];

  List<ContentType> get lessonCards {
    return _lessonCards;
  }

  addCard(types type) {
    switch (type) {
      case types.titleType:
        _lessonCards.add(TitleType(title: ''));
        break;
      case types.bodyType:
        _lessonCards.add(BodyType(body: ''));
        break;
      case types.readingType:
        _lessonCards.add(
          ReadingType(
            sentence: [
              Word(
                japanese: '',
                romaji: '',
                english: '',
                definition: '',
              )
            ],
          ),
        );
        break;
      default:
        print('y u do this');
    }
    notifyListeners();
  }

  alterTitleCard({@required int cardsIndex, @required String title, @required String subtitle}) {
    TitleType card = subtitle == null
        ? TitleType(title: title)
        : TitleType(title: title, subtitle: subtitle);

    _lessonCards.replaceRange(
      cardsIndex,
      cardsIndex + 1,
      [card],
    );
    notifyListeners();
  }

  addSubtitle({@required int cardsIndex}) {
    TitleType card = _lessonCards[cardsIndex];

    _lessonCards.replaceRange(
      cardsIndex,
      cardsIndex + 1,
      [
        TitleType(title: card.title, subtitle: ''),
      ],
    );
    notifyListeners();
  
  }
}

enum types { titleType, bodyType, readingType }
