import 'package:flutter/material.dart';
import 'package:quiz_app/quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

//The main function is the starting point of our app.
void main() {
  runApp(const QuizApp());
}

//The stateless widget will give us access to the Flutter hot reload
//and hot restart functions. Also, it will contain our static/constant
//app design code.
class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.games_outlined,
            color: Colors.white,
            size: 30.0,
          ),
          title: const Text(
            'Quiz App',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),
        body: const QuizPage(),
      ),
    );
  }
}

//The stateful widget would hold the design and part of our code that is subject
//to changing the state of our app.
class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //The scoreKeeper list keeps a list of the scores on our app.
  //It has a static data type of icons.
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: 'FINISHED',
          desc: 'You\'ve reached the end of the quiz.',
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 200,
              child: const Text(
                'PLAY AGAIN',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),

            )
          ],
        ).show();

        quizBrain.reset();

        scoreKeeper = [];
      } else {
        //The condition checks if the selected answer is true or false.
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(const Icon(
            Icons.done,
            color: Colors.green,
            size: 25.0,
          ));
        } else {
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
            size: 25.0,
          ));
        }

        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                //This displays our questions from the list questions on the index
                //number in the questionNumber variable.
                quizBrain.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.green,
              ),
              //The user picked true when this button is clicked.
              onPressed: () {
                checkAnswer(true);
              },
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
              ),
              //The user picked false when this button is clicked.
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          //This wraps our scorekeeper icons.
          children: scoreKeeper,
        ),
      ],
    );
  }
}
