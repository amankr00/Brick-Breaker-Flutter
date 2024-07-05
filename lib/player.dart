import 'package:flutter/material.dart';
import 'package:grow/homepage.dart';

class MyPlayer extends StatelessWidget {
  final playerx;
  final playerWidth;

  MyPlayer({this.playerx, this.playerWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment:
            Alignment((2 * playerx + playerWidth) / (2 - playerWidth), 0.9),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.deepPurple,
            height: 10,
            width: MediaQuery.of(context).size.width * playerWidth / 2,
          ),
        ));
  }
}
