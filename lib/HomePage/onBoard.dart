
import 'package:flutter/material.dart';
import 'package:signarabiclanguagee/HomePage/bodyHome/body.dart';
// Next Page
class OnBoardScreen extends StatelessWidget {
  static String routeName = "/OnBoarding";

  const OnBoardScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen

    return const Scaffold(
      backgroundColor: Color.fromRGBO(0, 36, 62, 1),
      body: Body(
      ),
    );
  }
}