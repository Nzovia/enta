import 'package:enta/screens/create_user.dart';
import 'package:enta/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class SuccessLoginLogout extends StatelessWidget {
  const SuccessLoginLogout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //watch movies button
    final watchButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.greenAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 200.0,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateUser()),);
        }, //anonymous function
        child: const Text(
          "Update",
          textAlign: TextAlign.center,
          style:  TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );

    //Bringing together our UI widgets, all widgets container
    return Scaffold(
      backgroundColor: Colors.white,
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

                      //userIcon
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/user.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      const Text(
                        "Username",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w900,
                          fontSize: 50,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Book readers with this feature can enjoy the favorite"
                            "novels and mangas straight from your device",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      watchButton,
                      const SizedBox(
                        height: 15,
                      ),

                      //gesture detector
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()
                          ),);
                        },
                        child: const Text(
                          "Log out account",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
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
