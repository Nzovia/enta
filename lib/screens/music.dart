import 'package:enta/screens/novels_and_mangas.dart';
import 'package:flutter/material.dart';

class Music extends StatelessWidget {
  const Music({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //next button in music screen
    final musicButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.greenAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 200.0,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NovelsAndMangas()),
          );
        }, //anonymous function
        child: const Text(
          "Next",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );

    //Bringing together our UI widgets
    return Scaffold(
      backgroundColor: Colors.white,

      //app bar
      appBar:AppBar(
         backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: () {
            Navigator.of(context).pop();
        },
        ),
      ),
      //body of the app
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Music",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w900,
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 200,
                      child: Image.asset(
                        "assets/music.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    const Text(
                      "Enjoy your music, offline,"
                          " music and videos and even download",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),

                    musicButton,
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
