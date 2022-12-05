import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class txtSign extends StatefulWidget
{
  const txtSign({Key key}) : super(key: key);

  @override
  _txtSignState createState() => _txtSignState();
}
class _txtSignState extends State<txtSign> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }


  @override
  Widget build(BuildContext context) {
    return const WebView(
       // https://lingojam.com/SignLanguageTranslator
      //
      // https://funtranslations.com/sign-language
      initialUrl: 'https://funtranslations.com/sign-language',
    );
  }
}
