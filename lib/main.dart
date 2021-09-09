import 'package:flutter/material.dart';
import 'package:quizapp/screens/homepage.dart';
import 'package:quizapp/utils/constants.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizsy',
      theme: ThemeData(
        primaryColor: kPink,
        accentColor: kPurple,
        backgroundColor: kGrey,
        fontFamily: "Montserrat",
        buttonColor: kPink,
        buttonTheme: ButtonThemeData(
          buttonColor: kPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          textTheme: ButtonTextTheme.primary
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: kGrey,
            textStyle: TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}