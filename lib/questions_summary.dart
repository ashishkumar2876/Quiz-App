import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget{
  QuestionsSummary(this.summary,{super.key});
  List<Map<String,Object>> summary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: 500,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: summary.map((data){
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30,right: 10),
                    child: CircleAvatar(
                        radius: 14,
                        child: Text(((data['question_index'] as int)+1).toString(),textAlign: TextAlign.center,)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(data['question'] as String,
                          style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(
                              255, 253, 254, 255)
                          ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 5),
                          Text(data['user_answer'] as String,
                            style: TextStyle(
                            color: Color.fromARGB(155, 3, 9, 30)
                          ),
                          textDirection: TextDirection.ltr,),
                          Text(data['correct_answer'] as String,style: TextStyle(
                            color: Color.fromARGB(244, 7, 127, 183)
                          ),
                          textAlign: TextAlign.left,),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

}