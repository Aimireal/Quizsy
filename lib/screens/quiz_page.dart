import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';

import 'package:quizapp/models/categories.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/screens/quiz_finished.dart';

class QuizPage extends StatefulWidget{
  final List<Question> questions;
  final Category category;
  const QuizPage({Key? key, required this.questions, required this.category}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}