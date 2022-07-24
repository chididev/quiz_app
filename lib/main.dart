import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';

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
  //The questionBank would hold all of our questions and associate them with their
  //answers in a list.
  List<Questions> questionBank = [
    Questions(q: 'You can lead a cow down the stairs but not up the stairs', a: false),
    Questions(q: 'Approximately one quarter of the human bones are in the feet', a: true),
    Questions(q: 'A slug\'s blood is green', a: true),
  ];
  //The question number is a variable that keeps track of our questions displayed.
  int questionNumber = 0;

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
                questionBank[questionNumber].questionText,
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
                //The variable correctAnswer checks for the correct answer when picked
                //by the user
                bool correctAnswer = questionBank[questionNumber].questionAnswer;
                //The condition checks if the selected answer is true or false.
                if(correctAnswer == true){
                  print('The answer is right');
                }else{
                  print('The answer is wrong');
                }
                setState(() {
                  questionNumber++;
                  scoreKeeper.add(const Icon(
                    Icons.done,
                    color: Colors.green,
                    size: 25.0,
                  ));
                });
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
                //The variable correctAnswer checks for the correct answer when picked
                //by the user
                bool correctAnswer = questionBank[questionNumber].questionAnswer;
                //The condition checks if the selected answer is true or false.
                if(correctAnswer == false){
                  print('The answer is right');
                }else{
                  print('The answer is wrong');
                }
                setState(() {
                  questionNumber++;
                  scoreKeeper.add(const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 25.0,
                  ));
                });
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
