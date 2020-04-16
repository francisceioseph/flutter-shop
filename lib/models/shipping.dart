import 'package:cloud_firestore/cloud_firestore.dart';

class Shipping {
  String id;
  String fullName;
  String address;
  String country;
  String state;
  String city;
  String zip;

  Shipping();

  Shipping.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.documentID,
        fullName = snapshot.data['fullName'],
        address = snapshot.data['address'],
        country = snapshot.data['country'],
        state = snapshot.data['state'],
        city = snapshot.data['city'],
        zip = snapshot.data['zip'];

  toJson() {
    return {
      'fullName': fullName,
      'address': address,
      'country': country,
      'state': state,
      'city': city,
      'zip': zip,
    };
  }
}
