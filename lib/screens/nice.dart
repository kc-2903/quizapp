import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

class Nice extends StatefulWidget {
  static const String id = 'nice';
  @override
  State<StatefulWidget> createState() {
    return _NiceState();
  }
}

class _NiceState extends State {
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      'questionText':
          '1) Flutter is an open-source UI software development kit created by ______',
      'answers': [
        {'text': 'A) Apple', 'score': 0},
        {'text': 'B) Google', 'score': 10},
        {'text': 'C) Facebook', 'score': 0},
        {'text': 'D) Microsoft', 'score': 0}
      ]
    },
    {
      'questionText': '2) When did google release Flutter?',
      'answers': [
        {'text': 'A) Jun 2017', 'score': 0},
        {'text': 'B) Jun 2018', 'score': 0},
        {'text': 'C) May 2018', 'score': 0},
        {'text': 'D) May 2017', 'score': 10}
      ]
    },
    {
      'questionText': '3) Who is the founder of Microsoft?',
      'answers': [
        {'text': 'A) Steve Jobs', 'score': 0},
        {'text': 'B) Larry Page', 'score': 0},
        {'text': 'C) Bill Gates', 'score': 10},
        {'text': 'D) Elon Musk', 'score': 0}
      ]
    },
    {
      'questionText': '4) What can we do with Flutter?',
      'answers': [
        {'text': 'A) Develop Android Apps', 'score': 0},
        {'text': 'B) Develop iOS Apps', 'score': 0},
        {'text': 'C) Develop Web Apps', 'score': 0},
        {'text': 'D) All the above', 'score': 10}
      ]
    },
    {
      'questionText': '5) Programming Language used in Flutter is ________',
      'answers': [
        {'text': 'A) Dart', 'score': 10},
        {'text': 'B) Python', 'score': 0},
        {'text': 'C) Kotlin', 'score': 0},
        {'text': 'D) JavaScript', 'score': 0}
      ]
    },
    {
      'questionText': '6) What is the command need to run a flutter project?',
      'answers': [
        {'text': 'A) run', 'score': 0},
        {'text': 'B) flutter run', 'score': 10},
        {'text': 'C) flutter server run', 'score': 0},
        {'text': 'D) flutter', 'score': 0}
      ]
    },
    {
      'questionText': '7) Command to build a flutter apk ____',
      'answers': [
        {'text': 'A) apk build flutter', 'score': 0},
        {'text': 'B) flutter apk', 'score': 0},
        {'text': 'C) flutter build apk', 'score': 10},
        {'text': 'D) apk run', 'score': 0}
      ]
    },
    {
      'questionText':
          '8) Which function is used to manage the State of an app in Flutter?',
      'answers': [
        {'text': 'A) setState', 'score': 10},
        {'text': 'B) stateLoad', 'score': 0},
        {'text': 'C) useState', 'score': 0},
        {'text': 'D) None of the above', 'score': 0}
      ]
    },
    {
      'questionText': '9) Which Language Flutter and Dart were developed in?',
      'answers': [
        {'text': 'A) C#', 'score': 0},
        {'text': 'B) Swift', 'score': 0},
        {'text': 'C) Java', 'score': 0},
        {'text': 'D) C++', 'score': 10}
      ]
    },
    {
      'questionText': '10) Command to create a flutter project ______',
      'answers': [
        {'text': 'A) project_name create flutter', 'score': 0},
        {'text': 'B) project_name flutter create', 'score': 0},
        {'text': 'C) flutter create project_name', 'score': 10},
        {'text': 'D) create flutter project_name', 'score': 0}
      ]
    },
  ];
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('QUIZ'),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz, _questions.length * 10),
      ),
    );
  }
}
