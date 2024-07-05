
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  // const StartScreen({Key? key}) : super(key: key);\
  final bool hasGameStarted;

  StartScreen({required this.hasGameStarted});
   

  @override
  Widget build(BuildContext context) {
    return hasGameStarted ? Container():
     Container(
            alignment: Alignment(0,-0.1),
            child: Text('TAP TO PLAY',
            style: TextStyle(
            color: Colors.deepPurple[400]),),);
  }
}