import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;   // declaring pointer to a function passed into object
  final String answerText;
  
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answerText),
        // notice that there's no RoundBraces at answerQuestion method
        // with RoundBraces, the method is immediately called; but onPressed expects a Function, not value
        // so name is given to call everytime user clicks button
        onPressed: selectHandler,
      ),
    );
  }
}
