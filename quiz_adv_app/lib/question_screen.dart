import "package:flutter/material.dart";
import "package:quiz_adv_app/answer_button.dart";
import "package:quiz_adv_app/data/questions.dart";
import "package:google_fonts/google_fonts.dart";

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key,required this.onSelected});
  final void Function(String answer) onSelected;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex=0;

  void answerQuestion(String answer){
    widget.onSelected(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }
  

  @override
  Widget build(context) {
    final currentquestion=questions[currentQuestionIndex];
    return SizedBox(
        width:double.infinity,
        child: Container(
          margin:const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Text(
                currentquestion.text,
              style: GoogleFonts.lato(
                color : Colors.white ,
                 fontSize: 30
              ), 
              textAlign: TextAlign.center,
                ),
              const SizedBox(
                height: 30,
              ),
              ...currentquestion.getShuffledAnswers().map((answer){
                return AnswerButton(
                  ansval:answer,
                  onTap:(){
                    answerQuestion(answer);
                  },
                );
              },
              )
              // AnswerButton(ansval: currentquestion.answers[0],onTap: () {}),
              // AnswerButton(ansval:currentquestion.answers[1],onTap: () {}),
              // AnswerButton(ansval:currentquestion.answers[2],onTap: () {}),
              // AnswerButton(ansval:currentquestion.answers[3],onTap: () {}),
              
              ],
            ),
        ),
      );
  }
}
