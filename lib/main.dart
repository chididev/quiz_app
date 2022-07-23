import 'package:flutter/material.dart';

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
  //The buttonBuilder function builds out our True and false buttons.
  //It takes in the buttonText and buttonColor as inputs.
  Expanded buttonBuilder(
      {required String buttonText, required Color buttonColor}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: buttonColor,
          ),
          onPressed: () {},
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
  // The iconBuilder builds our icons which are going to indicate
  //  our quiz score as we start answering the quizzes.
  //It takes in the iconName and iconColor as inputs.
  Icon iconBuilder({required IconData iconName, required Color iconColor}){
    return Icon(
      iconName,
      color: iconColor,
      size: 25.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'This is where the quiz questions would go.',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        buttonBuilder(buttonText: 'True', buttonColor: Colors.green),
        buttonBuilder(buttonText: 'False', buttonColor: Colors.red),
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: iconBuilder(iconName: Icons.done, iconColor: Colors.green),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: iconBuilder(iconName: Icons.close, iconColor: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
