import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int totalSecondsInit = 3;
  static int resetSecondsInit = 1;
  int totalSeconds = totalSecondsInit;
  int round = 0;
  bool isRunning = false;
  bool isRest = false;
  //bool isRest = false; 타입에 따라 색바꾸기 시간도 다른걸로 하나 . 더추가
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      onPause();
      setState(() {
        onRest();
        round = round + 1;

        //25분 후에 5분 휴식시간 갖기 새로운 불을 만들어야함 상태이름 isRest
      });
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onRest() {
    setState(() {
      isRest = true;
      totalSeconds = resetSecondsInit;
    });
  }

  void onPause() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onPress() {
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    //0:24:24.00000
    return duration.toString().substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //comp: time
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.bottomCenter,
            // decoration: const BoxDecoration(color: Colors.red),
            child: Text(format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 56,
                  fontWeight: FontWeight.w700,
                )),
          ),
        ),

        //comp: button
        Flexible(
          flex: 2,
          child: Center(
            child: IconButton(
                color: Theme.of(context).cardColor,
                iconSize: 120,
                onPressed: isRunning ? onPause : onPress,
                icon: Icon(isRunning ? Icons.pause_circle : Icons.play_circle)),
          ),
        ),
        //comp: footer
        Flexible(
          flex: 1,
          child: Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //round
                  Text(
                    "round: $round",
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                    ),
                  ),
                  //goal
                  const Text(
                    "2",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
