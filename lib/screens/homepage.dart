import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:quizapp/models/categories.dart';

class HomePage extends StatelessWidget{
  final List<Color> tileColours = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.red,
    Colors.deepOrange,
    Colors.amber,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor
              ),
              height: 200,
            )
          ),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0
                  ),
                  child: Text(
                    "Please select a quiz category",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0
                    ),
                  ),
                ),
                //
              ),
            ],
          )
        ],
      )
    );
  }

  /*
  //Add categories to screen
  Widget _buildCategoryItem(BuildContext context, int index){
    Category category = categories[index];
    return MaterialButton(
      onPressed: () => _categoryPressed)
  }

  //Handle selection of quiz type
  _categoryPressed(BuildContext context, Category category){
    showModalBottomSheet(
      context: context, 
      builder: (sheetContext) => BottomSheet(
        onClosing: () {}, 
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
      ),
    );
  }
  */
}