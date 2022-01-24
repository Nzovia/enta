class UserModel {
  String? uid;
  String? username;
  String? email;
  String? imageUrl;

  //constructor
  UserModel({this.uid, this.username, this.email, this.imageUrl});

//receive data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      username: map['username'],
      email: map['email'],
      imageUrl: map['imageUrl'],
    );
  }

//sending data to the server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'imageUrl': imageUrl,
    };
  }
}
