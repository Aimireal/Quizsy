import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:quizapp/models/categories.dart';
import 'package:quizapp/utils/constants.dart';
import 'package:quizapp/widgets/options.dart';
import 'package:quizapp/screens/login_screen.dart';


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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/quizsylogo.png',
              fit: BoxFit.contain,
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              child: Text("Quizsy"),
            )
          ],
        ),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle_rounded,
              color: Colors.white
            ),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                )
              );
            },
          )
        ]
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
              height: double.infinity,
            ),
          ),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0
                  ),
                  child: Text(
                    "Choose your Category",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width >
                      1000 ? 7 : MediaQuery.of(context).size.width > 600 ? 5 : 3,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0
                  ),
                  delegate: SliverChildBuilderDelegate(
                    _buildCategoryItem,
                    childCount: categories.length,
                  )
                ),
              ),
            ],
          ),
        ],
      )
    );
  }

  //Add categories to screen
  Widget _buildCategoryItem(BuildContext context, int index){
    Category category = categories[index];
    return MaterialButton(
      onPressed: () => _categoryPressed(context, category),
      elevation: 1.0,
      highlightElevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: kGrey,
      textColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(category.icon != null)
            Icon(category.icon),
          if(category.icon != null)
            SizedBox(height: 5.0),
          AutoSizeText(
            category.name,
            minFontSize: 10.0,
            textAlign: TextAlign.center,
            maxLines: 3,
            wrapWords: false,
          ),
        ],
      ),
    );
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
}