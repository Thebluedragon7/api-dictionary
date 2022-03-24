import 'package:apidictionary/models/dictionaryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefWord extends StatelessWidget {
  final String partOfSpeech;
  final List<Definitions> definitions;
  const DefWord({Key? key, required this.partOfSpeech, required this.definitions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: definitions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(definitions[index].definition),
        );
      },
    );
  }
}
