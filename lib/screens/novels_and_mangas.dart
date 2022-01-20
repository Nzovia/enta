import 'package:enta/screens/create_user.dart';
import 'package:flutter/material.dart';

class NovelsAndMangas extends StatelessWidget {
  const NovelsAndMangas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //watch movies button
    final novelButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.greenAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 200.0,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateUser()),
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

    //bring widgets together
    return Scaffold(
      backgroundColor: Colors.white,
      //appbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: (){
            //passing this to the previous
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
                      "Novels & Mangas",
                      textAlign: TextAlign.center,
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
                        "assets/book.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    const Text(
                      "Book readers with this feature can enjoy the favorite"
                      " novels and mangas straight from your device",
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
                    novelButton,
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
