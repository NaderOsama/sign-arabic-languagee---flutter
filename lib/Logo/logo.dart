import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:signarabiclanguagee/HomePage/onBoard.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:Column(
        children: [
          Lottie.asset('assets/hand-waving.json'),
          const SizedBox(height:4),
          const Text('تطبيق لغة الاشارة',style: TextStyle(fontSize: 30, fontWeight:FontWeight.bold,
              color: Colors.white),)],),
      backgroundColor: const Color.fromRGBO(36, 36, 62, 1),
      // next page
      nextScreen: const OnBoardScreen(),
      splashIconSize: 450,
      duration: 3000,
      splashTransition: SplashTransition.scaleTransition,
      animationDuration: const Duration(seconds: 1),

    );
  }
}
