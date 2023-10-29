import 'package:flutter/material.dart';

class QuestionField extends StatefulWidget {
  const QuestionField({super.key});

  @override
  State<QuestionField> createState() => _QuestionFieldState();
}

class _QuestionFieldState extends State<QuestionField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.yellowAccent,width: 2),
          borderRadius: BorderRadius.circular(25)
        ),
        child: Center(
          child: Text("Who's the GOAT ?",style: TextStyle(
            fontSize: 20
          ),),
        ),
      ),
    );
  }
}
