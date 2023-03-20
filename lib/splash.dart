import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nubiaville/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
bool isTypingAnimationStarted = false;
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  TyperAnimatedTextKit(

                    speed: Duration(milliseconds: 50),
                    text: ['Nubiaville'],
                    textStyle: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    repeatForever: false,
                    onFinished: (){
                      Get.to(()=>  Home());
                    },

                  ),
              ],
            )
          ],
        )
      ),
    );
  }

  void startTypingAnimation() {
    setState(() {
      // Set a boolean variable to true to trigger the animation
      isTypingAnimationStarted = true;
    });
  }
}