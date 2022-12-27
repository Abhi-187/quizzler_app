import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // Question q1 = Question(q: 'kem cho', a: 'True');
  List<Widget> scoreKeeper = [];
  // List<String> questions = [
  //   'Coffee?',
  //   'Movie?',
  //   'Aati kya Khandala?',
  // ];
  // List<String> answers = ['False', 'True', 'True'];

  List<Question> questionBank = [
    Question(q: 'try1', a: 'False'),
    Question(q: 'try2', a: 'True'),
    Question(q: 'try3', a: 'True'),
  ];
  int questionNumber = 0;

  void answerchecker(String selectedanswer) {
    if (questionBank[questionNumber].questionAnswer == selectedanswer) {
      setState(() {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        questionNumber++;
      });
    } else {
      setState(() {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.redAccent,
          ),
        );
        questionNumber++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.deepOrangeAccent,
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                answerchecker('True');
              },
              //Color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.pink,
                backgroundColor: Colors.blueGrey,
              ),
              //color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                answerchecker('False');
              },
            ),
          ),
        ),
        Row(children: scoreKeeper)
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
