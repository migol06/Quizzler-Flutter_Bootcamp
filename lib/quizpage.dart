import 'package:flutter/material.dart';
import 'package:quizzler/data/question_data.dart';

QuestionData questionData = QuestionData();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> iconsAnswer = [];

  void checker() {
    setState(() {
      if (questionData.hasQuestion() == true) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Done"),
        ));
        questionData.reset();
        iconsAnswer = [];
      } else {
        nextQuestion();
        if (questionData.getAnswer() == true) {
          iconsAnswer.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          iconsAnswer.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionData.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checker();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checker();
              },
            ),
          ),
        ),
        Row(
          children: iconsAnswer,
        )
      ],
    );
  }

  void nextQuestion() {
    setState(() {
      questionData.nextQuestionNumber();
    });
  }
}
