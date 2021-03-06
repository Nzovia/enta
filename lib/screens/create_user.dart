import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enta/components/widgets/appbar.dart';
import 'package:enta/model/usermodel.dart';
import 'package:enta/screens/user_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:image_picker/image_picker.dart";
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage; //for file upload

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  //firebase
  final _auth = FirebaseAuth.instance;
  FirebaseStorage storageReference = FirebaseStorage.instance;

  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controllers
  final userNameController = new TextEditingController();
  final emailAddressController = new TextEditingController();
  final userPasswordController = new TextEditingController();

  //image properties to enhance 'dart:io' library
  File? _pickedImage;
  String? _uploadedFileURL;
  final uploadId = DateTime.now().microsecondsSinceEpoch.toString();

  @override
  Widget build(BuildContext context) {
    //usernameField
    final userNameField = TextFormField(
      autofocus: false,
      controller: userNameController,
      keyboardType: TextInputType.name,

      //validator (usernameField validation)
      validator: (value) {
        RegExp regExp = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("user is required");
        }
        if (!regExp.hasMatch(value)) {
          return ("enter username minimum of 3 characters");
        }
        return null;
      },

      onSaved: (value) {
        emailAddressController.text = value!;
      },
      textInputAction: TextInputAction.next,

      //styling the userName field
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //email field
    final emailAddressField = TextFormField(
      autofocus: false,
      controller: emailAddressController,
      keyboardType: TextInputType.emailAddress,

      //validator (validate emailField)
      validator: (value) {
        if (value!.isEmpty) {
          return ("Email is required");
        }

        //reg expression for email validation
        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`"
                r"{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          return ("Kindly enter a valid email!!");
        }
        //if the field has nothing
        return null;
      },
      onSaved: (value) {
        emailAddressController.text = value!;
      },
      textInputAction: TextInputAction.next,

      //styling the email field
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );

    //password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: userPasswordController,
      obscureText: true,

      //password validator, telling the user to enter minimum of six characters
      validator: (value) {
        RegExp regExp = RegExp(r'^>{6},$');
        if (value!.isEmpty) {
          return ("password is required");
        }
        if (regExp.hasMatch(value)) {
          return ("enter password, minimum of 6 characters");
        }
        //if the field has nothing
        return null;
      },
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
      color: Colors.lightGreen,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: 200.0,

        //assigning createUser function to the registerButton
        onPressed: () {
          createUser(emailAddressController.text, userPasswordController.text);

          if(_pickedImage!= null){
            uploadFile();
          }else{
            Fluttertoast.showToast(msg: "No image selected");
          }

        }, //anonymous function
        child: const Text(
          "Create",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
    );

    //designing our application
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
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
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 70,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: _pickedImage == null
                              ? null
                              : FileImage(_pickedImage!),
                          radius: 68,
                          child: IconButton(
                            // remove default padding here
                            padding: EdgeInsets.zero,
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              pickImage();
                            },
                          ),
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
                      Row(children: <Widget>[
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 17,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UserLogin()));
                          },
                          child: const Text(
                            " Login",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        )
                      ]),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //user creation function
  Future createUser(String email, String password) async {
    //meaning -> if _formKey validation is successful, we wait for authentication
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(_uploadedFileURL)})
          .catchError((exception) {
            createUser(email, password);
           Fluttertoast.showToast(msg: "e!.message");
      });
    }
  }

  //picking image from internal story function
  Future pickImage() async {
    //code throws exception when user denies access permission
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => _pickedImage = imageTemporary);
    } on PlatformException catch (e) {
      print('Unable to pick image: $e');
    }
  }

  //uploading image file function
  Future uploadFile() async {
    // storageReference =
    //     firebase_storage.instance.ref().child('userimages/${uploadId}');
    firebase_storage.UploadTask uploadTask = firebase_storage.FirebaseStorage
        .instance
        .ref()
        .child('userimages/${uploadId}')
        .putFile(_pickedImage!);
  //  storageReference.putFile(_pickedImage!);

    try{
      firebase_storage.TaskSnapshot snapshot= await uploadTask;
      _uploadedFileURL = await snapshot.ref.getDownloadURL();
       postDetailsToFirestore(_uploadedFileURL);
    }on FirebaseException catch(e) {
      if (e.code == "request rejected");
    }
    // await uploadTask.then((fileURL) {
    //   setState(() {
    //     _uploadedFileURL = fileURL as String?;
    //
    //     postDetailsToFirestore(_uploadedFileURL);
    //   });
    //   print(_uploadedFileURL);
    // });
  }

  //the function adds data to the database
 Future postDetailsToFirestore(_uploadedFileURL) async {
    //calling  fireStore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    //calling UserModel
    UserModel userModel = UserModel();

    //sending these values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.username = userNameController.text;
    userModel.imageUrl = _uploadedFileURL;

    //add firebaseFirestore
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "user created successfully");
    //navigating to logicScreen
    Navigator.pushAndRemoveUntil((context),
        MaterialPageRoute(builder: (context) => UserLogin()), (route) => false);
  }
}
