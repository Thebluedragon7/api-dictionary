import 'dart:developer';
import 'package:apidictionary/screens/dictionaryPageBuilder.dart';
import 'package:apidictionary/services/providers/historyProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      style: Theme
                          .of(context)
                          .textTheme
                          .caption,
                      enabled: true,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.search),
                          labelText: 'Enter the word',
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                      onSubmitted: (val) {
                        provider.appendHistory(val);
                        log(val);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DictionaryPageBuilder(word: val.toLowerCase().toString()))
                        );
                      },
                    ),
                  ),
                ),
                _historySheet()
              ],
            ),
          ),
        );
      },
    );
  }

  DraggableScrollableSheet _historySheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: context.read<HistoryProvider>().history.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(context.read<HistoryProvider>().history[index]),// Text(favourites[index].name),
                  hoverColor: Colors.white,
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DictionaryPageBuilder(word: context.read<HistoryProvider>().history[index].toLowerCase().toString()))
                    );
                  },
                  trailing: IconButton(
                    onPressed: () {
                      context.read<HistoryProvider>().removeHistoryAt(index);
                    },
                    icon: const Icon(
                      Icons.remove_outlined
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

}
