import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizapp/models/categories.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/utils/constants.dart';

Future<List<Question>> getQuestions(Category category, int total, String difficulty) async{
  String url = "$apiURL?amount=$total&category=${category.id}";
  // ignore: unnecessary_null_comparison
  if(difficulty != null){
    url = "$url&difficulty=$difficulty";
  }
  http.Response res = await http.get(Uri.parse(url));
  List<Map<String, dynamic>> questions = List<Map<String, dynamic>>.from(
    json.decode(res.body)["results"]
  );
  return Question.fromData(questions);
}