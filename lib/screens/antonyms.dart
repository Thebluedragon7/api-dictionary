import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/providers/historyProvider.dart';
import 'dictionaryPageBuilder.dart';

class Antonyms extends StatelessWidget {
  final List<String> antonyms;
  const Antonyms({Key? key, required this.antonyms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: antonyms.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(antonyms[index]),
          onTap: () {
            context.read<HistoryProvider>().appendHistory(antonyms[index]);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DictionaryPageBuilder(word: antonyms[index].toLowerCase().toString()))
            );
          },
        );
      },
    );
  }
}
