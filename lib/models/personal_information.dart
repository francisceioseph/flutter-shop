import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalInformation {
  String fullName;
  String birthDate;
  String email;
  String phone;

  PersonalInformation();

  PersonalInformation.fromSnapshot(DocumentSnapshot snapshot)
      : fullName = snapshot.data['fullName'],
        birthDate = snapshot.data['birthDate'],
        email = snapshot.data['email'],
        phone = snapshot.data['phone'];

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'birthDate': birthDate,
      'email': email,
      'phone': phone,
    };
  }
}
