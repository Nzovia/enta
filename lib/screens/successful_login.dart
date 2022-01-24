import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enta/model/usermodel.dart';
import 'package:enta/screens/create_user.dart';
import 'package:enta/widgets/appbar.dart';
import 'package:enta/widgets/profile_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'onboarding_screen.dart';

class SuccessfulLogin extends StatefulWidget {
  const SuccessfulLogin({Key? key}) : super(key: key);

  @override
  _SuccessfulLoginState createState() => _SuccessfulLoginState();
}

class _SuccessfulLoginState extends State<SuccessfulLogin> {
//fireStore Connection and get currentLoggedIn User
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedUser = UserModel();

//fetch fireStore data by userid
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid) //get values for the user
        .get()
        .then((value) {
      loggedUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //update button
    final watchButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.greenAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 200.0,
        onPressed: () {
          upDateData(
            uid: 'uid',
            email: 'email',
            username: 'username',

          );
        }, //anonymous function

        child: const Text(
          "Update",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );

    //Bringing together our UI widgets, all widgets container
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
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
                    // //userIcon
                    SizedBox(
                      height: 150,
                      child: ClipOval(
                        child: Image.network("${loggedUser.imageUrl}",
                        width: 150.0,
                          height: 150.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    Text(
                      "${loggedUser.username}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w900,
                        fontSize: 50,
                      ),
                    ),

                    Text(
                      "${loggedUser.email}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w200,
                        fontSize: 17,
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
                    ActionChip(
                        backgroundColor: Colors.transparent,
                        label: const Text(
                          "log Out account",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          logout(context);
                        }),
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

  //logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Fluttertoast.showToast(msg: "logOut successful");
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const OnboardingScreen()),
    );
  }

  //updating data in the firebase
  Future<void> upDateData({
    required String username,
    required String email,
    required String uid,
  }) async {
    Map<String, dynamic> data = <String, dynamic>{
      "username": username,
      "email": email,
    };
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('users').doc(uid);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateUser()),
    );

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }
}
