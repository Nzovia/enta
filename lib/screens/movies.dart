import 'package:enta/screens/music.dart';
import 'package:flutter/material.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);


  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {

    //watch movies button
    final nextButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.greenAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 200.0,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Music()),
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
      //appBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
                        "Movies",
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
                          "assets/popcorn.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      const Text(
                        "Enjjoy your movies, series,"
                            " animes and Trailers from your "
                            "personal devices",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),

                      nextButton,
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
