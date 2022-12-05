import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class wordSign extends StatefulWidget {
  const wordSign({Key key}) : super(key: key);

  @override
  State<wordSign> createState() => _wordSignState();
}

class _wordSignState extends State<wordSign> {
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
      initialUrl: 'https://www.signasl.org/sign',
    );
  }
}
