import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class QuestionsScreen extends StatefulWidget {
  static const String routeName = 'questions-screen';
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late List<String> questionsAndAnswers = [];
  String currentQuestion = '';

  late VideoPlayerController _videoController;
  late Future<void> _videoInitFuture;

  @override
  void initState() {
    super.initState();
    loadQuestionsFromFile();
    _videoController = VideoPlayerController.asset('assets/vids/vid_bg.mp4')
      ..setLooping(true);
    _videoInitFuture = _videoController.initialize().then((_) {
      _videoController.play();
    });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  Future<void> loadQuestionsFromFile() async {
    // Load the text file content from the assets.
    final String data = await rootBundle.loadString('assets/text/qText.txt');
    final List<String> lines = data.split('\n');
    questionsAndAnswers = [];

    for (final line in lines) {
      // Split the line into question and answer parts using "#" and "*".
      final parts = line.split('#');
      if (parts.length == 2) {
        questionsAndAnswers.add('${parts[0]}?${parts[1]}');
      }
    }

    // Set the initial question.
    if (questionsAndAnswers.isNotEmpty) {
      setCurrentQuestion();
    }
  }

  void setCurrentQuestion() {
    if (questionsAndAnswers.isNotEmpty) {
      final random = questionsAndAnswers[DateTime.now().millisecond % questionsAndAnswers.length];
      setState(() {
        currentQuestion = random.split('?')[0];
      });
    } else {
      setState(() {
        currentQuestion = 'No questions available'; // or any other appropriate message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
        leading: BackButton(
          color: Colors.yellow,
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ),
      body: FutureBuilder(
        future: _videoInitFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SizedBox(
                      width: _videoController.value.size?.width ?? 0,
                      height: _videoController.value.size?.height ?? 0,
                      child: VideoPlayer(_videoController),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.white,
                          width: double.infinity,
                          child: Text(
                            currentQuestion,
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: TextFormField(),
                      ),
                      Expanded(
                        flex: 4,
                        child: Image.asset('assets/images/magic_label.png'),
                      ),
                      ElevatedButton(
                        onPressed: setCurrentQuestion,
                        child: Text('Next Question'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
