import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/dictionaryModel.dart';

List data = [];
List<DictionaryModel> dictionaryModel = [];
Future<List<DictionaryModel>> fetchWord(String userInput) async {
  var url = Uri.https('api.dictionaryapi.dev', '/api/v2/entries/en/' + userInput);
  var response = await http.get(url);
  data = json.decode(response.body);
  dictionaryModel = data.map((json) => DictionaryModel.fromJson(json)).toList();
  log("Object Created!");
  return dictionaryModel;
}
