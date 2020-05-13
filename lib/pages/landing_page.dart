import 'package:flutter/material.dart';
import 'quiz_page.dart';


class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QuizPage())),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lets Quizzz !!' ,
              style: TextStyle(
                color: Colors.white ,
                fontSize: 50 ,
                fontWeight: FontWeight.bold ,
              ),
            ) ,
            Text(
              'Tap to start..' ,
              style: TextStyle(
                color: Colors.white ,
                fontSize: 20 ,
                fontWeight: FontWeight.bold ,
              ),
            ) ,
          ],
        ),
      ),
    );
  }
}
