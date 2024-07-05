import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grow/ball.dart';
import 'package:grow/bricks.dart';
import 'package:grow/gameOver.dart';
import 'package:grow/player.dart';
import 'package:grow/startscreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

enum direction { UP, DOWN, LEFT, RIGHT }

class _HomepageState extends State<Homepage> {
// ball variables
  double ballx = 0;
  double bally = 0;
  double ballxinc = 0.015;
  double ballyinc = 0.01;
  var ballyDirection = direction.DOWN;
  var ballxDirection = direction.LEFT;
// player variables

  double playerx = -0.2;
  double playerWidth = 0.4; // out of 2

// game settings
  bool hasGameStarted = false;
  bool isGameOver = false;

// brick variables
  static double fbrickx = -1 + wallGap;
  static double fbricky = -0.9;
  static double brickWidth = 0.4;
  static double brickHeight = 0.05;
  static double brickGap = 0.01;
  static int numberofBricksInRow = 4;
  static double wallGap = 0.5 *
      (2 -
          numberofBricksInRow * brickWidth -
          (numberofBricksInRow - 1) * brickGap);
  // bool brickBroken = false;

  List MyBricks = [
    // [x ,y , broken = true/false]
    [fbrickx + 0 * (brickWidth + brickGap), fbricky, false],
    [fbrickx + 1 * (brickWidth + brickGap), fbricky, false],
    [fbrickx + 2 * (brickWidth + brickGap), fbricky, false],
    [fbrickx + 3 * (brickWidth + brickGap), fbricky, false],
  ];

  void startGame() {
    hasGameStarted = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      // update direction
      updateDirection();
      // move ball
      moveBall();
      // check if player dead
      if (isPlayerDead()) {
        timer.cancel();
        isGameOver = true;
      }
      checkForBrokenBricks();
    });
  }

  // check if brick is hit
  void checkForBrokenBricks() {
 
    // checks for when ball is inside teh brick (aka hits brick)
    for (int i = 0; i < MyBricks.length; i++) {
      if (ballx >= MyBricks[i][0] &&
          ballx <= MyBricks[i][0] + brickWidth &&
          bally <= MyBricks[i][1] + brickHeight &&
          MyBricks[i][2] == false) {
          MyBricks[i][2] = true;
           setState(() {
           MyBricks[i][2] = true;
           ballyDirection = direction.DOWN;
           });
        // since brick is broken , update direction of ball
        // based on which side of the brick is hit

        // to do this , calculate the distance of the ball from each of the 4 side
        // the smallest distance is the side the ball has hit

        double leftSideDist = (MyBricks[i][0] - ballx).abs();
        double rightSideDist = (MyBricks[i][0] - brickWidth).abs();
        double topSideDist = (MyBricks[i][1] - bally).abs();
        double bottomSideDist = (MyBricks[i][1] - brickHeight).abs();

        String min =
            findMin(leftSideDist, rightSideDist, topSideDist, bottomSideDist);

        switch (min) {
          case 'left':
            ballxDirection = direction.LEFT;
            break;

          case 'right':
            ballxDirection = direction.RIGHT;
            break;

          case 'up':
            ballyDirection = direction.UP;
            break;

          case 'down':
            ballyDirection = direction.DOWN;
            break;
        }
      }
    }
  }

  String findMin(double a, double b, double c, double d) {
    List<double> myList = [a, b, c, d];

    double currentMin = a;
    for (int i = 0; i < myList.length; i++) {
      if (myList[i] < currentMin) {
        currentMin = myList[i];
      }
    }

    if ((currentMin - a).abs() < 0.01) {
      return 'left';
    } else if ((currentMin - b).abs() < 0.01) {
      return 'right';
    } else if ((currentMin - c).abs() < 0.01) {
      return 'top';
    } else if ((currentMin - d).abs() < 0.01) {
      return 'bottom';
    }

    return '';
  }

  bool isPlayerDead() {
    if (bally >= 1) {
      return true;
    }
    return false;
  }

  void moveBall() {
    setState(() {
      // move horizontally
      if (ballxDirection == direction.LEFT) {
        ballx -= ballxinc;
      } else if (ballxDirection == direction.RIGHT) {
        ballx += ballxinc;
      }

      // move vertically

      if (ballyDirection == direction.DOWN) {
        bally += ballyinc;
      } else if (ballyDirection == direction.UP) {
        bally -= ballyinc;
      }
    });
  }

  // update direction of the ball
  void updateDirection() {
    setState(() {
// ball goes up when it hits player
      if (bally >= 0.9 && ballx >= playerx && ballx <= playerx + playerWidth) {
        ballyDirection = direction.UP;
      }
// ball goes down when it hits the top of the screen
      else if (bally <= -1) {
        ballyDirection = direction.DOWN;
      }
// ball goes left when it hits the right wall
      if (ballx >= 1) {
        ballxDirection = direction.LEFT;
      }
// ball goes right when it hits left wall
      else if (ballx <= -1) {
        ballxDirection = direction.RIGHT;
      }
    });
  }

  void moveleft() {
    setState(() {
      if (!(playerx - 0.1 <= -1)) {
        playerx -= 0.2;
      }
    });
  }

  void moveright() {
    setState(() {
      if (!(playerx + playerWidth >= 1)) {
        playerx += 0.2;
      }
    });
  }

  void resetGame(){
  setState(() {
    playerx = -0.2;
    ballx = 0;
    bally = 0;
    isGameOver = false;
    hasGameStarted = false;
    MyBricks = [
    [fbrickx + 0 * (brickWidth + brickGap), fbricky, false],
    [fbrickx + 1 * (brickWidth + brickGap), fbricky, false],
    [fbrickx + 2 * (brickWidth + brickGap), fbricky, false],
    [fbrickx + 3 * (brickWidth + brickGap), fbricky, false],
    ];
  });}

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKey: (event) {
          // ignore: deprecated_member_use
          if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
            moveleft();
            // ignore: deprecated_member_use
          } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
            moveright();
          }
        },
        child: GestureDetector(
          onTap: startGame,
          child: Scaffold(
              backgroundColor: Colors.deepPurple[100],
              body: Center(
                  child: Stack(
                children: [
                  // Tap to play
                  StartScreen(hasGameStarted: hasGameStarted),

                  // Game Over
                  GameOver(isGameOver: isGameOver , function : resetGame),

                  // Ball
                  MyBall(
                    ballx: ballx,
                    bally: bally,
                    hasGameStarted : hasGameStarted,
                    isGameOver : isGameOver,
                  ),

                  // player
                  MyPlayer(
                    playerx: playerx,
                    playerWidth: playerWidth,
                  ),

                  // Where is playerx exactly?

                  Container(
                      alignment: Alignment(playerx, 0.9),
                      child: Container(
                        color: Colors.red,
                        width: 4,
                        height: 15,
                      )),

                  Container(
                      alignment: Alignment(playerx + playerWidth, 0.9),
                      child: Container(
                        color: const Color.fromARGB(255, 54, 244, 127),
                        width: 4,
                        height: 15,
                      )),
                  // Bricks
                  MyBrick(
                    brickx: MyBricks[0][0],
                    bricky: MyBricks[0][1],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: MyBricks[0][2],
                  ),
                  MyBrick(
                    brickx: MyBricks[1][0],
                    bricky: MyBricks[1][1],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: MyBricks[1][2],
                  ),
                  MyBrick(
                    brickx: MyBricks[2][0],
                    bricky: MyBricks[2][1],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: MyBricks[2][2],
                  ),
                  MyBrick(
                    brickx: MyBricks[3][0],
                    bricky: MyBricks[3][1],
                    brickWidth: brickWidth,
                    brickHeight: brickHeight,
                    brickBroken: MyBricks[3][2],
                  ),
                ],
              ))),
        ));
  }
}
