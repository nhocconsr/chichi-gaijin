import 'package:chichi_gaijin/models/word.dart';
import 'package:chichi_gaijin/providers/search_proxy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayOrSearchWords extends StatelessWidget {
  final int cardsIndex;
  final int translationIndex;

  const DisplayOrSearchWords({
    @required this.cardsIndex,
    @required this.translationIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProxy>(
      builder: (_, searchProxy, __) {
        Word word = searchProxy.currentWord(
            cardsIndex: cardsIndex, translationIndex: translationIndex);
        bool alive = searchProxy.alive;
        //here we get the bool checking whether i should show the searchbar or word
        return alive && searchProxy.current == translationIndex
            ? Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () => searchProxy.kill2(cardsIndex, translationIndex),
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.blue,
                      child: searchProxy.filteredList == null
                          ? Container(
                              height: 20,
                              width: 20,
                              color: Colors.amber,
                            )
                          : ListView.builder(
                              itemCount: searchProxy.filteredList.length,
                              itemBuilder: (BuildContext context,
                                  int filteredListIndex) {
                                return GestureDetector(
                                  onTap: () => searchProxy.kill3(
                                    cardsIndex,
                                    translationIndex,
                                    searchProxy
                                        .filteredList[filteredListIndex],
                                  ),
                                  child: Text(
                                    searchProxy
                                        .filteredList[filteredListIndex].romaji,
                                  ),
                                );
                              }),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search Words',
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    initialValue: word.romaji,
                    onChanged: (romaji) {searchProxy
                                              .updateFilteredList(romaji);},
                  )
                ],
              )
            : GestureDetector(
                onTap: () => searchProxy.live(current: translationIndex),
                child: Container(
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                  ),
                  child: Text('${word.romaji}'),
                ),
              );
      },
    );
  }
}
