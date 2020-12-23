import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  // The term 'final' prevents usr to reassign questionText.
  // different from const.
  // We don't know what value will get into questionText during development.
  // But when the code compiles, questionText locks a value or changes value according to map in main file when it rebuilds.

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // The line above means the container can take as much width as desired
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center, // The term "TextAlign.center" is an enum.
      ),
    );
  }
}
