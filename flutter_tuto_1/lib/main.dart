// All the system libraries here
import 'package:flutter/material.dart';

// All your own libraries here
import './question.dart'; // The term ./ means to serach in the same directory
import './answer.dart';

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

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print('Answer chosen!');
    print(_questionIndex);
  }

  @override // To mark that we are deliberatly overriding the existing
  // method using our own build method below

  //build is run everytime the screen is rebuilt
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': 'What\'s your favorite instructor?',
        'answers': ['Jack', 'Sam', 'Guy', 'Eep'],
      },
      // The curl braces above is called Map data structure
      // similar to dictionary from python
    ];
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            // Comments at the ends are
            // To help flutter auto-format nicer.
            title: Text('My Crash Course App'),
          ),
          body: Column(
            children: [
              Question(
                questions[_questionIndex]['questionText'],
              ),

              // The ... below is called Spread Operator.
              // It pulls all values of a list and assign each of them to children:[] list
              ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
                return Answer(_answerQuestion, answer);
              }).toList()
            ],
          ),
        ),
    );
  }
}
