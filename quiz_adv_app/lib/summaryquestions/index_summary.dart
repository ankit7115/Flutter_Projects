import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class SummaryIndex extends StatelessWidget{
  const SummaryIndex(this.datafrindex,
  {super.key,
  required this.isCorrect,
  required this.questionIndex
  }
  );

  final Map<String,Object> datafrindex;
  final bool isCorrect;
  final int questionIndex;
  @override
  Widget build(context){
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrect?
              const Color.fromARGB(255, 75, 166, 114):
              const Color.fromARGB(255, 176, 65, 165),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
                      (questionIndex+1).toString(),
                      style: GoogleFonts.lato(
                       color: const Color.fromARGB(255, 10, 7, 7),
                       fontWeight: FontWeight.bold,
                      ),
                    ),
    );
  }
}