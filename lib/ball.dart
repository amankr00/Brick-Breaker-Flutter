
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';



class MyBall extends StatelessWidget {
  final ballx;
  final bally;
  final hasGameStarted;
  final isGameOver;

  MyBall({this.ballx , this.bally , this.hasGameStarted , this.isGameOver});

  @override
  Widget build(BuildContext context) {
    return hasGameStarted ? 
     Container(
                  alignment: Alignment(ballx, bally),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple, 
                        shape: BoxShape.circle),
                  )) : 
                  Container(
                  alignment: Alignment(ballx, bally),
                  child : AvatarGlow(
                  glowRadiusFactor : 7.0,
                  glowShape : BoxShape.circle,
                  child: Material(
                  elevation: 2.0,
                  shape : CircleBorder(),
                  child: CircleAvatar(
                  backgroundColor: Colors.deepPurple[100],
                  child : Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color : Colors.deepPurple),
                  ),
                  radius : 7.0,
                  )

                  ))
                 
                  );
  }
}
