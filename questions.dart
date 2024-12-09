import 'package:flutter/material.dart';
import 'package:quiz/answerbutton.dart';
import 'package:quiz/data/questions.dart';
//import 'package:quizapp/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onselectanswer, super.key});
  final void Function(String answer) onselectanswer;
  @override
  State<QuestionsScreen> createState() {
    return QuestionsState();
  }
}

class QuestionsState extends State<QuestionsScreen> {
  var currentquestionindex = 0;
  void answerquestion(String selectedanswer) {
    widget.onselectanswer(selectedanswer);
    // by using widget. i can get access to the varaiabls of the upper class wich are extended
    setState(() {
      currentquestionindex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = questions[currentquestionindex];
    // to make the code full we have 2 way that is one wrapping the column with center and mainaxissize
    //and the other is wrapping column with sizedbox and making width double.infinity
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //map() transforms each item in a collection based on a given function and returns
          // a new collection of transformed items.
          //The ... operator in Dart (used in Flutter) is called the spread operator. It is used to unpack or spread the elements of a collection (such as a list, set, or map) into another collection. This allows you to combine or merge
          //collections in a concise and readable manner.
          //List<int> list1 = [1, 2, 3];
          //List<int> list2 = [4, 5, ...list1]; // list2 becomes [4, 5, 1, 2, 3]
          //we can it into anything
          children: [
            Text(currentquestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 25),
            ...currentquestion.getshuffledanswers().map((answer) {
              return AnswerButton(
                  ontap: () {
                    answerquestion(answer);
                  },
                  answertext: answer);
            }),
          ],
        ),
      ),
    );
  }
}
