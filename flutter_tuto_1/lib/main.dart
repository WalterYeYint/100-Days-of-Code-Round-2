// All the system libraries here
import 'package:flutter/material.dart';

// All your own libraries here
import './quiz.dart'; // The term ./ means to serach in the same directory
import './answer.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

// The main() usage below can only be used when only one line/ expression is run in it.
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // underscore in front of _MyAppState turns this class into private class
  // This prevents this class from being used/edited by outside code

  var _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 6},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': [
        {'text': 'Jack', 'score': 1},
        {'text': 'Sam', 'score': 1},
        {'text': 'Guy', 'score': 1},
        {'text': 'Eep', 'score': 1},
      ],
    },
    // The curl braces above is called Map data structure
    // similar to dictionary from python
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override // To mark that we are deliberatly overriding the existing
  // method using our own build method below

  //build is run everytime the screen is rebuilt
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // Comments at the ends are
          // To help flutter auto-format nicer.
          title: Text('My Crash Course App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
