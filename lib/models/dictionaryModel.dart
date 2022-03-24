class Definitions {
  String definition;
  List<String> synonyms;
  List<String> antonyms;
  String example;

  Definitions.fromJson(Map<String, dynamic> json)
      : definition = json["definition"] ?? "",
        synonyms = List<String>.from(json["synonyms"].map((i) => i)),
        antonyms = List<String>.from(json["antonyms"].map((i) => i)),
        example = json["example"] ?? "";
}

class Phonetics {
  String text;
  String audio;

  Phonetics.fromJson(Map<String, dynamic> json)
      : text = json["text"] ?? "",
        audio = json["audio"] ?? "";
}

class License {
  String name;
  String url;

  License.fromJson(Map<String, dynamic> json)
      : name = json["name"] ?? "",
        url = json["url"] ?? "";
}

class Meanings {
  String partOfSpeech;
  List<Definitions> definitions;
  List<String> synonyms;
  List<String> antonyms;

  Meanings.fromJson(Map<String, dynamic> json)
      : partOfSpeech = json["partOfSpeech"] ?? "",
        definitions = List<Definitions>.from(
            json["definitions"].map((i) => Definitions.fromJson(i))),
        synonyms = List<String>.from(json["synonyms"].map((i) => i)),
        antonyms = List<String>.from(json["antonyms"].map((i) => i));
}

class DictionaryModel {
  String word;
  String phonetic;
  List<Phonetics> phonetics;
  List<Meanings> meanings;
  License license;
  List<String> sourceUrls;

  DictionaryModel.fromJson(Map<String, dynamic> json)
      : word = json["word"],
        phonetic = json["phonetic"] ?? "",
        phonetics = List<Phonetics>.from(
            json["phonetics"].map((i) => Phonetics.fromJson(i))),
        meanings = List<Meanings>.from(
            json["meanings"].map((i) => Meanings.fromJson(i))),
        license = License.fromJson(json["license"]),
        sourceUrls = List<String>.from(json["sourceUrls"].map((i) => i));
}
