import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  // The term 'final' prevents usr to reassign questionText

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
