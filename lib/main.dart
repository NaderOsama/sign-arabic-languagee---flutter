import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signarabiclanguagee/Logo/logo.dart';
import 'package:signarabiclanguagee/activityPage/option.dart';
import 'package:signarabiclanguagee/registrationPage/secondScreen.dart';

List<CameraDescription> cameras;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp();
  runApp(const SignLanguageApp());
}

// l contain sabt 3la 3ks StFul
class SignLanguageApp extends StatelessWidget {
  const SignLanguageApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'لغة الاشارة',
      debugShowCheckedModeBanner: false,
      // background is User Data
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          // fill color background data user
          fillColor: const Color(0xfff2f9fe),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),

          focusedBorder: OutlineInputBorder(
            // OutlineInputBorder = edges in User Data
            borderSide: const BorderSide(color: Colors.black12),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),

      home: const SplashScreen(),

      routes: {
        'home': (context) => const getStarted(),
        'login': (context) => const LogIn(authType: AuthType.login),
        'register': (context) => const LogIn(authType: AuthType.register),
      },
    );
  }
}
