import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// The main() usage below can only be used when only one line/ expression is run in it.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var questionIndex = 0;

  void answerQuestion() {
    questionIndex = questionIndex + 1;
    print('Answer chosen!');
    print(questionIndex);
  }

  @override // To mark that we are deliberatly overriding the existing
  // method using our own build method below

  //build is run everytime the screen is rebuilt
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
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
              Text(
                questions[questionIndex],
              ),
              RaisedButton(
                child: Text('Answer 1'),
                // notice that there's no RoundBraces at answerQuestion method
                // with RoundBraces, the method is immediately called; but onPressed expects a Function, not value
                // so name is given to call everytime user clicks button
                onPressed: answerQuestion,
              ),
              RaisedButton(
                child: Text('Answer 2'),
                onPressed: () => print(
                    'Answer 2 chosen!'), // Use this way for single function line
              ),
              RaisedButton(
                child: Text('Answer 3'),
                onPressed: () {
                  // Use this way for longer function body
                  print('Answer 3 chosen!');
                },
              ),
            ],
          )),
    );
  }
}
