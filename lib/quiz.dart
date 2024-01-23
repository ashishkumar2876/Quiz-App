import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/results_screen.dart';
class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
   List<String> selectedAnswers=[];
  @override
  Widget? ScreenWidget;
  String? activeScreen;
  void initState(){
    activeScreen ='start';
    super.initState();
  }
 void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length==questions.length){
      setState(() {
        activeScreen='results';
      });
    }
 }
 void againRestart(){
    setState(() {
      selectedAnswers=[];
      activeScreen='start';
    });
 }
  void SwitchScreen(){
    setState(() {
      activeScreen='question';
    }
    );
  }

  @override
  Widget build(context) {
    if (activeScreen == 'start') {
      ScreenWidget=StartScreen(startQuiz: SwitchScreen);
    }
    if (activeScreen == 'question') {
      ScreenWidget=QuestionsScreen(onSelectAnswer: chooseAnswer);
    }
    if(activeScreen == 'results'){
      ScreenWidget= ResultsScreen(chosenAnswers: selectedAnswers,func: againRestart);
    }
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color.fromARGB(220, 6, 68, 100),Color.fromARGB(
                        240, 2, 35, 68)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
              ),
              child: ScreenWidget
            )
        ),
      ),
    );
  }

}