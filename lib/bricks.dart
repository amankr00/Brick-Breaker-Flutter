import 'package:flutter/material.dart';

class MyBrick extends StatelessWidget{
final brickWidth;
final brickHeight;
final brickx;
final bricky;
final bool brickBroken;

MyBrick({this.brickHeight , this.brickWidth , this.brickx , this.bricky , required this.brickBroken });

  @override
  Widget build(BuildContext context) {
  return brickBroken ? 
  Container(): 
  Container(
                  alignment: Alignment((2 * brickx + brickWidth) / (2 - brickWidth) , bricky),
                  child : ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                  height: MediaQuery.of(context).size.height * brickHeight / 2,
                  width: MediaQuery.of(context).size.width * brickWidth / 2,
                  color : Colors.deepPurple,
                  ),));
  }
  }