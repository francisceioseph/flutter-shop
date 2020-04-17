import 'package:cloud_firestore/cloud_firestore.dart';

class CreditCard {
  String id;
  String ownerName;
  String number;
  String expiresAt;
  String cvc;

  CreditCard();

  CreditCard.fromSnapshot(DocumentSnapshot snapshot)
      : id = snapshot.documentID,
        ownerName = snapshot.data['ownerName'],
        number = snapshot.data['number'],
        expiresAt = snapshot.data['expiresAt'],
        cvc = snapshot.data['cvc'];

  Map<String, dynamic> toMap() {
    return {
      'ownerName': ownerName,
      'number': number,
      'expiresAt': expiresAt,
      'cvc': cvc,
    };
  }
}
