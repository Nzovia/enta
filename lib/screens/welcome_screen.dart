import 'package:enta/screens/create_user.dart';
import 'package:enta/screens/movies.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  //form key for validation
  final _formKey = GlobalKey<FormState>();

  //checkbox bool
  bool valueChecked = false;

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Movies()),);
        }, //anonymous function
        child: const Text(
          "Watch Movies",
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
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "ENTA",
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
                        "Read Terms and Conditions",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(children: <Widget>[
                        const SizedBox(
                          width: 10.0,
                        ),
                        Checkbox(
                            value: valueChecked,
                            checkColor: Colors.greenAccent,
                            shape: const CircleBorder(),
                            onChanged: (bool? value) {
                              setState(() {
                                valueChecked = value!;
                              });
                            }),
                        const Text(
                          'Accept the Terms and Conditions',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ]),
                      watchButton,
                      const SizedBox(
                        height: 15,
                      ),

                      //gesture detector
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateUser()
                          ),);
                        },
                        child: const Text(
                          "Try Out Enta",
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
      ),
    );
  }
}
