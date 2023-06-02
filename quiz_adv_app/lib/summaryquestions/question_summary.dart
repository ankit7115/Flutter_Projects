import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:quiz_adv_app/summaryquestions/summary_item.dart";


class QuestionSummary extends StatelessWidget{
  const QuestionSummary(this.summarydata,{super.key});

  final List<Map<String,Object>> summarydata;

  @override
  Widget build(context){
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map(
            (data){
              return SummaryItem(itemData: data);
            }
          ).toList()
        ),
      ),
    );
  }
}