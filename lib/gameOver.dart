import 'package:flutter/material.dart';


class GameOver extends StatelessWidget{
final bool isGameOver;
final function;


GameOver({required this.isGameOver , this.function});

@override
Widget build(BuildContext context) {
return isGameOver ? Stack(
  children : [ 
  Container(
  alignment: Alignment(0,-0.3),
  child : Text('G A M E  O V E R',
  style: TextStyle(
  fontFamily: 'press',
  fontSize: 24,
  color: Colors.deepPurple
  )),
  ),
  Container(
  alignment: Alignment(0,0),
  child : GestureDetector(
  onTap: function ,
  child : ClipRRect(
  borderRadius : BorderRadius.circular(12),
  child: Container(
  color : Colors.deepPurple,
  padding :   EdgeInsets.all(10),
  child : Text(
  'PLAY AGAIN',
  style: TextStyle(color : Colors.white),)),
  )
  )
  ),
  ]
) : Container();
}
}