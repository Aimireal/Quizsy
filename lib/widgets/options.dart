import 'dart:io';
import 'package:flutter/material.dart';

import 'package:quizapp/models/categories.dart';
import 'package:quizapp/models/questions.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/utils/networking.dart';
import 'package:quizapp/screens/error.dart';
import 'package:quizapp/screens/quiz_page.dart';

class QuizOptionsDialog extends StatefulWidget{
  final Category category;
  const QuizOptionsDialog({Key? key, required this.category}) : super(key: key);

  @override
  _QuizOptionsDialogState createState() => _QuizOptionsDialogState();
}

class _QuizOptionsDialogState extends State<QuizOptionsDialog>{
  late int _totalQuestions = 10;
  late String _difficulty = "Medium";
  late bool _loading = false;

  @override
  void initstate(){
    //Defaults
    super.initState();
    _totalQuestions = 10;
    _difficulty = "medium";
    _loading = false;
  }
    
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey.shade200,
            child: Text(
              widget.category.name,
              //style: Theme.of(context).textTheme.headline6.copyWith(),
            ),
          ),
          SizedBox(height: 10.0),
          Text("Select the Number of Questions"),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 16,
              spacing: 16,
              children: <Widget>[
                SizedBox(width: 0.0),
                ActionChip(
                  label: Text("10"), 
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _totalQuestions == 10 ? kPurple : kGrey,
                  onPressed: () => _selectNumberOfQuestions(10),
                ),
                ActionChip(
                  label: Text("20"), 
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _totalQuestions == 10 ? kPurple : kGrey,
                  onPressed: () => _selectNumberOfQuestions(20),
                ),
                ActionChip(
                  label: Text("30"), 
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _totalQuestions == 10 ? kPurple : kGrey,
                  onPressed: () => _selectNumberOfQuestions(30),
                ),
                ActionChip(
                  label: Text("40"), 
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _totalQuestions == 10 ? kPurple : kGrey,
                  onPressed: () => _selectNumberOfQuestions(40),
                ),
                ActionChip(
                  label: Text("50"), 
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _totalQuestions == 10 ? kPurple : kGrey,
                  onPressed: () => _selectNumberOfQuestions(50),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text("Choose your difficulty"),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              runSpacing: 16.0,
              spacing: 16.0,
              children: <Widget>[
                ActionChip(
                  label: Text("Easy"), 
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _difficulty == diffEasy ? kPurple : kGrey,
                  onPressed: () => _selectDifficulty(diffEasy),
                ),
                ActionChip(
                  label: Text("Medium"), 
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _difficulty == diffMedium ? kPurple : kGrey,
                  onPressed: () => _selectDifficulty(diffMedium),
                ),
                ActionChip(
                  label: Text("Hard"), 
                  labelStyle: TextStyle(color: Colors.white),
                  backgroundColor: _difficulty == diffHard ? kPurple : kGrey,
                  onPressed: () => _selectDifficulty(diffHard),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          _loading ? CircularProgressIndicator() : ElevatedButton(
            onPressed: _loadQuiz, 
            child: Text("Begin"),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  _selectNumberOfQuestions(int i){
    setState(() {
      _totalQuestions = i;
    });
  }

  _selectDifficulty(String s){
    setState(() {
      _difficulty = s;
    });
  }

  void _loadQuiz() async{
    setState(() {
      _loading = true;
    });
     try {
      List<Question> questions =  await getQuestions(widget.category, _totalQuestions, _difficulty);
      Navigator.pop(context);
      if(questions.length < 1) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => ErrorPage(message: "There are not enough questions in the category, with the options you selected.",)
        ));
        return;
      }
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => QuizPage(questions: questions, category: widget.category,)
      ));
      }on SocketException catch (_) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => ErrorPage(message: "Can't reach the servers, \n Please check your internet connection.",)
      ));
    } catch(e){
      print(e);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => ErrorPage(message: "Unexpected error trying to connect to the API",)
      ));
    }
    setState(() {
      _loading=false;
    });
  }
}