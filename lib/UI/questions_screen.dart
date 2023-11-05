import 'package:flutter/material.dart';
import 'package:magic_soccer/UI/pushRandomQuestion.dart';

class QuestionsScreen extends StatefulWidget {
  static const String routeName = 'questions-screen';





  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, String> questionMap =
    extractQuestionsAndAnswers('assets/text/qText.txt');
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/magic_bg.png'),
            fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.yellow,
            onPressed: (){
              Navigator.pushReplacementNamed(context, 'login');
            },
          ),
          title: Text('Questions'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(width:320 ,
                    color: Colors.white,
                    child: Text('$getRandomQuestion(questionMap)') ,
                  ),
                ),
                Expanded(
                  flex: 1,
                    child: TextFormField()
                ),
                Expanded(
                  flex: 3,
                    child: Image.asset('assets/images/magic_label.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
