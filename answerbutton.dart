import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton( {required this.ontap,required this.answertext, super.key});
  final VoidCallback ontap;
  final String answertext;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed:ontap,
        style: ElevatedButton.styleFrom(
          padding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          backgroundColor:const Color(0x2C3CA4E6),
        foregroundColor: Colors.white,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(40) ) ),
        child: Text(answertext,textAlign: TextAlign.center,));
  }
}
