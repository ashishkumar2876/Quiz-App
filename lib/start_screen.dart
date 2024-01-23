import 'package:flutter/material.dart';
import 'package:quiz_app/results_screen.dart';
class StartScreen extends StatelessWidget{
  StartScreen({required this.startQuiz,super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('Assets/images/quiz.jpg',width: 300),
          const SizedBox(height: 15,),
          OutlinedButton.icon(onPressed: startQuiz,
              icon: const Icon(Icons.start),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text('Start Quiz',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
          )
        ],
      ),
    );
  }

}