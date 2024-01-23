import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/start_screen.dart';
class ResultsScreen extends StatelessWidget{
  ResultsScreen({super.key,required this.func,required this.chosenAnswers});
  final void Function() func;
  final List<String> chosenAnswers;
List<Map<String,Object>> getSummaryData() {
  final List<Map<String, Object>> summary = [];
  for (var i = 0; i < chosenAnswers.length; i++) {
    summary.add({
      'question_index': i,
      'question': questions[i].text,
      'correct_answer': questions[i].answers[0],
      'user_answer': chosenAnswers[i],
    }
    );
  }
  return summary;
}

  @override
  Widget build(BuildContext context) {
  final summaryData=getSummaryData();
  final totalAnswer=questions.length;
  final answerCorrect=summaryData.where((data){
    return data['user_answer']==data['correct_answer'];
  }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You Answered $answerCorrect out of $totalAnswer questions correctly!!',
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Color.fromARGB(240, 199, 210, 222),
                fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 30,),
            QuestionsSummary(getSummaryData()),
            SizedBox(height: 30,),
            TextButton.icon(
                icon: Icon(Icons.restart_alt),
                onPressed: func,
                label: Text('Restart',style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),
    );
  }

}