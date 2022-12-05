import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:signarabiclanguagee/activityPage/AvatarCards/model.dart';

class CardsModelNormal extends StatelessWidget {
  final model data;
  const CardsModelNormal(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlutterTts flutterTts = FlutterTts();

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
                    "التواصل بلغة الاشارة",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w800,

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
        body: GridView.builder(
          gridDelegate:
              // Splitting AvatarCards
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: data.nameOfCards.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: FlipCard(
                  front: Card(
                    color: const Color.fromRGBO(113, 48, 148, 1),
                    elevation: 4,
                    shadowColor: const Color.fromRGBO(190, 18, 277, 1),
                    margin: const EdgeInsets.all(7),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(width: 0)),
                    child: Center(
                      child: InkWell(
                          onTap: () async {
                            await flutterTts.speak(data.nameOfCards[index]);
                          },
                          child: Text(
                            data.nameOfCards[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ),
                  back: Card(
                    color: const Color.fromRGBO(113, 48, 148, 1),
                    elevation: 4,
                    shadowColor: const Color.fromRGBO(190, 18, 277, 2),
                    margin: const EdgeInsets.all(10),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                      ),
                    ),
                    child: Image.network(
                      data.url[index],
                      // scale: 5,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}