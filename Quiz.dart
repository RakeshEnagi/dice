import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return Quizstate();
  }
}
//in dart we can use function as values when the parathensis is not mentioned as below

class Quizstate extends State<Quiz> {
   List<String> selectedanswers = [];
  Widget? activescreen;
  @override
  void initState() {
    activescreen = StartScreen(switchscreen);
    super.initState();
  }

//initState is called only once when the State object is created and inserted into the widget tree.

  void chooseanswer(String answer) {
    selectedanswers.add(answer);
    if (selectedanswers.length == questions.length) {
      setState(() {
         selectedanswers = [];
          activescreen = StartScreen(switchscreen);
     
      });
    
    }
  }

  void switchscreen() {
    setState(() {
      activescreen = QuestionsScreen(
        onselectanswer: chooseanswer,
      );
    });
  }

//setstate allows the flutter to reexecute
// from the above code initially the activescreen is set to startscreen then after certain action
//it is rerendered to questionsscreen function
  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(228, 199, 71, 11),
                Color.fromRGBO(11, 101, 228, 0.173)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activescreen,
        ),
      ),
    );
  }
}
