import 'package:flutter/material.dart';
import 'package:signarabiclanguagee/activityPage/AvatarCards/cardmodeln.dart';
import 'package:signarabiclanguagee/activityPage/AvatarCards/myData.dart';
class categoriesState extends StatelessWidget {
String perType;
categoriesState(this.perType, {Key key}) : super(key: key);
var myData = MyData();
List listOfCategory = [
  'العائلة',
  'الاماكن',
  'التعبيرات',
  'الوقت',
  'المشاعر',
  'الطعام',
  'طلب',
  'ملابس',
  'الارقام',
  'الالوان',
];
List catIcon = [
  Icons.family_restroom,
  Icons.place_rounded,
  Icons.emoji_people_outlined,
  Icons.timelapse_sharp,
  Icons.emoji_emotions,
  Icons.food_bank_rounded,
  Icons.volunteer_activism_outlined,
  Icons.checkroom_outlined,
  Icons.format_list_numbered_rtl_rounded,
  Icons.color_lens_outlined,
];

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85),
        child: Container(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Text(
                  "فئات",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
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
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                childAspectRatio: 8 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: listOfCategory.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                  onTap: () {
                      if (listOfCategory[index] == 'العائلة') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardsModelNormal(myData.family)));
                      } else if (listOfCategory[index] == 'التعبيرات') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardsModelNormal(myData.expressions)));
                      } else if (listOfCategory[index] == 'الاماكن') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardsModelNormal(myData.places)));
                      } else if (listOfCategory[index] == 'الوقت') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardsModelNormal(myData.time)));
                      } else if (listOfCategory[index] == 'طلب') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardsModelNormal(MyData().requests)));
                      } else if (listOfCategory[index] == 'الطعام') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardsModelNormal(MyData().food)));
                      } else if (listOfCategory[index] == 'المشاعر') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardsModelNormal(MyData().feelings)));
                      } else if (listOfCategory[index] == 'ملابس') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardsModelNormal(MyData().clothes)));
                      } else if (listOfCategory[index] == 'الالوان') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardsModelNormal(MyData().colors)));
                      } else if (listOfCategory[index] == 'الارقام') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CardsModelNormal(MyData().numbers)));
                      }

                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Icon(
                            catIcon[index],
                            size: 44,
                            color: Colors.white,
                          ),
                          Text(
                            listOfCategory[index],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [
                            //0.1,
                            0.9999999,
                            0.1,
                          ],
                          colors: [
                            Color(0xFF713094),
                            Color(0xFFBE12E3),
                          ],
                        ),

                        borderRadius: BorderRadius.circular(30)),
                  ));
            }),
      ),
    ),
  );
}
}