import 'package:flutter/material.dart';
class TitleHead extends StatelessWidget {
  const TitleHead({Key key, this.txt, this.img,}) : super(key: key);
  final String txt, img;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        const Text("مجتمع الصم والبكم", style: TextStyle(fontSize: (36),
          color: Colors.white, fontWeight: FontWeight.bold,),
        ),

        const Padding(padding: EdgeInsets.only(bottom: 20)),

        Text(txt, style: const TextStyle(fontSize: (25), color: Colors.white54,),
          textAlign: TextAlign.center,),
        const Spacer(flex: 3), Image.asset(img, height: (265), width: (235),
        ),
      ],
    );
  }
}


