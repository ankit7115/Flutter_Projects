import "package:flutter/material.dart";
import "package:quiz_adv_app/summaryquestions/index_summary.dart";
import "package:google_fonts/google_fonts.dart";

class SummaryItem extends StatelessWidget{
  SummaryItem({super.key,required this.itemData});

  bool isCorrectAnswer = false;

  final Map<String,Object> itemData;
  @override
  Widget build(context){
    if( itemData['correct_answer']==itemData['user_answer']){
      isCorrectAnswer = true;
    }
    return Row( 
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SummaryIndex(itemData,isCorrect: isCorrectAnswer,
                  questionIndex: itemData['question_index'] as int,
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text((((itemData['question']) as String)),
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(210, 255, 255, 255),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      const SizedBox(height: 5,),
                      Text(((itemData['user_answer']) as String),
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(221, 213, 100, 194),
                      ),
                      ),
                      Text(((itemData['correct_answer']) as String),
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(221, 100, 160, 213),
                      ),
                      ),
                      const SizedBox(height: 5,),
                    ],),
                  )
              ],
              );
  }
}