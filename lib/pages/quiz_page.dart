import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/score_page.dart';
import 'package:quiz_app/ui/answer_button.dart';
import 'package:quiz_app/ui/correct_wrong_overlay.dart';
import 'package:quiz_app/ui/question_text.dart';
import 'package:quiz_app/utils/quiz.dart';
import 'package:quiz_app/utils/questions.dart';


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  Questions currentQuestion ;
  Quiz quiz = Quiz([
    Questions('Elon Mask is human ?' , false) ,
    Questions('ElBOB is human ?' , false) ,
    Questions('Pizza is healthy ?' , false) ,
    Questions('Flutter is awesome ?' , true) ,
  ]) ;

  String questionText ;
  int questionNumber ;
  bool isCorrect ;
  bool overlayShouldBeVisible = false ;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion ;
    questionText = currentQuestion.question ;
    questionNumber = quiz.questionNumber ;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answers == answer) ;
    quiz.answer(isCorrect) ;
    this.setState((){
      overlayShouldBeVisible = true ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand ,
      children: <Widget>[
        Column(
          children: <Widget>[
            AnswerButton(true , () => handleAnswer(true) ),
            QuestionText(questionText , questionNumber),
            AnswerButton(false , () => handleAnswer(false) ),
          ],
        ),
        overlayShouldBeVisible == true ? CorrectWrongOverlay(
          isCorrect ,
            (){
            if(quiz.length == questionNumber) {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => ScorePage(quiz.score , quiz.length)) , (Route route) => route == null ) ;
              return ;
            }
            currentQuestion = quiz.nextQuestion ;
            this.setState((){
              overlayShouldBeVisible = false ;
              questionText = currentQuestion.question ;
              questionNumber = quiz.questionNumber ;
            }) ;
            }
        ) : Container() ,
      ],
    );
  }
}
