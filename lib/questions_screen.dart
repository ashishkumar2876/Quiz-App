import 'dart:ffi';
import 'package:quiz_app/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/quiz_question.dart';
class QuestionsScreen extends StatefulWidget{
  QuestionsScreen({super.key,required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var CurrentQuestionIndex=0;

  void answerQuestion(String selectedAnswer){
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      CurrentQuestionIndex++;
    });
  }


  @override
  Widget build(context) {
    final currentQ=questions[CurrentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(currentQ.text,
              style: GoogleFonts.lato(fontSize: 18,
                  color: Color.fromARGB(255, 137, 171, 204),
                  fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
              ...currentQ.getShuffledAnswers().map((answer){
              return AnswerButton(answerText: answer,onTap:(){
                answerQuestion(answer);
              });
            }),

          ],
        ),
      ),
    );
  }

}