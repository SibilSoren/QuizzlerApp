import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questionBank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


QuestionBank questionBank = QuestionBank();
void main() => runApp(MaterialApp(
  home: MyApp(),
)
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizzler'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
          child: QuizPage()
        )
      ),
    );
  }
}


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {



  List<Icon> scoreKeeper = [
    // Icon(Icons.check,color: Colors.green),
    // Icon(Icons.close,color: Colors.red),
  ];

  List<Icon> scoreAdder = [];

  void answerChecker(bool checkedAnswer){

    bool correctAnswer = questionBank.getAnswers();
    setState(() {
      if(questionBank.isFinished() == true){
        Alert(
          context: context,
          title: 'Finished',
            desc: 'You have reached the end of the quiz'
        ).show();
        questionBank.reset();
        scoreKeeper = [];
      }


    if(checkedAnswer == correctAnswer){
      scoreKeeper.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    }else{
      scoreKeeper.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }

      questionBank.questionChanger();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(questionBank.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                ),),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(onPressed: (){
              // questionBank.questions[i].answers = true;
              answerChecker(true);
            },
              color: Colors.green,
              child: Text('True',style:
              TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(onPressed: () {
              answerChecker(false);
            },
                color: Colors.red,
                child: Text('False',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                  ),)
            ),
          ),
        ),
        Row(
          children:scoreKeeper,
        )
      ]
    );
  }
}


