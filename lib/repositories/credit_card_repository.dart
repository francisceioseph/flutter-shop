import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_shop/models/credit_card.dart';
import 'package:rxdart/rxdart.dart';

class CreditCardRepository {
  loadCreditCard() {
    return _user
        .switchMap(
          (FirebaseUser user) => _creditCards.document(user.uid).snapshots(),
        )
        .switchMap(_ensureCreditCardExistence)
        .map(
      (DocumentSnapshot snapshot) {
        return CreditCard.fromSnapshot(snapshot);
      },
    );
  }

  saveCreditCard(CreditCard creditCard) {
    _user
        .switchMap(
          (FirebaseUser user) => _creditCards
              .document(user.uid)
              .updateData(creditCard.toMap())
              .asStream(),
        )
        .take(1)
        .listen(print);
  }

  Stream<DocumentSnapshot> _ensureCreditCardExistence(
    DocumentSnapshot snapshot,
  ) {
    if (snapshot.exists) {
      return Stream.value(snapshot);
    }

    return _creditCards
        .document(snapshot.documentID)
        .setData({})
        .asStream()
        .switchMap<DocumentSnapshot>(
          (_) => _creditCards.document(snapshot.documentID).snapshots(),
        );
  }

  Stream<FirebaseUser> get _user =>
      FirebaseAuth.instance.currentUser().asStream();

  CollectionReference get _creditCards =>
      Firestore.instance.collection('cards');
}
