
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  AnswerButton({required this.answerText,required this.onTap,super.key});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
          backgroundColor: Color.fromARGB(255, 11, 34, 80),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35))
        ),
        onPressed: onTap,
        child: Text(answerText,textAlign: TextAlign.center,));
  }

}