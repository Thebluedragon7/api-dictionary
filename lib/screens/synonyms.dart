import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/providers/historyProvider.dart';
import 'dictionaryPageBuilder.dart';

class Synonyms extends StatelessWidget {
  final List<String> synonyms;

  const Synonyms({Key? key, required this.synonyms}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: synonyms.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(synonyms[index]),
          onTap: () {
            context.read<HistoryProvider>().appendHistory(synonyms[index]);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DictionaryPageBuilder(word: synonyms[index].toLowerCase().toString()))
            );
          },
        );
      },
    );
  }
}
