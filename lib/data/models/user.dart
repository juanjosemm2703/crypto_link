import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String profilePic;
  final String name;

  User({
    this.reference,
    required this.email,
    required this.name,
    required this.profilePic,
  });

  final DocumentReference? reference;

  User.fromMap(Map<String, dynamic> map, {required this.reference})
      : assert(map['name'] != null),
        assert(map['email'] != null),
        assert(map['profilePic'] != null),
        name = map['name'],
        email = map['email'],
        profilePic = map['profilePic'];

  User.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>,
            reference: snapshot.reference);
}
