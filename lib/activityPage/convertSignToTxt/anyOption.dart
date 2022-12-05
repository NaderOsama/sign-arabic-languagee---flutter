import 'package:flutter/material.dart';
import 'package:signarabiclanguagee/activityPage/convertSignToTxt/imagePredict.dart';
import 'package:signarabiclanguagee/activityPage/convertSignToTxt/prediction.dart';

class anyOption extends StatefulWidget {
  const anyOption({Key key}) : super(key: key);

  @override
  State<anyOption> createState() => _anyOptionState();
}

class _anyOptionState extends State<anyOption> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Container(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Text(
                    "ماذا تريد؟",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white70,
                    ),
                  ),
                )
              ],
            ),
            decoration: const BoxDecoration(
                color: Color.fromRGBO(90, 1, 148, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0))),
          ),
        ),
        backgroundColor: const Color.fromRGBO(36, 36, 62, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: FlatButton(
                      color: const Color.fromRGBO(113, 48, 148, 1),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CameraApp(),
                          ),
                        );
                      },
                      child: const Text(
                        ' تحويل لغة الاشارة من خلال الكاميرا',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),


            const SizedBox(height: 50),
            Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: FlatButton(
                      color: const Color.fromRGBO(113, 48, 148, 1),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const imageP(),
                          ),
                        );
                      },
                      child: const Text(
                        ' تحويل لغة الاشارة من خلال الصور',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
