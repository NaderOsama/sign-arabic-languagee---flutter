import 'package:flutter/material.dart';
import 'package:signarabiclanguagee/activityPage/convertTxtToSign/wordSign.dart';
import 'package:signarabiclanguagee/activityPage/convertTxtToSign/txt_sign.dart';

class Nav extends StatefulWidget {
  const Nav({Key key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}
class _NavState extends State<Nav> {
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
        children:<Widget> [

        Row(
        children:<Widget> [
          Expanded(
        child: SizedBox(
          height: 80,
            child:FlatButton(

    color: const Color.fromRGBO(113, 48, 148, 1),
    onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const txtSign(),
        ),
      );
    },
    child: const Text(' تحويل الحروف الى لغة الاشارة',
      style: TextStyle(color: Colors.white,fontSize: 25,
        fontWeight: FontWeight.bold,),),
    ),),),],),


          const SizedBox(height: 50),
    Row(
    children:<Widget> [
    Expanded(
    child: SizedBox(
    height: 80,
    child:FlatButton(
    color: const Color.fromRGBO(113, 48, 148, 1),
      onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const wordSign(),
          ),
        );
      },
    child:const Text(' تحويل الكلمات الى لغة الاشارة',
    style: TextStyle(color: Colors.white,fontSize: 25,
    fontWeight: FontWeight.bold,),),
    ),),),],),


    ],
    ),
    ),
    );
  }}