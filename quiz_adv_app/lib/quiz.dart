import "package:flutter/material.dart";
import 'package:quiz_adv_app/data/questions.dart';
import 'package:quiz_adv_app/question_screen.dart';
import 'package:quiz_adv_app/start_screen.dart';
import 'package:quiz_adv_app/resultscreen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  final Color color1 = const Color.fromARGB(255, 65, 42, 114);
  final Color color2 = const Color.fromARGB(255, 65, 18, 134);

   List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if( selectedAnswers.length==questions.length){
      setState(() {
         activescreen = ResultScreen(choosenAnswer: selectedAnswers,onRestart: restartQuiz,);    
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activescreen = QuestionScreen(onSelected: chooseAnswer);
    });
  }
  Widget? activescreen;
  @override
  void initState() {
    activescreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activescreen = QuestionScreen(
        onSelected: chooseAnswer,
      );
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color1, color2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: activescreen),
      ),
    );
  }
}
