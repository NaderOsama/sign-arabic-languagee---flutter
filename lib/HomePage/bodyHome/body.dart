import 'package:flutter/material.dart';
import 'package:signarabiclanguagee/HomePage/bodyHome/title.dart';
import 'package:signarabiclanguagee/registrationPage/widgets/ButtonOrignal.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int myCurrentPage = 0;
  List<Map<String, String>> pages = [
    // First Page
    {"text": "مرحبا بك فى عالم الاشارات ", "image": "assets/logo.png"},

    // Second Page
    {
      "text": "  الشخص الطبيعى, يمكنه فهم لغة الاشارة "
          "والتواصل معهم بسهولة والتعرف عليها "
          " وتحويلها ألى نص يمكن فهمه  ",
      "image": "assets/Chat3.png"
    },

    // Third Page
    {
      "text": "التواصل بسهولة مع الصم والبكم من خلال الاشارات التى يتم عرضها ",
      "image": "assets/Chat1.png"
    },

    // Fourth Page
    {
      "text":
          "  يمكن للشخص العادى التعلم من خلال اشكال كارتونية ولافتات تعبر عما يريدون ",
      "image": "assets/Chat2.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4, // distance between img and text
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    myCurrentPage = value;
                  });
                },
                itemCount: pages.length,
                itemBuilder: (context, index) => TitleHead(
                  img: pages[index]["image"],
                  txt: pages[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 1, // distance between img and button
              child: Column(
                children: <Widget>[
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      pages.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const Spacer(flex: 10),
                  ButtonOrignal(
                    textHome: 'ابدأ',
                    onPressed: () => Navigator.of(context).pushNamed('login'),
                    bgColor: Colors.white,
                    textColor: Colors.black,
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// Navigating between pages from 0 to 3
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      margin: const EdgeInsets.only(right: 7),
      height: 7,
      width: myCurrentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: myCurrentPage == index
            ? const Color.fromRGBO(0, 48, 148, 1)
            : const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
