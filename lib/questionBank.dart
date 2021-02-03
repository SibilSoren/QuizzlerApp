import 'questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuestionBank {

  int i = 0;

  List<Question> _questions = [
    Question(questionText:'Waterloo has the greatest number of tube platforms in London',answers: true),
    Question(questionText:'M&M stands for Mars and Moordale',answers: false),
    Question(questionText:'Gin is typically included in a Long Island Iced Tea',answers:true),
    Question(questionText: 'The unicorn is the national animal of Scotland',answers: true),
    Question(questionText:'There are two parts of the body that can\'t heal themselves',answers: false),
    Question(questionText:'There are 219 episodes of Friends',answers: false),
    Question(questionText: 'A lion\'s roar can be heard up to eight kilometres away',answers: true),
    Question(questionText: 'Cinderella was the first Disney princess',answers: false),
    Question(questionText: 'H&M stands for Hennes & Mauritz',answers: true),
    Question(questionText: 'Coffee is made from berries',answers: true)
  ];

  String getQuestionText(){
    return _questions[i].questionText;
  }

  bool getAnswers(){
    return _questions[i].answers;
  }

  void questionChanger() {
    if (i < _questions.length - 1) {
      i++;
    }
  }

  bool isFinished(){
    if(i >=_questions.length - 1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    i = 0;
  }
}
