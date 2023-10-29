import 'package:flutter/material.dart';
import 'package:magic_soccer/UI/question_field.dart';

class QuestionsScreen extends StatefulWidget {
  static const String routeName = 'questions';

  QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  // Define a TextEditingController for the answer text field
  final TextEditingController answerController = TextEditingController();

  // Define a variable to track whether the answer is correct
  bool isAnswerCorrect = false;

  // Function to validate the answer
  void validateAnswer(String userAnswer) {
    if (userAnswer.toLowerCase() == 'correct answer') {
      // If the answer is correct, set the variable to true
      setState(() {
        isAnswerCorrect = true;
      });
    } else {
      // Handle incorrect answer here
    }
  }
  var answerr = 'magic_label.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/magic_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            QuestionField(),
            // Text field for the user's answer
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: answerController,
                decoration: InputDecoration(
                  hintText: 'Type your answer here',
                ),
              ),
            ),
            // Button to confirm the answer
            ElevatedButton(style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.yellow; // Color for the pressed state
                  }
                  return Colors.yellowAccent; // Default color
                },
              ),
            ),
              onPressed: () {
                answerr = 'modric.png';

                // String userAnswer = answerController.text;
                // validateAnswer(userAnswer);
              },
              child: Text('Confirm Answer',
              style: TextStyle(color: Colors.black),),
            ),
            // Image that changes after the answer is confirmed
            if (isAnswerCorrect)

              Container(
                height: 400,
                  child: Image.asset('assets/images/modric.png',fit: BoxFit.fill,)
              )
            else
              Container(
                height: 400,
                  child: Image.asset('assets/images/${answerr}',fit: BoxFit.fill)
              ),
          ],
        ),
      ),
    );
  }
}
