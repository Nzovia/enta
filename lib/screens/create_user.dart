import 'package:flutter/material.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  //parameters of the class
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controllers
  final userNameController = new TextEditingController();
  final emailAddressController = new TextEditingController();
  final userPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    //usernameField
    final userNameField = TextFormField(
      autofocus: false,
      controller: userNameController,
      keyboardType: TextInputType.name,
      //validator: ,
      onSaved: (value) {
        emailAddressController.text = value!;
      },
      textInputAction: TextInputAction.next,

      //styling the userName field
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //email field
    final emailAddressField = TextFormField(
      autofocus: false,
      controller: emailAddressController,
      keyboardType: TextInputType.emailAddress,
      //validator: ,
      onSaved: (value) {
        emailAddressController.text = value!;
      },
      textInputAction: TextInputAction.next,

      //styling the email field
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: userPasswordController,
      obscureText: true,
      //validator: ,
      onSaved: (value) {
        userPasswordController.text = value!;
      },
      textInputAction: TextInputAction.done,

      //styling the password field
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //registration button
    final registerButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.grey,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 200.0,
        onPressed: () {}, //anonymous function
        child: const Text(
          "Create",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );

    //designing our application
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
                          "assets/add_user.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "ENTA",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(
                        height: 45,
                      ),
                      userNameField,
                      const SizedBox(
                        height: 25,
                      ),
                      emailAddressField,
                      const SizedBox(
                        height: 25,
                      ),
                      passwordField,
                      const SizedBox(
                        height: 35,
                      ),
                      registerButton,
                      const SizedBox(
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
