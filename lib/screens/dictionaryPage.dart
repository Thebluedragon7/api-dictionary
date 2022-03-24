import 'package:apidictionary/screens/antonyms.dart';
import 'package:apidictionary/screens/defWord.dart';
import 'package:apidictionary/screens/synonyms.dart';
import 'package:flutter/material.dart';
import '../models/dictionaryModel.dart';
import '../widgets/playButton.dart';

class DictionaryPage extends StatelessWidget {
  final int tabLength;
  final String word;
  final List<DictionaryModel> data;

  const DictionaryPage({Key? key,
    required this.tabLength,
    required this.word,
    required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  word,
                ),
                actions: [
                  PlayButton(link: data[index].phonetics[index].audio)
                ],
                bottom: const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      text: "Definitions",
                    ),
                    Tab(
                      text: "Synonyms",
                    ),
                    Tab(
                      text: "Antonyms",
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  DefWord(
                    partOfSpeech: data[index].meanings[index].partOfSpeech,
                    definitions: data[index].meanings[index].definitions,
                  ),
                  Synonyms(
                    synonyms: data[index].meanings[index].synonyms,
                  ),
                  Antonyms(
                    antonyms: data[index].meanings[index].antonyms,
                  ),
                ],
              ),
            ),
        );
      },
    );

    // return DefaultTabController(
    //     length: tabLength,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: Text(word),
    //         actions: [
    //           PageAction(link: data[0].phonetics[0].audio)
    //         ],
    //       ),
    //     ),
    // );
  }
}
