import "package:flutter/material.dart";
import 'package:quiz_adv_app/summaryquestions/question_summary.dart';
import "package:quiz_adv_app/data/questions.dart";
import "package:google_fonts/google_fonts.dart";

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.choosenAnswer,super.key,required this.onRestart});
  final List<String> choosenAnswer;
  final void Function() onRestart; 

  List<Map<String,Object>> getSummary(){
    List<Map<String,Object>> summary = [];

    for(var i = 0; i < choosenAnswer.length ;i++){
      summary.add({
        'question_index':i,
        'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':choosenAnswer[i],
      },
      );
    }
    return summary;
  }
  @override
  Widget build(context) {
    final summaryData=getSummary();
    final totalquestion=questions.length;
    final answercorrect = summaryData.where((data){
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
             Center(
              child: Text(
                "You answered $answercorrect out of $totalquestion questions correctly!",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(210, 205, 180, 243),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            const SizedBox(height: 50),
            QuestionSummary(summaryData),
            const SizedBox(height: 50),
            OutlinedButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 193, 189, 237),
                  textStyle: const TextStyle(fontSize: 20)),
              icon: const Icon(Icons.restart_alt_outlined),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
