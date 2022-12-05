import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:signarabiclanguagee/activityPage/AvatarCards/categories.dart';
import 'package:signarabiclanguagee/activityPage/convertSignToTxt/anyOption.dart';
import 'package:signarabiclanguagee/activityPage/convertTxtToSign/conversion.dart';

class getStarted extends StatefulWidget {
  const getStarted({Key key}) : super(key: key);

  @override
  _getStartedState createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  @override
  Widget build(BuildContext context) {
    String personType = 'Normal';
    // create the screen frame by Scaffold
    return Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                // one page
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Nav(),
                    ),
                  );
                },
                child: GFCard(
                  color: const Color(0xFF713094),
                  clipBehavior: Clip.antiAlias,
                  padding: const EdgeInsets.all(3),
                  elevation: 3,
                  height: 195,
                  boxFit: BoxFit.cover,
                  title: const GFListTile(
                    title: Center(
                      child: Text(
                        'تحويل النص الى لغة الاشارة',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  showImage: true,
                  image:
                      Image.asset('assets/Chat1.png', width: 110, height: 110),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const anyOption(),
                    ),
                  );
                },
                child: GFCard(
                  color: const Color.fromRGBO(113, 48, 148, 1),
                  clipBehavior: Clip.antiAlias,
                  padding: const EdgeInsets.all(3),
                  elevation: 3,
                  height: 195,
                  boxFit: BoxFit.cover,

                  title: const GFListTile(
                    title: Center(
                      child: Text(
                        'تحويل لغة الاشارة الى نص',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  showImage: true,
                  image:
                      Image.asset('assets/img1.png', width: 110, height: 110),
                ),
              ),


              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => categoriesState(personType),
                    ),
                  );
                },
                child: GFCard(
                  color: const Color.fromRGBO(113, 48, 148, 1),
                  clipBehavior: Clip.antiAlias,
                  padding: const EdgeInsets.all(3),
                  elevation: 3,
                  height: 195,
                  boxFit: BoxFit.cover,
                  title: const GFListTile(
                    title: Center(
                      child: Text(
                        'تعلم لغة الاشارة ',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  showImage: true,
                  image: Image.asset('assets/startImage.png',
                      width: 110, height: 110),
                ),
              ),
            ],
          ),
        ));
  }
}
