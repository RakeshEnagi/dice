import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const  StartScreen(this.startquiz,{super.key});  //here the void Function() is a built in func in dart where the startquiz does not accept any parameters
  final void Function() startquiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //making a image transparent we can use 2 ways with opacity constructor and another by using color constructor

          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color:const  Color.fromARGB(150, 255, 255, 255),
          ),

          const SizedBox(height: 20),
           Text(
            'LEARN FLUTTER THE FUN WAY',
            style:  GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24
                
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              onPressed: () {
                 startquiz();
              },
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start the Quiz")),
        ],
      ),
    );
  }
}
