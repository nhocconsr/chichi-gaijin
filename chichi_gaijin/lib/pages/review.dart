import 'package:chichi_gaijin/providers/deck.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Review extends StatelessWidget {
  static const routeName = '/reviews';
  @override
  Widget build(BuildContext context) {
    final deck = Provider.of<Deck>(context);
    final words = deck.words;

    return Scaffold(
      appBar: AppBar(
        title: Text('review'),
      ),
      body: words == null
          ? Text('no words')
          : ListView.builder(
              itemCount: words.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(words[index].romaji);
              },
            ),
    );
  }
}
