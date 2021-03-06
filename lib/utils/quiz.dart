import 'package:quiz_app/utils/questions.dart';



class Quiz {
  List<Questions> _questions ;
  int _currentQuestionIndex = -1 ;
  int _score = 0 ;

  Quiz(this._questions) {
    _questions.shuffle() ;
  }

  List<Questions> get questions => _questions ;
  int get length => questions.length ;
  int get questionNumber => _currentQuestionIndex + 1 ;
  int get score => _score ;

  Questions get nextQuestion {
    _currentQuestionIndex ++ ;
    if(_currentQuestionIndex >= length){
      return null ;
    }else{
      return _questions[_currentQuestionIndex] ;
    }
  }

  void answer(bool isCorrect){
    if(isCorrect){
      _score ++ ;
    }
  }

}