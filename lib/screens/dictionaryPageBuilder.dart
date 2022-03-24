import 'package:apidictionary/models/dictionaryModel.dart';
import 'package:apidictionary/screens/splashScreens/loadingScreen.dart';
import 'package:flutter/material.dart';
import '../services/fetchWord.dart';
import 'dictionaryPage.dart';

class DictionaryPageBuilder extends StatelessWidget {
  final String word;
  const DictionaryPageBuilder({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DictionaryModel>>(
      future: fetchWord(word),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DictionaryModel> data = snapshot.data!;
          return DictionaryPage(
            word: word,
            tabLength: data.length,
            data: data,
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Text(snapshot.error.toString()),
          );
        } else {
          return const LoadingScreen();
        }
      },
    );
  }
}
