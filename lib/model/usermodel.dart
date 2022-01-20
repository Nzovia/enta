class UserModel {
  String? uid;
  String? username;
  String? email;
  // String? password;

  //constructor
  UserModel({this.uid, this.username, this.email});

//receive data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
      // password: map['password'],
    );
  }

//sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      // 'password': password,
    };
  }
}
