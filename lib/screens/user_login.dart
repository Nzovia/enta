import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  //form key for validation
  final _formKey = GlobalKey<FormState>();

  //editing controllers
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  //calling firebase
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,

      //validate email field
      validator: (value){
        if(value!.isEmpty){
          return ("Email is required");
        }
      },

      //reg expression for email validation
      if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`"
        r"{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatchValue(value){
        return ("Kindly enter a valid email!!";)
    })
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,

      //styling the email field
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      //validator: ,
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,

      //styling the password field
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //login button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.greenAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 200.0,
        onPressed: () {

        }, //anonymous function
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );

    //Bringing together our UI widgets
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
                      SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/popcorn.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "ENTA",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      emailField,
                      SizedBox(
                        height: 25,
                      ),
                      passwordField,
                      SizedBox(
                        height: 35,
                      ),
                      loginButton,
                      SizedBox(
                        height: 15,
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
