import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz_app/screens/welcome_screen.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  final _firestore = Firestore();
  final _auth = FirebaseAuth.instance;
  dynamic loginUser;

  @override
  // ignore: override_on_non_overriding_member
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loginUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  dynamic resultScore;
  dynamic reslen;
  dynamic resetHandler;
  String get resultPhrase {
    String resultText;
    resultText = 'You scored $resultScore out of $reslen.';
    return resultText;
  }

  Result(dynamic resSc, dynamic resfun, dynamic reslen) {
    this.resultScore = resSc;
    this.resetHandler = resfun;
    this.reslen = reslen;
  }
  @override
  Widget build(BuildContext context) {
    getCurrentUser();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Thank You for attempting the Quiz! \n You have Succesfully completed the quiz.',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.green),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              'Finish Quiz',
              style: TextStyle(fontSize: 25),
            ),
            onPressed: () {
              resetHandler();
              _firestore
                  .collection('scores')
                  .add({'score': resultScore, 'student': loginUser.email});
              _auth.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  ModalRoute.withName(WelcomeScreen.id));
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.lightBlueAccent),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
