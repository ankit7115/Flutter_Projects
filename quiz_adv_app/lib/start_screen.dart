import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "package:quiz_adv_app/styled_text.dart";

class StartScreen extends StatelessWidget{

  const StartScreen(this.switchScreen,{super.key});

  final void Function() switchScreen;


  @override
  Widget build(context){
    return Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz_logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
  
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz_logo.png',
          //     width: 300,
          //   ),
          // ),//transparency technique but not good to use
          const SizedBox(height: 40,),
           Text(
            'Learn Flutter the fun Way!',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30,),
          OutlinedButton.icon(
              onPressed: switchScreen,
              style: OutlinedButton.styleFrom(
                  // padding: const EdgeInsets.only(
                  //   top: 50,
                  //   ),
                  foregroundColor:const Color.fromARGB(255, 181, 195, 209),
                  textStyle: const TextStyle(fontSize: 30)),
              icon: const Icon(Icons.arrow_right_alt),
              label: const StyledText('Start Quiz'))
        ],
      ),
    );
  }
}
